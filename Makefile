ifneq (,)
.error This Makefile requires GNU Make.
endif

.PHONY: lint build rebuild test

# --------------------------------------------------------------------------------------------------
# VARIABLES
# --------------------------------------------------------------------------------------------------
CURRENT_DIR = $(dir $(abspath $(lastword $(MAKEFILE_LIST))))

DIR = .
FILE = Dockerfile
IMAGE = cytopia/terragrunt
TAG = latest
NO_CACHE=

TF_VERSION = latest
TG_VERSION = latest


# --------------------------------------------------------------------------------------------------
# DEFAULT TARGET
# --------------------------------------------------------------------------------------------------
help:
	@echo "lint                               Lint repository files"
	@echo "build [TF_VERSION=] [TG_VERSION=]  Build image"
	@echo "test [TF_VERSION=] [TG_VERSION=]   Test image"


# --------------------------------------------------------------------------------------------------
# LINT TARGETS
# --------------------------------------------------------------------------------------------------
lint:
	@docker run --rm -v $(CURRENT_DIR):/data cytopia/file-lint file-cr --text --ignore '.git/,.github/,tests/' --path .
	@docker run --rm -v $(CURRENT_DIR):/data cytopia/file-lint file-crlf --text --ignore '.git/,.github/,tests/' --path .
	@docker run --rm -v $(CURRENT_DIR):/data cytopia/file-lint file-trailing-single-newline --text --ignore '.git/,.github/,tests/' --path .
	@docker run --rm -v $(CURRENT_DIR):/data cytopia/file-lint file-trailing-space --text --ignore '.git/,.github/,tests/' --path .
	@docker run --rm -v $(CURRENT_DIR):/data cytopia/file-lint file-utf8 --text --ignore '.git/,.github/,tests/' --path .
	@docker run --rm -v $(CURRENT_DIR):/data cytopia/file-lint file-utf8-bom --text --ignore '.git/,.github/,tests/' --path .


# --------------------------------------------------------------------------------------------------
# BUILD TARGETS
# --------------------------------------------------------------------------------------------------
build:
	docker build $(NO_CACHE) \
		--build-arg TF_VERSION=$(TF_VERSION) \
		--build-arg TG_VERSION=$(TG_VERSION) \
		-t $(IMAGE) -f $(DIR)/$(FILE) $(DIR)

rebuild: _pull
rebuild: NO_CACHE=--no-cache
rebuild: build


# --------------------------------------------------------------------------------------------------
# TEST TARGETS
# --------------------------------------------------------------------------------------------------
test:
	@$(MAKE) --no-print-directory _test-tf-version
	@$(MAKE) --no-print-directory _test-tg-version
	@$(MAKE) --no-print-directory _test-tf
	@$(MAKE) --no-print-directory _test-tg

.PHONY: _test-tf-version
_test-tf-version:
	@echo "------------------------------------------------------------"
	@echo "- Testing correct Terraform version"
	@echo "------------------------------------------------------------"
	@if [ "$(TF_VERSION)" = "latest" ]; then \
		echo "Fetching latest version from HashiCorp release page"; \
		LATEST="$$( \
			curl -L -sS https://releases.hashicorp.com/terraform/ \
			| tac | tac \
			| grep -Eo '/[.0-9]+/' \
			| grep -Eo '[.0-9]+' \
			| sort -u \
			| sort -V \
			| tail -1 \
		)"; \
		echo "Testing for latest: $${LATEST}"; \
		if ! docker run --rm $(IMAGE) terraform --version | grep -E "^Terraform[[:space:]]*v?$${LATEST}$$"; then \
			echo "Failed"; \
			exit 1; \
		fi; \
	else \
		echo "Testing for tag: $(TF_VERSION)"; \
		if ! docker run --rm $(IMAGE) terraform --version | grep -E "^Terraform[[:space:]]*v?$(TF_VERSION)\.[.0-9]+$$"; then \
			echo "Failed"; \
			exit 1; \
		fi; \
	fi; \
	echo "Success"; \

.PHONY: _test-tg-version
_test-tg-version:
	@echo "------------------------------------------------------------"
	@echo "- Testing correct Terragrunt version"
	@echo "------------------------------------------------------------"
	@if [ "$(TG_VERSION)" = "latest" ]; then \
		echo "Fetching latest version from GitHub"; \
		LATEST="$$( \
			curl -L -sS https://github.com/gruntwork-io/terragrunt/releases \
			| tac | tac \
			| grep -Eo '/v[.0-9]+/' \
			| grep -Eo 'v[.0-9]+' \
			| sort -u \
			| sort -V \
			| tail -1 \
		)"; \
		echo "Testing for latest: $${LATEST}"; \
		if ! docker run --rm $(IMAGE) terragrunt --version | grep -E "^terragrunt[[:space:]]*version[[:space:]]*v?$${LATEST}$$"; then \
			echo "Failed"; \
			exit 1; \
		fi; \
	else \
		echo "Testing for tag: $(TG_VERSION)"; \
		if ! docker run --rm $(IMAGE) terragrunt --version | grep -E "^terragrunt[[:space:]]*version[[:space:]]*v?$(TG_VERSION)\.[.0-9]+$$"; then \
			echo "Failed"; \
			exit 1; \
		fi; \
	fi; \
	echo "Success"; \

.PHONY: _test-tf
_test-tf:
	@echo "------------------------------------------------------------"
	@echo "- Testing Terraform"
	@echo "------------------------------------------------------------"
	@if [ "$(TF_VERSION)" = "0.11" ]; then \
		if ! docker run --rm -v $(CURRENT_DIR)/tests/terraform/0.11:/data $(IMAGE) terraform fmt; then \
			echo "Failed"; \
			exit 1; \
		fi; \
	else \
		if ! docker run --rm -v $(CURRENT_DIR)/tests/terraform/0.xx:/data $(IMAGE) terraform fmt; then \
			echo "Failed"; \
			exit 1; \
		fi; \
	fi; \
	echo "Success";

.PHONY: _test-tg
_test-tg:
	@echo "------------------------------------------------------------"
	@echo "- Testing Terragrunt"
	@echo "------------------------------------------------------------"
	@if ! docker run --rm -v $(CURRENT_DIR)/tests/terragrunt:/data $(IMAGE) terragrunt terragrunt-info; then \
		docker run --rm -v $(CURRENT_DIR)/tests/terragrunt:/data $(IMAGE) sh -c "if test -d .terragrunt-cache; then rm -rf .terragrunt-cache; fi"; \
		echo "Failed"; \
		exit 1; \
	fi; \
	docker run --rm -v $(CURRENT_DIR)/tests/terragrunt:/data $(IMAGE) sh -c "if test -d .terragrunt-cache; then rm -rf .terragrunt-cache; fi"; \
	echo "Success";


# --------------------------------------------------------------------------------------------------
# HELPER TARGETS
# --------------------------------------------------------------------------------------------------
_pull:
	@grep -E '^\s*FROM' Dockerfile \
		| sed -e 's/^FROM//g' -e 's/[[:space:]]*as[[:space:]]*.*$$//g' \
		| xargs -n1 docker pull;


# --------------------------------------------------------------------------------------------------
# DEPLOY TARGETS
# --------------------------------------------------------------------------------------------------
.PHONY: tag
tag:
	docker tag $(IMAGE) $(IMAGE):$(TAG)


.PHONY: login
login:
	yes | docker login --username $(USER) --password $(PASS)

.PHONY: push
push:
	@$(MAKE) tag TAG=$(TAG)
	docker push $(IMAGE):$(TAG)
