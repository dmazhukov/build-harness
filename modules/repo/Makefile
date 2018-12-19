## Install npm external dependencies for building monorepo
repo/deps:
	@npm install -g lerna gulp grunt-cli
## Bootstrap monorepo with lerna
repo/init:
	@lerna bootstrap
## Build monorepo with lerna
repo/build:
	@lerna run build
## Test monorepo with lerna
repo/test:
	@lerna run test
## Push monorepo images
repo/push:
	@lerna run package
## Clean monorepo
repo/clean:
	@lerna clean
	