%-------------------------------------------------------------------------------------------------
% Simplified English Thesis Template Class File
% Based on cumtthesis.cls, retaining core LaTeX document structure elements
%-------------------------------------------------------------------------------------------------

%-------------------------------------------------------------------------------------------------
% Document class declaration and basic settings
%-------------------------------------------------------------------------------------------------
\NeedsTeXFormat{LaTeX2e}[2020/10/01]
\def\version{1.0.0}
\def\versiondate{2025/12/06}
\ProvidesClass{classTemplate}[\versiondate\space v\version\space Simple English Thesis Template]

% Declare options
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{book}}
\ProcessOptions\relax

% Remove fontspec related code as we're using pdfLaTeX

% Based on book document class for English support
\LoadClass[a4paper,twoside,openany,onecolumn,11pt,linespread=1.39]{book}[2020/10/01]

%-------------------------------------------------------------------------------------------------
% Necessary package loading
%-------------------------------------------------------------------------------------------------
\RequirePackage{geometry} % Page layout
\RequirePackage{fancyhdr} % Headers and footers
\RequirePackage{titletoc} % Table of contents style
\RequirePackage{tocloft} % Table of contents format
\RequirePackage{graphicx} % Graphics support
\RequirePackage{caption} % Figure and table captions
\RequirePackage{amsmath} % Mathematical formulas
\RequirePackage{amssymb} % Mathematical symbols
\RequirePackage{hyperref} % Hyperlink support
\RequirePackage{setspace} % Line spacing settings
\RequirePackage{indentfirst} % First line indentation
\RequirePackage{xstring} % String processing
\RequirePackage{pgffor} % For foreach loops, supporting batch inclusion of chapter files

%-------------------------------------------------------------------------------------------------
% Page layout settings
%-------------------------------------------------------------------------------------------------
\geometry{
    includeheadfoot, % Include header and footer
    left=3.17cm, % Left margin
    right=3.17cm, % Right margin
    top=2.54cm, % Top margin
    bottom=2.54cm, % Bottom margin
    headheight=1.5cm, % Header height
    headsep=0.54cm, % Spacing between header and text
    footskip=1.0cm % Spacing between footer and text
}

%-------------------------------------------------------------------------------------------------
% Font settings
%-------------------------------------------------------------------------------------------------
% Use standard LaTeX font packages for pdfLaTeX compatibility
\RequirePackage{times} % Times New Roman font
\RequirePackage{helvet} % Helvetica font for sans-serif
\RequirePackage{courier} % Courier font for monospace

%-------------------------------------------------------------------------------------------------
% Line spacing and paragraph settings
%-------------------------------------------------------------------------------------------------
\setlength{\parskip}{0pt} % Paragraph spacing
\renewcommand{\baselinestretch}{1.39} % Line spacing multiplier

%-------------------------------------------------------------------------------------------------
% Hyperlink settings
%-------------------------------------------------------------------------------------------------
\hypersetup{
    unicode=true, % Enable Unicode support
    bookmarksnumbered=true, % Show numbered bookmarks
    bookmarksopen=true, % Expand bookmarks
    bookmarksopenlevel=3, % Expand bookmarks to level 3
    breaklinks=true, % Allow link line breaks
    plainpages=false, % Disable plain page number mode
    pdfborder=0 0 0, % Remove link borders
    pdfstartview=FitH, % Fit to page width when opening PDF
    colorlinks=true, % Enable colored links
    linkcolor=black, % Internal link color
    urlcolor=black, % URL link color
    citecolor=black, % Citation link color
    linktoc=all % Add links to all entries in table of contents
}

%-------------------------------------------------------------------------------------------------
% Basic command definitions
%-------------------------------------------------------------------------------------------------
% Simple page break command
\newcommand{\clearsinglepage}{\clearpage}

%-------------------------------------------------------------------------------------------------
% Chapter title format settings
%-------------------------------------------------------------------------------------------------
% Using standard book class formatting with customizations
\usepackage{titlesec}

% Chapter format
\titleformat{\chapter}
    {\normalfont\Large\bfseries\raggedright}
    {\thechapter\space}
    {0pt}
    {\Large\bfseries}
\titlespacing*{\chapter}{0pt}{-20pt}{20pt}

% Section format
\titleformat{\section}
    {\normalfont\large\bfseries\raggedright}
    {\thesection\space}
    {0pt}
    {\large\bfseries}
