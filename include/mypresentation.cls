% vim: ft=tex
% closs platform solution for typesetting japanese
\NeedsTeXFormat{LaTeX2e}
\RequirePackage{iftex}

% common parameters
\def\my@papersize{a4paper} % Define papersize
\def\my@language{japanese} % Define language
\def\my@documentclass{beamer} % actual documentclass to use
\def\my@fontsize{12pt} % fontsize
\def\my@draftmode{} % set this to draft for draft
\def\my@options{}


\ifptex
  % FOR pLaTeX %%%%%%%%%%

  \DeclareOption*{%
    \edef\@clsopts{{dvipdfmx,\my@language,\my@fontsize,\my@papersize,\CurrentOption}{\my@documentclass}}
    \expandafter\PassOptionsToClass\@clsopts
  }
  \ProcessOptions\relax

  \edef\@tmp{{\@clsopts}}
  \expandafter\newcommand\expandafter\showclsopts\@tmp

  \edef\@ClassOptionsToAppend{{,\my@language,dvipdfmx}}
  \expandafter\g@addto@macro\expandafter\@classoptionslist\@ClassOptionsToAppend


  \LoadClass[%
    dvipdfmx,%
    \my@papersize,%
    \my@language,%
    \my@draftmode,%
    \my@options,%
    \my@fontsize,%
    ]{\my@documentclass}

  % \RequirePackage[dvipdfmx]{graphicx}
  \RequirePackage{bxdpx-beamer}% dvipdfmxなので必要
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
  % turn compression off for pdfs
  \RequirePackage{expl3}
  \ExplSyntaxOn
  \pdf_uncompress:
  \ExplSyntaxOff

  % FOR LuaLaTeX %%%%%%%%%%
  \DeclareOption*{%
    \edef\@clsopts{{lualatex,\my@language,\my@fontsize,\my@papersize,\CurrentOption}{\my@documentclass}}
    \expandafter\PassOptionsToClass\@clsopts
  }
  \ProcessOptions\relax

  \edef\@ClassOptionsToAppend{{,\my@language,lualatex}}
  \expandafter\g@addto@macro\expandafter\@classoptionslist\@ClassOptionsToAppend

  \edef\@tmp{{\@classoptionslist}}
  \expandafter\newcommand\expandafter\showclsopts\@tmp

  \LoadClass[%
    lualatex,%
    \my@papersize,%
    \my@language,%
    \my@draftmode,%
    \my@options,%
    \my@fontsize,%
    ]{\my@documentclass}

  % font settings
  \RequirePackage[haranoaji,deluxe,nfssonly,jis2004]{luatexja-preset}
  \RequirePackage{luatexja-fontspec}
  \RequirePackage{fontspec}
  \renewcommand{\kanjifamilydefault}{\gtdefault}% 既定をゴシック体に

  \setmainjfont[
    % Script=Default,
    YokoFeatures={JFM=prop},
    % CharacterWidth=Proportional,
    ItalicFont={BIZ UDPMincho},
    ItalicFeatures={FakeSlant=0.3},
    SlantedFeatures={FakeSlant=-0.3},
    AutoFakeBold=2,
    % Kerning=On,
  ]{BIZ UDPMincho}

  \setmainfont[
    % CharacterWidth=Proportional,
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

\newcommand\myclassopt{\@classoptionslist}
\newcommand\mycurrentopt{\CurrentOption}


% Optional Document Class Settings %
\usetheme{Singapore}
\usecolortheme{dove}
\usefonttheme{professionalfonts}
% \useoutertheme{infolines}
\setbeamertemplate{footline}[text line]{%
  \parbox{\linewidth}{%
    \vskip-1.5em \insertframenumber~of~\inserttotalframenumber%
    ~-~\insertshortauthor\hfill%
    }%
}

\setbeamertemplate{note page}{
\footnotesize
  \begin{tabular}{lc}
    \begin{minipage}{0.85\linewidth}
      \scriptsize
      \centering
      \insertsection~/~\insertsubsection~/~\insertframetitle
    \end{minipage}
    &
    \begin{minipage}{0.15\linewidth}
      \setlength{\fboxsep}{0pt}
      \fbox{\insertslideintonotes{0.1}}
    \end{minipage}
    \\
    \hline
\end{tabular}
  \vfill\insertnote\vfill
}
% \setbeamertemplate{note page}[compress]
\setbeamertemplate{itemize item}[triangle]
\setbeamertemplate{itemize subitem}[square]
\setbeamertemplate{itemize subsubitem}[circle]

% \RequirePackage[left=23mm,right=23mm,top=25mm,bottom=25mm]{geometry} % 余白の設定
% \setlength\floatsep{1 truemm}      % 図と図の間のスペース
% \setlength\textfloatsep{2 truemm}  % 本文と図の間のスペース
% \setlength\intextsep{1 truemm}     % 本文中の図のスペース
% \setlength\abovecaptionskip{1 truemm}  % 図とキャプションの間のスペース
% \setlength\belowcaptionskip{2 truemm}
% \setlength{\abovedisplayskip}{0.1 \abovedisplayskip}
% \setlength{\belowdisplayskip}{0.1 \belowdisplayskip}

% % for jlreq
% \RequirePackage{setspace}
% \singlespacing
