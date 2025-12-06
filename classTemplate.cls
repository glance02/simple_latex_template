%-------------------------------------------------------------------------------------------------
% 简化版论文模板类文件
% 基于 cumtthesis.cls 简化而来，保留核心LaTeX文档结构元素
%-------------------------------------------------------------------------------------------------

%-------------------------------------------------------------------------------------------------
% 文档类声明和基础设置
%-------------------------------------------------------------------------------------------------
\NeedsTeXFormat{LaTeX2e}[2020/10/01]
\def\version{1.0.0}
\def\versiondate{2025/12/06}
\ProvidesClass{classTemplate}[\versiondate\space v\version\space Simple Thesis Template]

% 声明选项
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{ctexbook}}
\ProcessOptions\relax

% 静默 xeCJK/fontspec 冗余提示
\PassOptionsToPackage{quiet}{xeCJK}
\PassOptionsToPackage{quiet}{fontspec}
\RequirePackage{silence}
\WarningFilter{xeCJK}{Redefining CJKfamily}

% 基于ctexbook文档类，提供中文支持
\LoadClass[UTF8,a4paper,twoside,openany,onecolumn,zihao=-4,linespread=1.39]{ctexbook}[2020/10/01]

%-------------------------------------------------------------------------------------------------
% 必要的宏包加载
%-------------------------------------------------------------------------------------------------
% \RequirePackage{ctex} % 中文支持
\RequirePackage{geometry} % 页面布局
\RequirePackage{fancyhdr} % 页眉页脚
\RequirePackage{titletoc} % 目录样式
\RequirePackage{tocloft} % 目录格式
\RequirePackage{graphicx} % 图形支持
\RequirePackage{caption} % 图表标题
\RequirePackage{amsmath} % 数学公式
\RequirePackage{amssymb} % 数学符号
\RequirePackage{hyperref} % 超链接支持
\RequirePackage{setspace} % 行距设置
\RequirePackage{indentfirst} % 首行缩进
\RequirePackage{xstring} % 字符串处理
\RequirePackage{pgffor} % 用于foreach循环，支持章节文件批量包含

%-------------------------------------------------------------------------------------------------
% 页面布局设置
%-------------------------------------------------------------------------------------------------
\geometry{
    includeheadfoot, % 包含页眉和页脚
    left=3.17cm, % 左边距
    right=3.17cm, % 右边距
    top=2.54cm, % 上边距
    bottom=2.54cm, % 下边距
    headheight=1.5cm, % 页眉高度
    headsep=0.54cm, % 页眉与正文的间距
    footskip=1.0cm % 页脚与正文的间距
}

%-------------------------------------------------------------------------------------------------
% 字体设置
%-------------------------------------------------------------------------------------------------
% 设置字体路径，指向Assets/Fonts目录
\newcommand\fontpath{Assets/Fonts/}

% 重置字体族定义，避免冲突
\let\heiti\relax
\let\songti\relax

% 英文字体设置
\setmainfont{Arial}[
    BoldFont={Arial-Bold},
    ItalicFont={Arial-Italic},
    BoldItalicFont={Arial-Bold-Italic},
    Path=\fontpath,
    Extension=.ttf
]

% 中文字体设置
\setCJKmainfont{SimSun}[
    BoldFont={SimHei},
    ItalicFont={SimKai},
    BoldItalicFont={SimHei},
    AutoFakeBold=3,
    AutoFakeSlant=0.2,
    Path=\fontpath,
    Extension=.ttf
]
\setCJKsansfont{SimHei}[
    BoldFont={SimHei},
    AutoFakeBold=3,
    AutoFakeSlant=0.2,
    Path=\fontpath,
    Extension=.ttf
]
\setCJKmonofont{FangSong}[
    BoldFont={FangSong},
    AutoFakeBold=3,
    AutoFakeSlant=0.2,
    Path=\fontpath,
    Extension=.ttf
]

% 定义中文字体族命令，与原始cumtthesis.cls保持一致
\newCJKfontfamily{\heiti}[
    AutoFakeBold=3,
    AutoFakeSlant=0.2,
    Path=\fontpath,
    Extension=.ttf
]{SimHei}
\newCJKfontfamily{\songti}[
    AutoFakeBold=3,
    AutoFakeSlant=0.2,
    Path=\fontpath,
    Extension=.ttf
]{SimSun}
\newCJKfontfamily{\kaiti}[
    AutoFakeBold=3,
    AutoFakeSlant=0.2,
    Path=\fontpath,
    Extension=.ttf
]{SimKai}