\titlespacing*{\section}{0pt}{12pt}{12pt}

% Subsection format
\titleformat{\subsection}
    {\normalfont\normalsize\bfseries\raggedright}
    {\thesubsection\space}
    {0pt}
    {\normalsize\bfseries}
\titlespacing*{\subsection}{0pt}{8pt}{8pt}

% Subsubsection format
\titleformat{\subsubsection}
    {\normalfont\normalsize\bfseries\raggedright}
    {\thesubsubsection\space}
    {0pt}
    {\normalsize\bfseries}
\titlespacing*{\subsubsection}{0pt}{6pt}{6pt}

% Paragraph format
\titleformat{\paragraph}
    {\normalfont\normalsize\bfseries}
    {\theparagraph}
    {1em}
    {}
\titlespacing*{\paragraph}{0pt}{4pt}{4pt}

% Subparagraph format
\titleformat{\subparagraph}
    {\normalfont\normalsize\bfseries}
    {\thesubparagraph}
    {1em}
    {}
\titlespacing*{\subparagraph}{0pt}{4pt}{4pt}

% Title numbering depth
\setcounter{secnumdepth}{5}
% \chapter: Chapter (Level 0)
% \section: Section (Level 1)
% \subsection: Subsection (Level 2)
% \subsubsection: Subsubsection (Level 3)
% \paragraph: Paragraph (Level 4)
% \subparagraph: Subparagraph (Level 5)

%-------------------------------------------------------------------------------------------------
% Table of contents generation
%-------------------------------------------------------------------------------------------------
% Table of contents format settings
\titlecontents{chapter}
[0pt]
{\bfseries}
{\contentspush{\thecontentslabel\space}}
{}
{\titlerule*[3pt]{.}\contentspage}
[\vskip 1.8pt]

\titlecontents{section}
[0pt]
{}
{\contentspush{\thecontentslabel\space}}
{}
{\titlerule*[3pt]{.}\contentspage}
[\vskip 1.8pt]

% Table of contents page number width
\cftsetpnumwidth{2em}

% Table of contents display depth to second level (section)
\setcounter{tocdepth}{1}

% Generate table of contents command
\newcommand\MakeContents{
    \newpage
    \vspace*{-10pt}
    {\centering\linespread{1}\Large\bfseries Table of Contents\par}
    \vspace{12pt}
    \phantomsection
    \addcontentsline{toc}{chapter}{Table of Contents}
    \@starttoc{toc}
    \clearpage
}

%-------------------------------------------------------------------------------------------------
% Header and footer basic styles
%-------------------------------------------------------------------------------------------------
% Page style definitions
% Empty page style
\fancypagestyle{empty}{
    \fancyhf{}
    \fancyhead{}
    \fancyfoot{}
    \renewcommand\footrulewidth{0pt}
    \renewcommand\headrulewidth{0pt}
}

% Front matter style
\fancypagestyle{frontmatter}{
    \fancyhf{}
    \pagenumbering{Roman}
    \fancyhead{}
    \fancyfoot{}
    \fancyfoot[C]{\footnotesize \textbf{\thepage}}
    \renewcommand\footrulewidth{0pt}
    \renewcommand\headrulewidth{0pt}
}

% Main matter style
\fancypagestyle{mainmatter}{
    \fancyhf{}
    \pagenumbering{arabic}
    \fancyhead[C]{\footnotesize\linespread{1}\leftmark}
    \fancyhead[R]{}
    \fancyhead[L]{}
    \fancyfoot[C]{\footnotesize \textbf{\thepage}}
    \setlength\headwidth{\textwidth}
    \renewcommand\footrulewidth{0pt}
    \renewcommand\headrulewidth{0.5pt}
}

% Back matter style
\fancypagestyle{backmatter}{
    \fancyhf{}
    % Continue using mainmatter's arabic page numbers
    \fancyhead[C]{\footnotesize\linespread{1}\leftmark}
    \renewcommand\headrulewidth{0.5pt}
    \fancyfoot[C]{\footnotesize \textbf{\thepage}}
    \renewcommand\footrulewidth{0pt}
}

