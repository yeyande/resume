.PHONY: resume
resume: resume.pdf

resume.pdf: resume.tex $(wildcard resume/*.tex)
	xelatex $^