%-------------------------------------------------------------------------------------------------
% 行间距和段落设置
%-------------------------------------------------------------------------------------------------
\setlength{\parskip}{0pt} % 段落间距
\renewcommand{\baselinestretch}{1.39} % 行间距倍数

%-------------------------------------------------------------------------------------------------
% 超链接设置
%-------------------------------------------------------------------------------------------------
\hypersetup{
    unicode=true, % 启用 Unicode 支持
    bookmarksnumbered=true, % 书签显示编号
    bookmarksopen=true, % 展开书签
    bookmarksopenlevel=3, % 展开书签到第 3 级
    breaklinks=true, % 允许链接换行
    plainpages=false, % 禁用纯页码模式
    pdfborder=0 0 0, % 去除链接边框
    pdfstartview=FitH, % PDF 打开时适合页面宽度
    colorlinks=true, % 启用彩色链接
    linkcolor=black, % 内部链接颜色
    urlcolor=black, % URL 链接颜色
    citecolor=black, % 引用链接颜色
    linktoc=all % 目录中所有条目添加链接
}

%-------------------------------------------------------------------------------------------------
% 基础命令定义
%-------------------------------------------------------------------------------------------------
% 简单的换页命令
\newcommand{\clearsinglepage}{\clearpage}

%-------------------------------------------------------------------------------------------------
% 章节标题格式设置
%-------------------------------------------------------------------------------------------------
\ctexset{
    % 一级标题[章]（中文黑体，数字Arial，小二加粗，单倍行距，段前6磅，段后20磅）
    chapter = {
        name       = {,}, % 不显示"章"字
        format     = \linespread{1}\zihao{-2}\heiti\bfseries\raggedright,
        indent     = 0pt,
        number     = \arabic{chapter},
        aftername  = \hspace{0.5\ccwd},
        beforeskip = 13pt,
        afterskip  = 20pt, % 增加章标题后的间距，解决内容过近问题
        pagestyle  = fancy,
        runin      = false,
        fixskip     = true,
    },
    % 二级标题[节]（中文黑体，数字英文Arial，小三号，行距固定值20磅）
    section = {
        format     = \setlength{\baselineskip}{20pt}\zihao{-3}\heiti\raggedright,
        indent     = 0pt,
        aftername  = \hspace{0.5\ccwd},
        beforeskip = 12pt, % 增加节标题前的间距
        afterskip  = 12pt, % 增加节标题后的间距
        runin      = false,
    },
    % 三级标题[小节]（中文黑体，数字Arial，四号，行距固定值20磅）
    subsection = {
        format     = \setlength{\baselineskip}{20pt}\zihao{4}\heiti\raggedright,
        indent     = 0pt,
        aftername  = \hspace{0.5\ccwd},
        beforeskip = 8pt, % 增加小节标题前的间距
        afterskip  = 8pt, % 增加小节标题后的间距
        runin      = false,
    },
    % 四级标题[次小节]（中文黑体，数字Arial，小四号，行距固定值20磅）
    subsubsection = {
        format     = \setlength{\baselineskip}{20pt}\zihao{-4}\heiti\raggedright,
        indent     = 0pt,
        aftername  = \hspace{0.5\ccwd},
        beforeskip = 6pt, % 增加次小节标题前的间距
        afterskip  = 6pt, % 增加次小节标题后的间距
        runin      = false,
    },
    % 五级标题[段落]（中文宋体，数字Arial，小四号，行距固定值20磅）
    paragraph = {
        format     = \setlength{\baselineskip}{20pt}\zihao{-4}\songti\bfseries\raggedright,
        number     = \hspace*{-0.4\ccwd}（\arabic{paragraph}）,
        aftername  = \hspace{0pt},
        indent     = 2\ccwd,
        beforeskip = 4pt, % 增加段落标题前的间距
        afterskip  = 4pt, % 增加段落标题后的间距
        runin      = true,
    },
    % 六级标题[小段]（中文宋体，数字Arial，小四号，行距固定值20磅）
    subparagraph = {
        format     = \setlength{\baselineskip}{20pt}\zihao{-4}\songti\bfseries\raggedright,
        number     = \circledtext{subparagraph},
        aftername  = \hspace{0.1\ccwd},
        indent     = 2\ccwd,
        beforeskip = 4pt, % 增加小段标题前的间距
        afterskip  = 4pt, % 增加小段标题后的间距
        runin      = true,
    },
}