% Redefine page style command
\let\buildinpagestyle\pagestyle
\renewcommand\pagestyle[1]{
    \IfStrEq{#1}{backmatter}{
        \clearpage
    }{}
    \buildinpagestyle{#1}
}

% Chapter mark setting
\renewcommand\chaptermark[1]{\markboth{\thechapter\space#1}{}}

%-------------------------------------------------------------------------------------------------
% Basic environment definitions
%-------------------------------------------------------------------------------------------------
% Abstract environment
\newenvironment{abstract}{
    \newpage
    \vspace*{-10pt}
    {\centering\linespread{1}\Large\bfseries Abstract\par}
    \vspace{12pt}
    \phantomsection
    \addcontentsline{toc}{chapter}{Abstract}
    \par
    \sloppy
    \normalsize\setlength{\baselineskip}{20pt}
}{
    \clearpage
}

% Keywords command
\newcommand\keywords[1]{
    \par\vspace{6pt}
    \noindent\textbf{Keywords: }#1
}

%-------------------------------------------------------------------------------------------------
% Bibliography reference basic functionality
%-------------------------------------------------------------------------------------------------
% Define bibliography font command
\newcommand{\bibfont}{\footnotesize}

% Bibliography page format
\newcommand\MakeReferencePage{
    \chapter*{References}
    \setlength{\bibhang}{0pt}
    \setlength{\bibitemsep}{0pt}
    \setlength{\biblabelsep}{0.5em}
    \begingroup
    \setstretch{1.587} % = 20pt / (10.5pt * 1.2) ≈ 1.587
    \vspace*{8pt}
    % Use basic thebibliography environment here, not dependent on complex biblatex
    \endgroup
    \clearpage
}

% Simple citation command (if not using biblatex)
\newcommand{\simplecite}[1]{\textsuperscript{[#1]}}

%-------------------------------------------------------------------------------------------------
% Other environment definitions
%-------------------------------------------------------------------------------------------------
% Appendix environment
\let\appendix\relax
\newcounter{appendixnum}
\newenvironment{appendix}{
    \stepcounter{appendixnum}
    \chapter*{Appendix~\theappendixnum}
    \setstretch{1.587}
    \footnotesize
}{
    \clearpage
}

% Acknowledgements environment
\newenvironment{acknowledgements}{
    \chapter*{Acknowledgements}
    \normalsize\setlength{\baselineskip}{20pt}
}{
    \clearpage
}

%-------------------------------------------------------------------------------------------------
% Auxiliary commands
%-------------------------------------------------------------------------------------------------
% Circled number command (for footnotes, etc.)
\newcommand\circledtext[1]{
    \ifnum\value{#1}<11\relax
        {\symbol{\numexpr\value{#1} + "245F\relax}}%
    \else
        \ClassError{classTemplate}{Exceeding the maximum allowed number (<=10), got \the\value{#1}}{}%
    \fi
}

%-------------------------------------------------------------------------------------------------
% Figure and table format settings
%-------------------------------------------------------------------------------------------------
% Figure and table caption format
\DeclareCaptionFont{templatecaptionfont}{\footnotesize}
\captionsetup{
    font           = templatecaptionfont,
    labelsep       = space,
    skip           = 5pt,
    figureposition = bottom,
    tableposition  = top,
}

% Figure and table numbering format
\renewcommand\thetable{\arabic{chapter}-\arabic{table}}
\renewcommand\thefigure{\arabic{chapter}-\arabic{figure}}

%-------------------------------------------------------------------------------------------------
% Equation numbering format
%-------------------------------------------------------------------------------------------------
\renewcommand\theequation{\thechapter-\arabic{equation}}

%-------------------------------------------------------------------------------------------------
% Footnote format
%-------------------------------------------------------------------------------------------------
% Define necessary length variables directly in the class file
\newlength{\footnotemargin}
\newlength{\bibhang}
\newlength{\bibitemsep}
\newlength{\biblabelsep}

% Use Arabic numbers for footnote numbering
\renewcommand\thefootnote{\arabic{footnote}}
\setlength{\footnotemargin}{10pt}

%-------------------------------------------------------------------------------------------------
% Table style
%-------------------------------------------------------------------------------------------------
\let\buildintable\table
\let\buildinendtable\endtable
\renewenvironment{table}[1][]{
    \buildintable[#1]%
    \footnotesize%
    \renewcommand\arraystretch{1.259}
}{
    \buildinendtable
}

%-------------------------------------------------------------------------------------------------
% End of class file definition
%-------------------------------------------------------------------------------------------------
\endinput
%
