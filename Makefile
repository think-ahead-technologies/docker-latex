
SHELL = bash
TAG = main
REPO = ghcr.io/think-ahead-technologies/docker-latex

.PHONY: test
test:
	docker run --rm -v$$(pwd):/work -e max_print_line=120 $(REPO):$(TAG) ./test.sh

build:
	docker build -t $(REPO):$(TAG) .

push:
	docker push $(REPO):$(TAG)
