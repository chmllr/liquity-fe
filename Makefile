all:
	docker build -t imtbl --no-cache .
	docker run --rm --entrypoint cat imtbl /imtbl/canister/target/wasm32-unknown-unknown/release/imtbl.wasm.gz > release.wasm.gz
	shasum -a 256 release.wasm.gz
	git rev-parse HEAD

build:
	yarn add hardhat
	yarn
	yarn build:dev-frontend
	cd ./canister/ && make

run:
	yarn run start-dev-frontend