% 标题编号深度
\setcounter{secnumdepth}{5}
% \chapter：章（第0级）
% \section：节（第1级）
% \subsection：子节（第2级）
% \subsubsection：次子节（第3级）
% \paragraph：段落（第4级）
% \subparagraph：子段落（第5级）

%-------------------------------------------------------------------------------------------------
% 目录生成功能
%-------------------------------------------------------------------------------------------------
% 目录格式设置
\titlecontents{chapter}
[\z@]
{\zihao{-4}\setlength{\baselineskip}{20pt}\bfseries}
{\contentspush{\thecontentslabel\hspace{0.5\ccwd}}}
{}
{\titlerule*[3pt]{$\boldsymbol{\cdot}$}\contentspage}
[\vskip 1.8pt]

\titlecontents{section}
[\z@]
{\zihao{-4}\setlength{\baselineskip}{20pt}}
{\contentspush{\thecontentslabel\hspace{0.5\ccwd}}}
{}
{\titlerule*[3pt]{$\cdot$}\contentspage}
[\vskip 1.8pt]

% 目录页码宽度
\cftsetpnumwidth{2em}

% 目录显示深度到二级标题(section)
\setcounter{tocdepth}{1}

% 生成目录命令
\newcommand\MakeContents{
    \newpage
    \vspace*{-10pt}
    {\centering\linespread{1}\zihao{-2}\heiti\bfseries 目\hspace{\ccwd}录\par}
    \vspace{12pt}
    \phantomsection
    \addcontentsline{toc}{chapter}{目录}
    \@starttoc{toc}
    \clearpage
}

%-------------------------------------------------------------------------------------------------
% 页眉页脚基础样式
%-------------------------------------------------------------------------------------------------
% 页面样式定义
% 在类文件加载时直接定义页面样式
% 空白页样式
\fancypagestyle{empty}{
    \fancyhf{}
    \fancyhead{}
    \fancyfoot{}
    \renewcommand\footrulewidth{0pt}
    \renewcommand\headrulewidth{0pt}
}

% 前言部分样式
\fancypagestyle{frontmatter}{
    \fancyhf{}
    \pagenumbering{Roman}
    \fancyhead{}
    \fancyfoot{}
    \fancyfoot[C]{\zihao{-5} \textbf{\thepage}}
    \renewcommand\footrulewidth{0pt}
    \renewcommand\headrulewidth{0pt}
}

% 主体部分样式
\fancypagestyle{mainmatter}{
    \fancyhf{}
    \pagenumbering{arabic}
    \fancyhead[C]{\zihao{-5}\linespread{1}\leftmark}
    \fancyhead[R]{}
    \fancyhead[L]{}
    \fancyfoot[C]{\zihao{-5} \textbf{\thepage}}
    \setlength\headwidth{\textwidth}
    \renewcommand\footrulewidth{0pt}
    \renewcommand\headrulewidth{0.5pt}
}

% 后记部分样式
\fancypagestyle{backmatter}{
    \fancyhf{}
    % 沿用mainmatter的arabic页码
    \fancyhead[C]{\zihao{-5}\linespread{1}\leftmark}
    \renewcommand\headrulewidth{0.5pt}
    \fancyfoot[C]{\zihao{-5} \textbf{\thepage}}
    \renewcommand\footrulewidth{0pt}
}

