.PHONY: all build release

IMAGE=dddpaul/ipsec-vpn-server
VERSION=1.0

all: build

build:
	@docker build -t ${IMAGE} .

debug:
	@docker run -i -t --entrypoint=sh ${IMAGE}

run:
	@docker run -i -P ${IMAGE}

release: build
	@docker build --tag=${IMAGE}:${VERSION} .

deploy: release
	@docker push ${IMAGE}
	@docker push ${IMAGE}:${VERSION}
