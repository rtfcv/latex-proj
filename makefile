build/mydocument.pdf: latexmkrc mydocument.tex src/* include/*
	latexmk mydocument.tex