% 重定义页面样式命令
\let\buildinpagestyle\pagestyle
\renewcommand\pagestyle[1]{
    \IfStrEq{#1}{backmatter}{
        \clearpage
    }{}
    \buildinpagestyle{#1}
}

% 章节标记设置
\renewcommand\chaptermark[1]{\markboth{\thechapter\hspace{0.5\ccwd}#1}{}}

%-------------------------------------------------------------------------------------------------
% 基础环境定义
%-------------------------------------------------------------------------------------------------
% 摘要环境
\newenvironment{abstract}{
    \newpage
    \vspace*{-10pt}
    {\centering\linespread{1}\zihao{-2}\heiti\bfseries 摘\hspace{\ccwd}要\par}
    \vspace{12pt}
    \phantomsection
    \addcontentsline{toc}{chapter}{摘要}
    \par
    \sloppy
    \zihao{-4}\setlength{\baselineskip}{20pt}
}{
    \clearpage
}

% 关键词命令
\newcommand\keywords[1]{
    \par\vspace{6pt}
    \noindent\textbf{关键词：}#1
}

%-------------------------------------------------------------------------------------------------
% 参考文献引用基础功能
%-------------------------------------------------------------------------------------------------
% 定义参考文献字体命令
\newcommand{\bibfont}{\zihao{5}}

% 参考文献页面格式
\newcommand\MakeReferencePage{
    \chapter*{参考文献}
    \setlength{\bibhang}{0pt}
    \setlength{\bibitemsep}{0pt}
    \setlength{\biblabelsep}{0.5\ccwd}
    \begingroup
    \setstretch{1.587} % = 20pt / (10.5pt * 1.2) ≈ 1.587
    \vspace*{8pt}
    % 这里使用基础的thebibliography环境，不依赖复杂的biblatex
    \endgroup
    \clearpage
}

% 简单的引用命令（如果未使用biblatex）
\newcommand{\simplecite}[1]{\textsuperscript{[#1]}}

%-------------------------------------------------------------------------------------------------
% 其他环境定义
%-------------------------------------------------------------------------------------------------
% 附录环境
\let\appendix\relax
\newcounter{appendixnum}
\newenvironment{appendix}{
    \stepcounter{appendixnum}
    \chapter*{附录~\theappendixnum}
    \setstretch{1.587}
    \zihao{5}
}{
    \clearpage
}

% 致谢环境
\newenvironment{acknowledgements}{
    \chapter*{致谢}
    \zihao{-4}\setlength{\baselineskip}{20pt}
}{
    \clearpage
}

%-------------------------------------------------------------------------------------------------
% 辅助命令
%-------------------------------------------------------------------------------------------------
% 圆圈数字命令（用于脚注等）
\newcommand\circledtext[1]{
    \ifnum\value{#1}<11\relax
        {\symbol{\numexpr\value{#1} + "245F\relax}}%
    \else
        \ClassError{classTemplate}{Exceeding the maximum allowed number (<=10), got \the\value{#1}}{}%
    \fi
}

%-------------------------------------------------------------------------------------------------
% 图表格式设置
%-------------------------------------------------------------------------------------------------
% 图表标题格式
\DeclareCaptionFont{templatecaptionfont}{\zihao{5}}
\captionsetup{
    font           = templatecaptionfont,
    labelsep       = space,
    skip           = 5pt,
    figureposition = bottom,
    tableposition  = top,
}

% 图表编号格式
\renewcommand\thetable{\arabic{chapter}-\arabic{table}}
\renewcommand\thefigure{\arabic{chapter}-\arabic{figure}}

%-------------------------------------------------------------------------------------------------
% 公式编号格式
%-------------------------------------------------------------------------------------------------
\renewcommand\theequation{\thechapter-\arabic{equation}}

%-------------------------------------------------------------------------------------------------
% 脚注格式
%-------------------------------------------------------------------------------------------------
% 直接在类文件中定义必要的长度变量
\newlength{\footnotemargin}
\newlength{\bibhang}
\newlength{\bibitemsep}
\newlength{\biblabelsep}

%使用阿拉伯数字作为脚注编号
% \renewcommand\thefootnote{\circledtext{footnote}}
\renewcommand\thefootnote{\arabic{footnote}}
\renewcommand\footnotesize{\linespread{1}\zihao{-5}}
\setlength{\footnotemargin}{10pt}

%-------------------------------------------------------------------------------------------------
% 表格样式
%-------------------------------------------------------------------------------------------------
\let\buildintable\table
\let\buildinendtable\endtable
\renewenvironment{table}[1][]{
    \buildintable[#1]%
    \zihao{5}%
    \renewcommand\arraystretch{1.259}
}{
    \buildinendtable
}

%-------------------------------------------------------------------------------------------------
% 结束类文件定义
%-------------------------------------------------------------------------------------------------
\endinput
%
