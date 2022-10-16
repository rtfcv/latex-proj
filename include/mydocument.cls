% vim: ft=tex
% closs platform solution for typesetting japanese
\NeedsTeXFormat{LaTeX2e}
\RequirePackage{iftex}

% common parameters
\def\my@papersize{a4paper} % Define papersize
\def\my@language{japanese} % Define language
\def\my@documentclass{jlreq} % actual documentclass to use
\def\my@fontsize{10.5 pt} % fontsize
\def\my@draftmode{} % set this to draft for draft
\def\my@options{article,japanese}

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
    fontsize=\my@fontsize,%
    ]{\my@documentclass}

  % font settings
  \RequirePackage[dvipdfmx]{hyperref}
  \RequirePackage{pxjahyper}
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
    fontsize=\my@fontsize,%
    ]{\my@documentclass}

\else
  \errmessage{You Need either (u)pLaTeX or LuaLaTeX}
\fi\fi


% Optional Document Class Settings %
\setlength\marginparwidth{20truemm}     % 本文中の図のスペース
\RequirePackage[left=1.2\marginparwidth,right=1.2\marginparwidth,top=1.25\marginparwidth,bottom=1.25\marginparwidth]{geometry} % 余白の設定

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
