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

\DeclareRobustCommand{\PrepareGlobalOptions}[1]{
  \DeclareOption*{%
    \edef\@clsopts{%
      {#1,\my@language,\my@fontsize,\my@papersize,\CurrentOption}{\my@documentclass}%
      }%
    \expandafter\PassOptionsToClass\@clsopts%
  }
  \ProcessOptions\relax

  \edef\@ClassOptionsToAppend{{,\my@language,#1}}
  \expandafter\g@addto@macro\expandafter\@classoptionslist\@ClassOptionsToAppend
  }

% actual configurations
\ifptex
  % FOR pLaTeX %%%%%%%%%%
  \PrepareGlobalOptions{dvipdfmx}

  % actually load the class
  \LoadClass[%
    dvipdfmx,%
    \my@papersize,%
    \my@language,%
    \my@draftmode,%
    \my@options,%
    \my@fontsize,%
    ]{\my@documentclass}

  \RequirePackage{bxdpx-beamer}% dvipdfmxなので必要
  \renewcommand{\kanjifamilydefault}{\gtdefault}% 既定をゴシック体に

  \RequirePackage[dvipdfmx]{pxjahyper}

  \RequirePackage{mathtools}

\else\ifluatex
  % FOR LuaLaTeX %%%%%%%%%%
  % process global options
  \PrepareGlobalOptions{lualatex}

  % actually load the class
  \LoadClass[%
    lualatex,%
    \my@papersize,%
    \my@language,%
    \my@draftmode,%
    \my@options,%
    \my@fontsize,%
    ]{\my@documentclass}

  \RequirePackage[jis2004]{luatexja}
  \renewcommand{\kanjifamilydefault}{\gtdefault}% 既定をゴシック体に

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

\setbeamertemplate{navigation symbols}{} % turn off navigation symbols
\setbeamertemplate{itemize item}[triangle]
\setbeamertemplate{itemize subitem}[square]
\setbeamertemplate{itemize subsubitem}[circle]

\setbeamerfont{caption}{size=\scriptsize}

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
