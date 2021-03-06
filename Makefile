export BUILD_HARNESS_PATH ?= $(shell 'pwd')
export OS ?= $(shell uname -s | tr '[:upper:]' '[:lower:]')
export SELF ?= $(MAKE)
export PATH := $(BUILD_HARNESS_PATH)/vendor:$(PATH)
export DOCKER_BUILD_FLAGS ?=

# Debug should not be defaulted to a value because some cli consider any value as `true` (e.g. helm)
export DEBUG ?=

ifeq ($(CURDIR),$(realpath $(BUILD_HARNESS_PATH)))
# List of targets the `readme` target should call before generating the readme
export README_DEPS ?= docs/targets.md
export DEFAULT_HELP_TARGET = help/all
endif

# Import Makefiles into current context
include $(BUILD_HARNESS_PATH)/Makefile.*
# include $(BUILD_HARNESS_PATH)/modules/*/bootstrap.Makefile*
# include $(BUILD_HARNESS_PATH)/modules/*/Makefile*
include $(BUILD_HARNESS_PATH)/modules/*/bootstrap.Makefile*
include $(BUILD_HARNESS_PATH)/modules/bash/Makefile*
include $(BUILD_HARNESS_PATH)/modules/compose/Makefile*
include $(BUILD_HARNESS_PATH)/modules/docker/Makefile*
# include $(BUILD_HARNESS_PATH)/modules/docs/Makefile*
include $(BUILD_HARNESS_PATH)/modules/git/Makefile*
include $(BUILD_HARNESS_PATH)/modules/github/Makefile*
include $(BUILD_HARNESS_PATH)/modules/gitleaks/Makefile*
# include $(BUILD_HARNESS_PATH)/modules/helm/Makefile*
# include $(BUILD_HARNESS_PATH)/modules/helmfile/Makefile*
include $(BUILD_HARNESS_PATH)/modules/make/Makefile*
include $(BUILD_HARNESS_PATH)/modules/mono/Makefile*
include $(BUILD_HARNESS_PATH)/modules/readme/Makefile*

all: init deps build install run

deps:
	@make mono/deps

build:
	@make mono/init
	@make mono/build

install:
	@echo "Not implemented"
	@exit(0)

run:
	@echo "Not implemented"
	@exit(0)

bash/fmt:
	shfmt -l -w $(PWD)

bash/fmt/check:
	shfmt -d $(PWD)/rootfs	

ifndef TRANSLATE_COLON_NOTATION
%:
	@$(SELF) $(subst :,/,$@) TRANSLATE_COLON_NOTATION=false
endif
