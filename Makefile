GIT_VERSION=$(shell git describe --always | sed 's|v\(.*\)|\1|')
GIT_BRANCH=$(shell git rev-parse --abbrev-ref HEAD)
ORGANIZATION?=solardesigner
IMAGE_NAME?=unknown
UPSTREAM_VERSION?=latest

docker-image: Dockerfile
	docker build --build-arg UPSTREAM_VERSION=$(UPSTREAM_VERSION) -t $(ORGANIZATION)/$(IMAGE_NAME) ./${IMAGE_NAME}
	docker tag $(ORGANIZATION)/$(IMAGE_NAME):latest $(ORGANIZATION)/$(IMAGE_NAME):${UPSTREAM_VERSION}

docker-push: docker-image
	docker push $(ORGANIZATION)/$(IMAGE_NAME):${UPSTREAM_VERSION}

.PHONY: docker-image docker-push