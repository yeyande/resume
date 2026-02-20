DOCKER_IMAGE=latex
DOCKER_VOLUME=-v $(CURDIR):$(CURDIR)
DOCKER_USER=-u $(shell id -u):$(shell id -g)
DOCKER=docker run --rm $(DOCKER_VOLUME) -w $(CURDIR) $(DOCKER_USER) $(DOCKER_IMAGE)
.PHONY: all
all: resume.pdf

.PHONY: $(DOCKER_IMAGE)
$(DOCKER_IMAGE): Dockerfile
	docker build -t $(DOCKER_IMAGE) .

resume.pdf: resume.tex $(wildcard resume/*.tex) awesome-cv.cls | $(DOCKER_IMAGE)
	$(DOCKER) xelatex resume.tex
