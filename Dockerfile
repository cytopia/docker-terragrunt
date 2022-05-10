FROM alpine:3.13 as builder

# Install build dependencies
RUN set -eux \
	&& apk --no-cache add \
		curl \
		git \
		unzip

# Get Terraform
ARG TF_VERSION=latest
RUN set -eux \
	&& if [ "${TF_VERSION}" = "latest" ]; then \
		VERSION="$( curl -sS https://releases.hashicorp.com/terraform/ \
			| tac | tac \
			| grep -Eo '/terraform/[.0-9]+' \
			| grep -Eo '[.0-9]+' \
			| sort -V \
			| tail -1 )"; \
	else \
		VERSION="$( curl -sS https://releases.hashicorp.com/terraform/ \
			| tac | tac \
			| grep -Eo "/terraform/${TF_VERSION}\.[.0-9]+" \
			| grep -Eo '[.0-9]+' \
			| sort -V \
			| tail -1 )"; \
	fi \
	&& curl -sS -L -O \
		https://releases.hashicorp.com/terraform/${VERSION}/terraform_${VERSION}_linux_amd64.zip \
	&& unzip terraform_${VERSION}_linux_amd64.zip \
	&& mv terraform /usr/bin/terraform \
	&& chmod +x /usr/bin/terraform

# Get Terragrunt
ARG TG_VERSION=latest
RUN set -eux \
	&& git clone https://github.com/gruntwork-io/terragrunt /terragrunt \
	&& cd /terragrunt \
	&& if [ "${TG_VERSION}" = "latest" ]; then \
		VERSION="$( git describe --abbrev=0 --tags )"; \
	else \
		VERSION="$( git tag | grep -E "v${TG_VERSION}\.[.0-9]+" | sort -Vu | tail -1 )" ;\
	fi \
	&& curl -sS -L \
		https://github.com/gruntwork-io/terragrunt/releases/download/${VERSION}/terragrunt_linux_amd64 \
		-o /usr/bin/terragrunt \
	&& chmod +x /usr/bin/terragrunt

# Test binaries
RUN set -eux \
	&& terraform --version \
	&& terragrunt --version


# Use a clean tiny image to store artifacts in
FROM alpine:3.13
LABEL \
	maintainer="cytopia <cytopia@everythingcli.org>" \
	repo="https://github.com/cytopia/docker-terragrunt"
RUN set -eux \
	&& apk add --no-cache git openssh-client
COPY --from=builder /usr/bin/terraform /usr/bin/terraform
COPY --from=builder /usr/bin/terragrunt /usr/bin/terragrunt
COPY data/docker-entrypoint.sh /docker-entrypoint.sh

WORKDIR /data
CMD ["terragrunt", "--version"]
ENTRYPOINT ["/docker-entrypoint.sh"]
