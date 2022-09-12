all: build/mypresentation_notes.pdf build/mydocument.pdf

mypresentation: build/mypresentation_notes.pdf build/mypresentation.pdf

build/mydocument.pdf: latexmkrc mydocument.tex src/* include/*
	latexmk mydocument.tex

build/mypresentation.pdf: latexmkrc mypresentation.tex mypresentationsrc.sty src/* include/*
	latexmk mypresentation.tex

build/mypresentation_notes.pdf: latexmkrc mypresentation_notes.tex mypresentationsrc.sty src/* include/*
	latexmk mypresentation_notes.tex
