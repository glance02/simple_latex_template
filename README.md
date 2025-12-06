# 简化版论文模板使用说明

## 概述

这是一个基于原始cumtthesis.cls文件简化而来的LaTeX论文模板，保留了核心的文档结构元素，同时移除了所有封面页、中英文双语支持、复杂命令定义和学校特定格式要求。

## 主要特点

- 保留了核心的LaTeX文档结构元素
- 支持单一语言标题（纯中文或纯英文）
- 简化了章节命令为标准的\chapter、\section等
- 使用Assets文件夹中的字体文件
- 支持Chapter文件夹中的章节内容包含
- 包含完整注释说明各部分功能
- 成功通过XeLaTeX编译测试

## 文件结构

```
项目根目录/
├── classTemplate.cls      # 简化版论文模板类文件
├── thesis.tex             # 主文档文件
├── Assets/                # 资源文件夹
│   └── Fonts/             # 字体文件夹
│       ├── Arial.ttf
│       ├── Arial-Bold.ttf
│       ├── Arial-Italic.ttf
│       ├── Arial-Bold-Italic.ttf
│       ├── SimSun.ttf
│       ├── SimHei.ttf
│       ├── SimKai.ttf
│       ├── SimLi.ttf
│       ├── SimSun-ExtB.ttf
│       ├── FangSong.ttf
│       └── STXingKai.ttf
├── Chapter/               # 章节文件夹
│   ├── introduction.tex   # 引言章节
│   ├── chapter1.tex       # 第一章
│   └── chapters.list      # 章节包含列表文件
└── README.md              # 使用说明文档
```

## 使用方法

### 1. 基本文档结构

```latex
\documentclass{classTemplate}

\begin{document}

% 前言部分
\frontmatter
\pagestyle{frontmatter}

% 摘要
\begin{abstract}
摘要内容...
\keywords{关键词1，关键词2，关键词3}
\end{abstract}

% 目录
\MakeContents

% 主体部分
\mainmatter
\pagestyle{mainmatter}

% 包含章节内容（使用标准input命令）
\input{Chapter/introduction.tex}
\input{Chapter/chapter1.tex}

% 参考文献
\MakeReferencePage
\begin{thebibliography}{99}
\bibitem{ref1} 参考文献1...
\end{thebibliography}

% 附录
\begin{appendix}
附录内容...
\end{appendix}

% 致谢
\begin{acknowledgements}
致谢内容...
\end{acknowledgements}

\end{document}
```

### 2. 章节内容包含

使用标准的`\input`命令包含章节文件：

```latex
% 在主文档中直接使用input命令包含章节
\input{Chapter/introduction.tex}
\input{Chapter/chapter1.tex}
```

这种方式更简洁，直接使用LaTeX的标准命令，无需额外的自定义命令。

### 3. 章节文件格式

每个章节文件（如`Chapter/introduction.tex`）应该包含：

```latex
% 引言章节
\chapter{引言}

这是引言章节的内容。

\section{研究背景}
这是引言中的第一节内容。

\section{研究意义}
这是引言中的第二节内容。

\section{研究内容}
这是引言中的第三节内容。
```

## 主要命令

### 环境命令

- `\begin{abstract}...\end{abstract}` - 摘要环境
- `\begin{appendix}...\end{appendix}` - 附录环境
- `\begin{acknowledgements}...\end{acknowledgements}` - 致谢环境

### 其他命令

- `\MakeContents` - 生成目录
- `\MakeReferencePage` - 生成参考文献页面
- `\keywords{关键词}` - 设置关键词

## 字体设置

模板使用Assets/Fonts文件夹中的字体文件：

- 英文主字体：Arial
- 中文主字体：SimSun
- 中文无衬线字体：SimHei
- 中文等宽字体：FangSong

## 编译方法

使用XeLaTeX编译：

```bash
xelatex thesis.tex
```

可能需要编译两次以确保目录和交叉引用正确。

## 章节标题格式

模板保留了所有六级标题格式：

1. `\chapter{章标题}` - 一级标题（章）
2. `\section{节标题}` - 二级标题（节）
3. `\subsection{小节标题}` - 三级标题（小节）
4. `\subsubsection{次小节标题}` - 四级标题（次小节）
5. `\paragraph{段落标题}` - 五级标题（段落）
6. `\subparagraph{小段标题}` - 六级标题（小段）

## 页面样式

模板定义了四种页面样式：

1. `empty` - 空白页样式
2. `frontmatter` - 前言部分样式（罗马数字页码）
3. `mainmatter` - 主体部分样式（阿拉伯数字页码）
4. `backmatter` - 后记部分样式

## 与原版cumtthesis.cls的主要区别

1. 移除了所有封面页相关代码
2. 移除了中英文双语支持
3. 移除了复杂命令定义
4. 移除了学校特定格式要求
5. 简化了字体设置，使用Assets文件夹中的字体
6. 增加了Chapter文件夹内容包含机制
7. 调整了章节标题间距，解决内容过近问题
8. 保留了核心的LaTeX文档结构元素

## 注意事项

1. 确保Assets/Fonts文件夹中包含所需的字体文件
2. 章节文件应放在Chapter文件夹中
3. 使用XeLaTeX编译以确保字体正确加载
4. 如果需要修改章节顺序，编辑Chapter/chapters.list文件
5. 模板已解决章节标题与正文内容过近的问题

## 故障排除

### 字体相关问题

如果遇到字体加载问题，请检查：

1. Assets/Fonts文件夹是否存在
2. 字体文件是否完整
3. 字体文件名是否正确

### 章节包含问题

如果章节内容未正确包含，请检查：

1. Chapter文件夹是否存在
2. 章节文件名是否正确
3. `\input`命令中的路径是否正确

## 更新日志

- v1.0.0 (2025/12/06) - 初始版本，基于cumtthesis.cls简化而来