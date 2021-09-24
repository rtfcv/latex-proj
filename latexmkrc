# do out-of-tree build
$out_dir="build";

# define latex command options
$my_interaction_mode="nonstopmode";
$my_synctex_mode = "1";

# show line numbers and stop on first error
$my_latex_args = "-synctex=$my_synctex_mode -file-line-error -halt-on-error -interaction=$my_interaction_mode";


# override latex commands to use synctex and output line number and halt on error
# $xelatex =   "xelatex $my_latex_args %O %S";
# $lualatex = "lualatex $my_latex_args %O %S";
# $latex   =    "platex $my_latex_args %O %S";

# override latex commands to use texliveonfly
$latex    = "texliveonfly --compiler=platex --arguments=\" $my_latex_args %O \" %S";
$xelatex  = "texliveonfly --compiler=xelatex --arguments=\" $my_latex_args %O \" %S";
$lualatex = "texliveonfly --compiler=lualatex --arguments=\" $my_latex_args %O \" %S";


# # use pyjbibtex as bibtex command
# $bibtex = "python3 ../pyjbibtex/pyjbibtex.py pbibtex %O ../%S";#
# $bibtex = "echo %O %S && env > env.txt && exit";
$bibtex = "pbibtex %O %S";


# use dvipdfmx as dvipdf
$dvipdf  = 'dvipdfmx %O -o %D %S -z 0';


# finally what generator to use
# 3 for dvipdf, 4 for lualatex, 5 for xetex
$pdf_mode = 3;


$postscript_mode = $dvi_mode = 0;
