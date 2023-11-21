
BRANCH := $(shell git rev-parse --abbrev-ref HEAD)
COMMIT := $(shell git rev-parse --short HEAD)

.PHONY: build
build :
	@echo "Building the image...."
	docker build --no-cache -t khulnasoft/demo-tunnel:${BRANCH}-${COMMIT} -f Dockerfile .
	@echo "Done!"

scan-image :
	@echo "Run the scanner...."
	tunnel image --severity HIGH,CRITICAL khulnasoft/demo-tunnel:${BRANCH}-${COMMIT}
	@echo "Done!"

missconf-k8s-custom-rego:
	@echo "Custom Rego rules with Tunnel...."
	tunnel --debug conf --severity CRITICAL --policy ./policy/k8s --namespaces myk8s .

missconf-docker-custom-rego:
	@echo "Nodejs Docker rules with Tunnel and OPA...."
	tunnel --debug conf --severity CRITICAL --policy ./policy/container --namespaces mycontainer .
