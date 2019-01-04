## Install npm external dependencies for building monorepo
mono/deps:
	@npm install -g lerna gulp grunt-cli
## Bootstrap monorepo with lerna
mono/init:
	@lerna bootstrap
## Build monorepo with lerna
mono/build:
	@lerna run build
## Test monorepo with lerna
mono/test:
	@lerna run test
## Push monorepo images
mono/push:
	@lerna run package
## Clean monorepo
mono/clean:
	@lerna clean
	