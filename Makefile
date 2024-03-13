.PHONY: all
all: clean unit_test integration_test build package

.PHONY: clean
clean:
	rm -rf dist

.PHONY: build
build:
	go build -o dist/server ./cmd/server

.PHONY: dist
dist:
	mkdir -p dist

.PHONY: unit_test
unit_test:
	go test -v -cover ./...

.PHONY: integration_test
integration_test:
	go test -v -count=1 --tags=integration ./...

.PHONY: dev
dev:
	echo "WAT"

IMAGE?=axel1864684/vehicle-server
TAG?=dev

.PHONY: package
package:
	docker build -t $(IMAGE):$(TAG) .