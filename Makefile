VERSION := 0.1.0

PLATFORMS := linux/386 linux/amd64 linux/arm linux/arm64 windows/386 windows/amd64 windows/arm windows/arm64 darwin/arm64 darwin/amd64
PRODUCT := junit2md

DOCKER_REGISTRY := ghcr.io
DOCKER_REGISTRY_USER := dinakar29

all: ## Default goal
all: clean install generate vet fmt lint test mod-tidy build

.PHONY: clean
clean: ## Remove files created during build pipeline
	$(call print-target)
	rm -rf dist
	rm -f coverage.*

.PHONY: install
install: ## Go get all modules, and run install
	$(call print-target)
	go get -d ./...
	go install ./...

.PHONY: generate
generate: ## Run `go generate`
	$(call print-target)
	go generate ./...

.PHONY: vet
vet: ## Run `go vet`
	$(call print-target)
	go vet ./...

.PHONY: fmt
fmt: ## Format code
	$(call print-target)
	go fmt ./...

.PHONY: lint
lint: vet

.PHONY: test
test: ## Test with race detector and code covarage
	$(call print-target)
	go test -race -covermode=atomic -coverprofile=coverage.out ./...
	go tool cover -html=coverage.out -o coverage.html

.PHONY: mod-tidy
mod-tidy: ## Run `go mod tidy`
	$(call print-target)
	go mod tidy

.PHONY: build
build: ## Build binaries for the supported platforms
build: install
	$(call print-target)
	mkdir -p dist/
	for p in $(PLATFORMS); do \
		os=`echo $$p | cut -d "/" -f 1`; \
		arch=`echo $$p | cut -d "/" -f 2`; \
		CGO_ENABLED=0 GOARCH=$$arch GOOS=$$os GO111MODULE=on go build -o dist/$(PRODUCT)_$(VERSION)_$$os-$$arch ./...; \
	done

.PHONY: run
run: ## Run src/main.go
	@go run -race src/main.go

.PHONY: go-clean
go-clean: ## Clean build, test and modules caches
	$(call print-target)
	go clean -r -i -cache -testcache -modcache

.PHONY: help
help: ## Print the help menu
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

.PHONY: docker-build
docker-build: ## Build the Docker image
	$(call print-target)
	docker build -t $(PRODUCT):$(VERSION) .

.PHONY: docker-publish
docker-publish: docker-build ## Publish the Docker image to the registry
	$(call print-target)
	docker tag -t $(PRODUCT):$(VERSION)$(DOCKER_REGISTRY)/$(DOCKER_REGISTRY_USER)/$(PRODUCT):latest
	docker tag -t $(PRODUCT):$(VERSION) $(DOCKER_REGISTRY)/$(DOCKER_REGISTRY_USER)/$(PRODUCT):$(VERSION)
	docker login $(DOCKER_REGISTRY) -u $(DOCKER_REGISTRY_USER) -p ${DOCKER_REGISTRY_PASSWORD}
	docker push $(PRODUCT):$(VERSION)$(DOCKER_REGISTRY)/$(DOCKER_REGISTRY_USER)/$(PRODUCT):latest
	docker push $(DOCKER_REGISTRY)/$(DOCKER_REGISTRY_USER)/$(PRODUCT):$(VERSION)

define print-target
    @printf "\e[1;31mExecuting target:\033[0m \033[36m$@\033[0m\n"
endef
