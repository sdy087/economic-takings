%-------------------------- identification ---------------------
%\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{thesisPSnPDF}
%-------------------------- initial code -----------------------

%If you want to use a Report style document then uncomment the following 3 lines and comment the below 8 book style lines:
%\DeclareOption*{\PassOptionsToClass{\CurrentOption}{report}}
%\ProcessOptions\relax
%%\LoadClass[a4paper]{report}
%\ifx\pdfoutput\undefined
%   \LoadClass[dvips, a4paper]{report}
%\else
%   \LoadClass[pdftex, a4paper]{report}
%\fi
%%Bibliography
%%uncomment next line to change bibliography name to references for Report document class
%\renewcommand{\refname}{References}

%If you want to use a Book style document then uncomment the following 3 lines and comment the above 8 report style lines:
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{book}}
\ProcessOptions\relax
\ifx\pdfoutput\undefined
   \LoadClass[dvips, a4paper]{book}
\else
   \LoadClass[pdftex, a4paper]{book}
\fi

\frenchspacing %Removes double spacing for full stops, etc. 

\usepackage{amssymb}
\usepackage{graphics}
\usepackage{fancyhdr}
\usepackage{eucal}
%\usepackage[english]{babel}
\usepackage[british]{babel}
\usepackage[usenames, dvipsnames]{color}
%\usepackage[perpage]{footmisc}
%\usepackage[square, sort, numbers, authoryear]{natbib}
\usepackage{amsmath}
\usepackage{upgreek}
\usepackage{textgreek}
\usepackage{amssymb}

%These can also be put in the thesis.tex file under \usepackage{StyleFiles/watermark}
%\makeindex
\usepackage[style=oscola, indexing=cite, citereset=chapter, ibidtracker=false]{biblatex}
\usepackage[style=british]{csquotes}

\usepackage[splitindex,noautomatic]{imakeidx}% PMS changed this

%\usepackage{nameref}
%for internal cross-referencing to named reference points.%

\addbibresource{thesis.bib}

%\bibliography{References/References.bib}% References file
%\bibliography{thesis.bib}

\usepackage{ifthen}
\usepackage{ifpdf}
%\usepackage{multirow}
\usepackage{pdflscape}
%\usepackage{makeidx}
%\usepackage{showidx}
%\usepackage{idxlayout}


\usepackage{fixltx2e}

\usepackage[doublespacing]{setspace}
\usepackage{quoting}
\quotingsetup{font=singlespace}

%CROSS-REFERENCING PACKAGES
\usepackage{xr}

%FOOTNOTE PACKAGES
%\usepackage[hang]{footmisc}

\usepackage[bottom]{footmisc} %push footnotes to bottom of page
\setlength{\footnotemargin}{-2em} %indent footnotes
%\usepackage{footmisc}


\addtolength{\skip\footins}{4mm }
% to set spacing between main text & footnotes

\setlength{\footnotesep}{5mm}
% to set spacing between individual footnotes.

%the next command is taken from online - it's to get footnotes indented from text.
\ifFN@para
\else
  \long\def\@makefntext#1{%
    \ifFN@hangfoot
      \bgroup
      \setbox\@tempboxa\hbox{%
        \ifdim\footnotemargin>0pt
          \hb@xt@\footnotemargin{\@makefnmark\hss}%
        \else
          \@makefnmark\hskip-\footnotemargin      %%Changed here
        \fi
      }%
      \leftmargin\wd\@tempboxa
      \rightmargin\z@
      \linewidth \columnwidth
      \advance \linewidth -\leftmargin
      \parshape \@ne \leftmargin \linewidth
      \footnotesize
      \@setpar{{\@@par}}%
      \leavevmode
      \llap{\box\@tempboxa}%
      \parskip\hangfootparskip\relax
      \parindent\hangfootparindent\relax
    \else
      \parindent1em
      \noindent
      \ifdim\footnotemargin>\z@
        \hb@xt@ \footnotemargin{\hss\@makefnmark}%
      \else
        \ifdim\footnotemargin=\z@
          \llap{\@makefnmark}%
        \else
          \llap{\hb@xt@ -\footnotemargin{\@makefnmark\hss}}%
        \fi
      \fi
    \fi
    \footnotelayout#1%
    \ifFN@hangfoot
      \par\egroup
    \fi
  }
