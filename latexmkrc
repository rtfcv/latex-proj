# vim: ft=perl
$projname="myproj";

$out_dir="build";

$my_interaction_mode="nonstopmode";
$my_synctex_mode = "-1";

$my_latex_args = "-recorder -synctex=$my_synctex_mode -file-line-error -halt-on-error -interaction=$my_interaction_mode";

# For TexLive
$xelatex =  "texliveonfly --compiler=xelatex  --arguments=\" $my_latex_args %O \" %S";
$lualatex = "texliveonfly --compiler=lualatex --arguments=\" $my_latex_args %O \" %S";
$latex   =  "texliveonfly --compiler=uplatex  --arguments=\" $my_latex_args %O \" %S";

# For Anything Else
# $xelatex =  "xelatex  $my_latex_args %O %S";
# $lualatex = "lualatex $my_latex_args %O %S";
# $latex   =  "uplatex  $my_latex_args %O %S";

# use dvipdfmx as dvipdf
$dvipdf  = 'dvipdfmx %O -o %D %S -z 0';

#3 for platex, 4 for lualatex, 5 for xetex
$pdf_mode = 3;

$postscript_mode = $dvi_mode = 0;
