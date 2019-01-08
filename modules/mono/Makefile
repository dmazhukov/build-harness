export LERNA_BOOTSTRAP_FLAGS ?= --ci --  --no-optional
export LERNA_BUILD_FLAGS ?=
export LERNA_TEST_FLAGS ?=
export LERNA_EXEC_FLAGS ?=
export SERVICES ?= $(shell [[ 'command -v lerna' ]] && lerna ls -lpa --toposort --json|jq '.[]|select(.location|contains("service")).name' --raw-output)

## Alias for mono/all
mono: mono/all
## Use it after fresh `git clone` to build and push images
mono/all: init deps build push
## Install npm external dependencies for building monorepo
mono/deps:
	@lerna bootstrap $(LERNA_BOOTSTRAP_FLAGS)
## Bootstrap monorepo with lerna
mono/init:
	@npm install -g lerna rimraf
## Build monorepo with lerna
mono/build:
	@lerna run build $(LERNA_BUILD_FLAGS)
## Test monorepo with lerna
mono/test:
	@lerna run test $(LERNA_TEST_FLAGS)
## Push monorepo images
mono/push:
	@for service in $(SERVICES) ; do \
		$(GREEN) ">>>> Pushing $${service} image";  \
		$(MAKE) docker/image/push SERVICE=$$service; \
	done
## Clean monorepo
mono/clean:
	@lerna clean
	