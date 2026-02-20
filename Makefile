DOCKER_IMAGE=texlive/texlive
DOCKER_VOLUME=-v $(CURDIR):$(CURDIR)
DOCKER_USER=-u $(shell id -u):$(shell id -g)
DOCKER=docker run --rm $(DOCKER_VOLUME) -w $(CURDIR) $(DOCKER_USER) $(DOCKER_IMAGE)
resume.pdf: resume.tex $(wildcard resume/*.tex)
	$(DOCKER) xelatex resume.tex
