GIT_VERSION=$(shell git describe --always | sed 's|v\(.*\)|\1|')
GIT_BRANCH=$(shell git rev-parse --abbrev-ref HEAD)
ORGANIZATION?=solardesigner
IMAGE_NAME?=unknown
UPSTREAM_VERSION?=latest

default: image

image:
	docker build --build-arg UPSTREAM_VERSION=$(UPSTREAM_VERSION) -t $(ORGANIZATION)/$(IMAGE_NAME) ./${IMAGE_NAME}/
	docker tag $(ORGANIZATION)/$(IMAGE_NAME):latest $(ORGANIZATION)/$(IMAGE_NAME):${UPSTREAM_VERSION}

push: image
	docker push $(ORGANIZATION)/$(IMAGE_NAME):${UPSTREAM_VERSION}

.PHONY: default image push