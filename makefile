ifeq ($(OS),Windows_NT)
    COPY := powershell -NoProfile -Command cp
else
    COPY := cp
endif

.PHONY: help
help:
	$(info usage:)
	$(info make mydocument)
	$(info make mypresentation)
	$(info make all)

mydocument: pdf/mydocument.pdf

mypresentation: pdf/mypresentation_notes.pdf pdf/mypresentation.pdf

pdf/%.pdf: build/%.pdf
	$(COPY) $< $@
	$(COPY) build/$(*F).synctex pdf/

build/%.pdf: %.tex latexmkrc src/* include/*
	latexmk $<

all: mydocument mypresentation
