% vim: ft=tex
% closs platform solution for typesetting japanese
\NeedsTeXFormat{LaTeX2e}
\RequirePackage{iftex}

% common parameters
\def\my@papersize{a4paper} % Define papersize
\def\my@language{japanese} % Define language
\def\my@documentclass{article} % actual documentclass to use
\def\my@documentclass{jlreq} % actual documentclass to use
\def\my@fontsize{10.5 pt} % fontsize
\def\my@draftmode{} % set this to draft for draft
% \def\my@options{article,japanese}
\def\my@options{japanese}


% actual configurations
\ifptex
  % FOR pLaTeX %%%%%%%%%%
  \DeclareOption*{%
    \edef\@clsopts{%
      {dvipdfmx,\my@language,\my@fontsize,\my@papersize,\CurrentOption}{\my@documentclass}%
      }
    \expandafter\PassOptionsToClass\@clsopts
  }
  \ProcessOptions\relax

  \edef\@ClassOptionsToAppend{{,\my@language,dvipdfmx}}
  \expandafter\g@addto@macro\expandafter\@classoptionslist\@ClassOptionsToAppend

  % actually load the class
  \LoadClass[%
    dvipdfmx,%
    \my@papersize,%
    \my@language,%
    \my@draftmode,%
    \my@options,%
    fontsize=\my@fontsize,%
    ]{\my@documentclass}

  % font settings
  \RequirePackage[dvipdfmx]{hyperref}
  \RequirePackage{pxjahyper}
  \RequirePackage{amsmath,txfonts}

  \RequirePackage[T1]{fontenc}
  \renewcommand{\rmdefault}{ptm}

  \usepackage[uplatex,deluxe]{otf}
  \usepackage[haranoaji,unicode]{pxchfon}
  \setminchofont{BIZ_UDMincho_Regular.5.ttf}
  \setgothicfont{BIZ_UDGothic_Regular.5.ttf}
  \setboldgothicfont{BIZ_UDGothic_Bold.5.ttf}


\else\ifluatex
  % \RequirePackage{expl3}
  % \ExplSyntaxOn
  % \pdf_uncompress:
  % \ExplSyntaxOff
  % \def\my@documentclass{ltjsarticle} % actual documentclass to use
  % FOR LuaLaTeX %%%%%%%%%%
  % process global options
  \DeclareOption*{%
    \edef\@clsopts{%
      {lualatex,\my@language,\my@fontsize,\my@papersize,\CurrentOption}{\my@documentclass}%
      }
    \expandafter\PassOptionsToClass\@clsopts
  }
  \ProcessOptions\relax

  \edef\@ClassOptionsToAppend{{,\my@language,lualatex}}
  \expandafter\g@addto@macro\expandafter\@classoptionslist\@ClassOptionsToAppend

  % actually load the class
  \LoadClass[%
    lualatex,%
    \my@papersize,%
    \my@language,%
    \my@draftmode,%
    \my@options,%
    fontsize=\my@fontsize,%
    ]{\my@documentclass}

  % font settings
  \RequirePackage[haranoaji,deluxe,nfssonly,jis2004]{luatexja-preset}
  \RequirePackage{luatexja-fontspec}
  \RequirePackage{fontspec}

  \setmainjfont[
    %Script=Default,
    YokoFeatures={JFM=prop},
    % CharacterWidth=Proportional,
    ItalicFont={BIZ UDPMincho},
    ItalicFeatures={FakeSlant=0.3},
    SlantedFeatures={FakeSlant=-0.3},
    AutoFakeBold=2,
    %Kerning=On,
  ]{BIZ UDPMincho}

  \setmainfont[
    % CharacterWidth=Proportional,
    Kerning=On,
    Ligatures={Rare,TeX}
  ]{TeX Gyre Termes}

  \setsansjfont[
    %Script=Default,
    YokoFeatures={JFM=prop},
    % CharacterWidth=Proportional,
    ItalicFont={BIZ UDPGothic},
    ItalicFeatures={FakeSlant=0.3},
    SlantedFeatures={FakeSlant=-0.3},
    AutoFakeBold=1,
    % Kerning=On,
  ]{BIZ UDPGothic}


  \setmonofont[
    %Script=Default,
    BoldFont={mplus-2m-bold},
  ]{mplus-2m-regular}
  \setmonojfont[
    %Script=Default,
    BoldFont={mplus-2m-bold},
  ]{mplus-2m-regular}

\else
  \errmessage{You Need either (u)pLaTeX or LuaLaTeX}
\fi\fi


% Optional Document Class Settings %
\setlength\marginparwidth{20truemm}     % 本文中の図のスペース
\RequirePackage[left=1.2\marginparwidth,right=1.2\marginparwidth,top=25mm,bottom=25mm]{geometry} % 余白の設定

% \setlength\floatsep{1 truemm}      % 図と図の間のスペース
% \setlength\textfloatsep{2 truemm}  % 本文と図の間のスペース
% \setlength\intextsep{1 truemm}     % 本文中の図のスペース

% \setlength\abovecaptionskip{1 truemm}  % 図とキャプションの間のスペース
% \setlength\belowcaptionskip{2 truemm}

% \setlength{\abovedisplayskip}{0.1 \abovedisplayskip}
% \setlength{\belowdisplayskip}{0.1 \belowdisplayskip}


% % for jlreq
\ModifyHeading{section}{font=\sffamily\Large\bfseries\raggedright}
\ModifyHeading{subsection}{font=\sffamily\large\bfseries\raggedright}
\ModifyHeading{subsubsection}{font=\sffamily\normalsize\bfseries\raggedright}
\ModifyHeading{paragraph}{font=\sffamily\normalsize\bfseries\raggedright}
\ModifyHeading{subparagraph}{font=\sffamily\normalsize\bfseries\raggedright}
\jlreqsetup{%
  caption_font=\normalfont,%
  caption_label_font=\normalfont,%
  }
