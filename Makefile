ifneq (,)
.error This Makefile requires GNU Make.
endif

# Ensure additional Makefiles are present
MAKEFILES = Makefile.docker Makefile.lint
$(MAKEFILES): URL=https://raw.githubusercontent.com/devilbox/makefiles/master/$(@)
$(MAKEFILES):
	@if ! (curl --fail -sS -o $(@) $(URL) || wget -O $(@) $(URL)); then \
		echo "Error, curl or wget required."; \
		echo "Exiting."; \
		false; \
	fi
include $(MAKEFILES)

# Set default Target
.DEFAULT_GOAL := help


# -------------------------------------------------------------------------------------------------
# Default configuration
# -------------------------------------------------------------------------------------------------
# Own vars
TAG        = latest

# Makefile.docker overwrites
NAME       = tg
VERSION    = latest
IMAGE      = cytopia/terragrunt
FLAVOUR    = latest
FILE       = Dockerfile
DIR        = Dockerfiles

# Extract TF- and TG- version from VERSION string
ifeq ($(strip $(VERSION)),latest)
	TF_VERSION = latest
	TG_VERSION = latest
else
	TF_VERSION = $(subst TF-,,$(word 1, $(VERSION)))
	TG_VERSION = $(subst TG-,,$(word 2, $(VERSION)))
endif

# Building from master branch: Tag == 'latest'
ifeq ($(strip $(TAG)),latest)
	ifeq ($(strip $(VERSION)),latest)
		DOCKER_TAG = $(FLAVOUR)
	else
		ifeq ($(strip $(FLAVOUR)),latest)
			DOCKER_TAG = $(TF_VERSION)-$(TF_VERSION)
		else
			DOCKER_TAG = $(FLAVOUR)-$(TF_VERSION)-$(TG_VERSION)
		endif
	endif
# Building from any other branch or tag: Tag == '<REF>'
else
	ifeq ($(strip $(VERSION)),latest)
		ifeq ($(strip $(FLAVOUR)),latest)
			DOCKER_TAG = latest-$(TAG)
		else
			DOCKER_TAG = $(FLAVOUR)-latest-$(TAG)
		endif
	else
		ifeq ($(strip $(FLAVOUR)),latest)
			DOCKER_TAG = $(TF_VERSION)-$(TG_VERSION)-$(TAG)
		else
			DOCKER_TAG = $(FLAVOUR)-$(TF_VERSION)-$(TG_VERSION)-$(TAG)
		endif
	endif
endif

# Makefile.lint overwrites
FL_IGNORES  = .git/,.github/,tests/
SC_IGNORES  = .git/,.github/,tests/
JL_IGNORES  = .git/,.github/


# -------------------------------------------------------------------------------------------------
#  Default Target
# -------------------------------------------------------------------------------------------------
.PHONY: help
help:
	@echo "lint                                     Lint project files and repository"
	@echo
	@echo "build [ARCH=...] [TAG=...]               Build Docker image"
	@echo "rebuild [ARCH=...] [TAG=...]             Build Docker image without cache"
	@echo "push [ARCH=...] [TAG=...]                Push Docker image to Docker hub"
	@echo
	@echo "manifest-create [ARCHES=...] [TAG=...]   Create multi-arch manifest"
	@echo "manifest-push [TAG=...]                  Push multi-arch manifest"
	@echo
	@echo "test [ARCH=...]                          Test built Docker image"
	@echo


# -------------------------------------------------------------------------------------------------
#  Docker Targets
# -------------------------------------------------------------------------------------------------
.PHONY: build
build: ARGS+=--build-arg TF_VERSION=$(TF_VERSION)
build: ARGS+=--build-arg TG_VERSION=$(TG_VERSION)
build: docker-arch-build

.PHONY: rebuild
rebuild: ARGS+=--build-arg TF_VERSION=$(TF_VERSION)
rebuild: ARGS+=--build-arg TG_VERSION=$(TG_VERSION)
rebuild: docker-arch-rebuild

.PHONY: push
push: docker-arch-push


# -------------------------------------------------------------------------------------------------
#  Manifest Targets
# -------------------------------------------------------------------------------------------------
.PHONY: manifest-create
manifest-create: docker-manifest-create

.PHONY: manifest-push
manifest-push: docker-manifest-push


# -------------------------------------------------------------------------------------------------
#  Test Targets
# -------------------------------------------------------------------------------------------------
.PHONY: test
test: _test-tf-version
test: _test-tg-version
test: _test-tf
test: _test-tg

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
			| grep -Eo '/terraform/[.0-9]+/\"' \
			| grep -Eo '[.0-9]+' \
			| sort -u \
			| sort -V \
			| tail -1 \
		)"; \
		echo "Testing for latest: $${LATEST}"; \
		if ! docker run --rm --platform $(ARCH) $(IMAGE):$(DOCKER_TAG) terraform --version | grep -E "^Terraform[[:space:]]*v?$${LATEST}$$"; then \
			echo "Failed"; \
			exit 1; \
		fi; \
	else \
		echo "Testing for tag: $(TF_VERSION)"; \
		if ! docker run --rm --platform $(ARCH) $(IMAGE):$(DOCKER_TAG) terraform --version | grep -E "^Terraform[[:space:]]*v?$(TF_VERSION)\.[.0-9]+$$"; then \
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
		if ! docker run --rm --platform $(ARCH) $(IMAGE):$(DOCKER_TAG) terragrunt --version | grep -E "^terragrunt[[:space:]]*version[[:space:]]*v?$${LATEST}$$"; then \
			echo "Failed"; \
			exit 1; \
		fi; \
	else \
		echo "Testing for tag: $(TG_VERSION)"; \
		if ! docker run --rm --platform $(ARCH) $(IMAGE):$(DOCKER_TAG) terragrunt --version | grep -E "^terragrunt[[:space:]]*version[[:space:]]*v?$(TG_VERSION)\.[.0-9]+$$"; then \
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
		if ! docker run --rm --platform $(ARCH) -v $(CURRENT_DIR)/tests/terraform/0.11:/data $(IMAGE):$(DOCKER_TAG) terraform fmt; then \
			echo "Failed"; \
			exit 1; \
		fi; \
	else \
		if ! docker run --rm --platform $(ARCH) -v $(CURRENT_DIR)/tests/terraform/0.xx:/data $(IMAGE):$(DOCKER_TAG) terraform fmt; then \
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
	@if ! docker run --rm --platform $(ARCH) -v $(CURRENT_DIR)/tests/terragrunt:/data $(IMAGE):$(DOCKER_TAG) terragrunt terragrunt-info; then \
		docker run --rm --platform $(ARCH) -v $(CURRENT_DIR)/tests/terragrunt:/data $(IMAGE):$(DOCKER_TAG) sh -c "if test -d .terragrunt-cache; then rm -rf .terragrunt-cache; fi"; \
		echo "Failed"; \
		exit 1; \
	fi; \
	docker run --rm --platform $(ARCH) -v $(CURRENT_DIR)/tests/terragrunt:/data $(IMAGE):$(DOCKER_TAG) sh -c "if test -d .terragrunt-cache; then rm -rf .terragrunt-cache; fi"; \
	echo "Success";
