VERSION ?= 0.0.1

IMG ?= ibmgaragecloud/operator-sdk

TAG = $(IMG):$(VERSION)

BUILDER ?= docker

all: docker-build docker-push

docker-build:
	$(BUILDER) build -t $(IMG) .

docker-push:
	$(BUILDER) tag $(IMG) $(TAG)
	$(BUILDER) push $(TAG)