\fi
\makeatother

%spacing of enumerate package
\usepackage{enumitem}

%Bibliography
%uncomment next line to change bibliography name to references for Book document class
\renewcommand{\bibname}{thesis.bib}
% note that this doesn't do much if you later define another bibliography style 


% Nomenclature
\usepackage{nomencl}
\makeglossary
\renewcommand\nomgroup[1]{%
  \ifthenelse{\equal{#1}{A}}{%
   \item[\textbf{Roman Symbols}] }{%             A - Roman
    \ifthenelse{\equal{#1}{G}}{%
     \item[\textbf{Greek Symbols}]}{%             G - Greek
      \ifthenelse{\equal{#1}{R}}{%
        \item[\textbf{Superscripts}]}{%              R - Superscripts
          \ifthenelse{\equal{#1}{S}}{%
           \item[\textbf{Subscripts}]}{{%             S - Subscripts
	    \ifthenelse{\equal{#1}{X}}{%
	     \item[\textbf{Other Symbols}]}{{%    X - Other Symbols
	    \ifthenelse{\equal{#1}{Z}}{%
	     \item[\textbf{Acronyms}]}%              Z - Acronyms
              			{{}}}}}}}}}}

\ifpdf
%-->
%--> Google.com search "hyperref options"
%--> 
%--> http://www.ai.mit.edu/lab/sysadmin/latex/documentation/latex/hyperref/manual.pdf
%--> http://www.chemie.unibas.ch/~vogtp/LaTeX2PDFLaTeX.pdf 
%--> http://www.uni-giessen.de/partosch/eurotex99/ oberdiek/print/sli4a4col.pdf
%--> http://me.in-berlin.de/~miwie/tex-refs/html/latex-packages.html
%-->
%    \usepackage[ pdftex, plainpages = false, pdfpagelabels, 
%                 pdfpagelayout = useoutlines,
%                 bookmarks,
%                 bookmarksopen = true,
%                 bookmarksnumbered = true,
%                 breaklinks = true,
%                 linktocpage,
%                 pagebackref,
%                 colorlinks = false,
%                 linkcolor = blue,
%                 urlcolor  = blue,
%                 citecolor = red,
%                 anchorcolor = green,
%                 hyperindex = true,
%                 hyperfigures
%                 ]{hyperref} 

    \DeclareGraphicsExtensions{.png, .jpg, .pdf}
    \usepackage[pdftex]{graphicx}
    \pdfcompresslevel=9
%    \graphicspath{{ThesisFigs/PNG/}{ThesisFigs/PDF/}{ThesisFigs/}}
\else
%    \usepackage[ dvips, 
%                 bookmarks,
%                 bookmarksopen = true,
%                 bookmarksnumbered = true,
%                 breaklinks = true,
%                 linktocpage,
%                 pagebackref,
%                 colorlinks = true,
%                 linkcolor = blue,
%                 urlcolor  = blue,
%                 citecolor = red,
%                 anchorcolor = green,
%                 hyperindex = true,
%                 hyperfigures
%                 ]{hyperref}

    \DeclareGraphicsExtensions{.eps, .ps}
    \usepackage{epsfig}
    \usepackage{graphicx}
%    \graphicspath{{ThesisFigs/EPS/}{ThesisFigs/}}
\fi

%define the page size including an offset for binding
%\setlength{\topmargin}{0.0in}
%\setlength{\oddsidemargin}{0in}
%\setlength{\evensidemargin}{0in}
%\setlength{\textheight}{700pt}
%\setlength{\textwidth}{500pt}


%A4 settings
\ifpdf
   \pdfpageheight=297mm
   \pdfpagewidth=210mm
\else
   \setlength{\paperheight}{297mm}
   \setlength{\paperwidth}{210mm}
\fi

\setlength{\hoffset}{0.00cm}
\setlength{\voffset}{0.00cm}


\setlength{\evensidemargin}{1.5cm}
%\setlength{\evensidemargin}{3.5cm}
\setlength{\oddsidemargin}{0.7cm}

\setlength{\topmargin}{1mm}
\setlength{\headheight}{1cm}
\setlength{\headsep}{1.00cm}
\setlength{\textheight}{21cm}
\setlength{\textwidth}{15cm}
\setlength{\marginparsep}{1mm}
\setlength{\marginparwidth}{2cm}
\setlength{\footskip}{2.32cm}

\pagestyle{fancy}
\renewcommand{\chaptermark}[1]{\markboth{\MakeUppercase{\thechapter. #1}}{}}
%\renewcommand{\sectionmark}[1]{\markright{\thesection\ #1}}
\renewcommand{\chaptermark}[1]{\markright{\thechapter\ #1}}
\fancyhf{}
\fancyhead[RO]{\bfseries\rightmark}
\fancyhead[LE]{\bfseries\leftmark}
\fancyfoot[C]{\thepage}
\renewcommand{\headrulewidth}{0.5pt}
\renewcommand{\footrulewidth}{0pt}
\addtolength{\headheight}{0.4pt}
\fancypagestyle{plain}{
  \fancyhead{}
  \renewcommand{\headrulewidth}{0pt}
}

%TABLE OF CONTENTS (Spacing, Centering, etc.)
\usepackage{tocloft}

\setlength\cftparskip{-7pt}
\setlength\cftbeforesecskip{1pt}
\setlength\cftaftertoctitleskip{2pt}

%\renewcommand\cftchapafterpnum{\vskip-5pt}
%\renewcommand\cftsecafterpnum{\vskip-8pt}

%Centering commands for ToC:
\renewcommand{\cfttoctitlefont}{\hfill\Huge\bfseries}
\renewcommand{\cftaftertoctitle}{\hfill}



%\usepackage{tocloft}
%\setlength\cftparskip{-2pt}
%\setlength\cftbeforechapskip{0pt}


%\setlength\cftparskip{-2pt}
%\setlength\cftbeforesecskip{1pt}
%\setlength\cftaftertoctitleskip{2pt}

%
%
% DECLARATIONS
%
% These macros are used to declare arguments needed for the
% construction of the title page and other preamble.

% The year and term the degree will be officially conferred
\def\degreedate#1{\gdef\@degreedate{#1}}
% The full (unabbreviated) name of the degree
\def\degree#1{\gdef\@degree{#1}}
% The name of your college or department(eg. Trinity, Pembroke, Maths, Physics)
\def\collegeordept#1{\gdef\@collegeordept{#1}}
% The name of your University
\def\university#1{\gdef\@university{#1}}
% Defining the crest
\def\crest#1{\gdef\@crest{#1}}

% These macros define an environment for front matter that is always 
% single column even in a double-column document.

\newenvironment{alwayssingle}{%
       \@restonecolfalse\if@twocolumn\@restonecoltrue\onecolumn
       \else\newpage\fi}
       {\if@restonecol\twocolumn\else\newpage\fi}

%define title page layout
\renewcommand{\maketitle}{%
\begin{alwayssingle}
    \renewcommand{\footnotesize}{\small}
    \renewcommand{\footnoterule}{\relax}
    \thispagestyle{empty}
%  \null\vfill
  \begin{center}
    { \Huge {\bfseries {\@title}} \par}
{\large \vspace*{35mm} {{\@crest} \par} \vspace*{25mm}}
    {{\Large \@author} \par}
{\large \vspace*{1ex}
    {{\@collegeordept} \par}
\vspace*{1ex}
    {{\@university} \par}
\vspace*{25mm}
    {{\submittedtext} \par}
\vspace*{1ex}
    {\it {\@degree} \par}
\vspace*{2ex}
    {\@degreedate}}
  \end{center}
  \null\vfill
\end{alwayssingle}}

% DEDICATION
%
% The dedication environment makes sure the dedication gets its
% own page and is set out in verse format.

\newenvironment{dedication}
{\begin{alwayssingle}
  \pagestyle{empty}
  \begin{center}
  \vspace*{1.5cm}
  {\LARGE }
  \end{center}
  \vspace{0.5cm}
  \begin{quote} \begin{center}}
{\end{center} \end{quote} \end{alwayssingle}}


% ACKNOWLEDGEMENTS
%
% The acknowledgements environment puts a large, bold, centered 
% "Acknowledgements" label at the top of the page. The acknowledgements
% themselves appear in a quote environment, i.e. tabbed in at both sides, and
% on its own page.

\newenvironment{acknowledgements}
{\pagestyle{empty}
\begin{alwayssingle}
\begin{center}
\vspace*{1.5cm}
{\Large \bfseries Acknowledgements}
\end{center}
\vspace{0.5cm}
\begin{quote}}
{\end{quote}\end{alwayssingle}}

% The acknowledgementslong environment puts a large, bold, centered 
% "Acknowledgements" label at the top of the page. The acknowledgement itself 
% does not appears in a quote environment so you can get more in.

\newenvironment{acknowledgementslong}
{\pagestyle{empty}
\begin{alwayssingle}
\begin{center}
\vspace*{1.5cm}
{\Large \bfseries Acknowledgements}
\end{center}
\vspace{0.5cm}\begin{quote}}
{\end{quote}\end{alwayssingle}}

%ABSTRACT
%
%The abstract environment puts a large, bold, centered "Abstract" label at
%the top of the page. The abstract itself appears in a quote environment,
%i.e. tabbed in at both sides, and on its own page.


\newenvironment{abstracts} {\begin{alwayssingle} \pagestyle{empty}
  \begin{center}
  \vspace*{1.5cm}
  {\Large \bfseries  Abstract}
  \end{center}
  \vspace{0.5cm}
   \begin{quote}}
{\end{quote}\end{alwayssingle}}

%The abstractlong environment puts a large, bold, centered "Abstract" label at
%the top of the page. The abstract itself does not appears in a quote
%environment so you can get more in.

\newenvironment{abstractslong} {\begin{alwayssingle} \pagestyle{empty}
  \begin{center}
  \vspace*{1.5cm}
  {\Large \bfseries  Abstract}
  \end{center}
  \vspace{0.5cm} \begin{quote}}
{\end{quote}\end{alwayssingle}}

%The abstractseparate environment is for running of a page with the abstract
%on including title and author etc as required to be handed in separately

\newenvironment{abstractseparate} {\begin{alwayssingle} \pagestyle{empty}
  \vspace*{-1in}
 \begin{center}
    { \Large {\bfseries {\@title}} \par}
    {{\large \vspace*{1ex} \@author} \par}
{\large \vspace*{1ex}
    {{\@collegeordept} \par}
    {{\@university} \par}
\vspace*{1ex}
    {{\it \submittedtext} \par}
    {\it {\@degree} \par}
\vspace*{2ex}
    {\@degreedate}}
  \end{center}}
{\end{alwayssingle}}

%ROMANPAGES
%
% The romanpages environment set the page numbering to lowercase roman one
% for the contents and figures lists. It also resets
% page-numbering for the remainder of the dissertation (arabic, starting at 1).

\newenvironment{romanpages}
{\setcounter{page}{1}
  \renewcommand{\thepage}{\roman{page}}}
{\newpage\renewcommand{\thepage}{\arabic{page}}\setcounter{page}{1}}

