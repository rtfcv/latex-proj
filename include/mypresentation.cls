% vim: ft=tex
% closs platform solution for typesetting japanese
\NeedsTeXFormat{LaTeX2e}
\RequirePackage{iftex}

% common parameters
\def\my@papersize{a4paper} % Define papersize
\def\my@language{japanese} % Define language
% \def\my@documentclass{jlreq} % actual documentclass to use
\def\my@documentclass{beamer} % actual documentclass to use
\def\my@fontsize{12pt} % fontsize
\def\my@draftmode{} % set this to draft for draft
\def\my@options{}


\ifptex
  % FOR pLaTeX %%%%%%%%%%
  \DeclareOption*{\PassOptionsToClass{\CurrentOption,japanese,dvipdfmx}{\my@documentclass}}
  \ProcessOptions\relax 
  \g@addto@macro\@classoptionslist{,japanese,dvipdfmx}

  \LoadClass[dvipdfmx,\my@papersize,\my@language,\my@draftmode,\my@options,\my@fontsize]{\my@documentclass}

  \usepackage{bxdpx-beamer}% dvipdfmxなので必要
  \renewcommand{\kanjifamilydefault}{\gtdefault}% 既定をゴシック体に

  % \RequirePackage[dvipdfmx]{hyperref}
  \RequirePackage[dvipdfmx]{pxjahyper}

  \RequirePackage{amsmath,txfonts}

  % font settings
  \RequirePackage[T1]{fontenc}
  \renewcommand{\rmdefault}{ptm}

  \usepackage[uplatex,deluxe]{otf}
  \usepackage[haranoaji,unicode]{pxchfon}
  \setminchofont{BIZ_UDMincho_Regular.5.ttf}
  \setgothicfont{BIZ_UDGothic_Regular.5.ttf}
  \setboldgothicfont{BIZ_UDGothic_Bold.5.ttf}


\else\ifluatex
  % FOR LuaLaTeX %%%%%%%%%%
  \DeclareOption*{\PassOptionsToClass{\CurrentOption,japanese,lualatex}{\my@documentclass}}
  \ProcessOptions\relax 
  \g@addto@macro\@classoptionslist{,japanese,lualatex}

  \LoadClass[lualatex,\my@papersize,\my@language,\my@draftmode,\my@options,\my@fontsize]{\my@documentclass}

  % font settings
  \RequirePackage[haranoaji,deluxe,nfssonly,jis2004]{luatexja-preset}
  \RequirePackage{luatexja-fontspec}
  \RequirePackage{fontspec}
  \renewcommand{\kanjifamilydefault}{\gtdefault}% 既定をゴシック体に

  \setmainjfont[
    %Script=Default,
    YokoFeatures={JFM=prop},
    CharacterWidth=Proportional,
    ItalicFont={BIZ UDPMincho},
    ItalicFeatures={FakeSlant=0.3},
    SlantedFeatures={FakeSlant=-0.3},
    AutoFakeBold=2,
    Kerning=On,
  ]{BIZ UDPMincho}

  \setmainfont[
    CharacterWidth=Proportional,
    Kerning=On,
    Ligatures={Rare,TeX}
  ]{TeX Gyre Termes}

  \setsansjfont[
    %Script=Default,
    YokoFeatures={JFM=prop},
    CharacterWidth=Proportional,
    ItalicFont={BIZ UDPGothic},
    ItalicFeatures={FakeSlant=0.3},
    SlantedFeatures={FakeSlant=-0.3},
    AutoFakeBold=2,
    Kerning=On,
  ]{BIZ UDPGothic}

\else
  \errmessage{You Need either (u)pLaTeX or LuaLaTeX}
\fi\fi


% Optional Document Class Settings %
\usetheme{Singapore}
\usecolortheme{dove}
\usefonttheme{professionalfonts}

% \RequirePackage[left=23mm,right=23mm,top=25mm,bottom=25mm]{geometry} % 余白の設定

% \setlength\floatsep{1 truemm}      % 図と図の間のスペース
% \setlength\textfloatsep{2 truemm}  % 本文と図の間のスペース
% \setlength\intextsep{1 truemm}     % 本文中の図のスペース

% \setlength\abovecaptionskip{1 truemm}  % 図とキャプションの間のスペース
% \setlength\belowcaptionskip{2 truemm}

% \setlength{\abovedisplayskip}{0.1 \abovedisplayskip}
% \setlength{\belowdisplayskip}{0.1 \belowdisplayskip}

% % for jlreq
\RequirePackage{setspace}
\singlespacing
