build/main.pdf: latexmkrc main.tex src/* include/*
	latexmk main
