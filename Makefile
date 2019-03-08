GIT_VERSION=$(shell git describe --always | sed 's|v\(.*\)|\1|')
GIT_BRANCH=$(shell git rev-parse --abbrev-ref HEAD)
ORGANIZATION?=solardesigner
IMAGE_NAME?=unknown
UPSTREAM_VERSION?=latest

all: $(IMAGE_NAME) version.properties

version.properties:
	@echo "version=${UPSTREAM_VERSION}"

docker-image: docker-build
	docker build --build-arg UPSTREAM_VERSION=$(UPSTREAM_VERSION) -t $(ORGANIZATION)/$(IMAGE_NAME) -f ./${IMAGE_NAME}
	docker tag $(ORGANIZATION)/$(IMAGE_NAME):latest $(ORGANIZATION)/$(IMAGE_NAME):${UPSTREAM_VERSION}

docker-push: docker-image
	docker push $(ORGANIZATION)/$(IMAGE_NAME):${UPSTREAM_VERSION}

.PHONY: all docker-image docker-push