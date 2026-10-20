% xautCADreport.cls
% LaTeX Class for Xi'an University of Technology (西安理工大学)
% Digital Design and Manufacturing Course Design Report (数字化设计与制造课程设计报告)
% 
% 严格遵循《数字化设计与制造课程设计》说明书格式要求
% 
% 基于文件：6.《数字化设计与制造课程设计》说明书格式要求.docx
% 版本：1.1 (完善版)
% 日期：2026-06-15
% 
% ============================================================
% 使用说明：
% 1. 将此文件放在您的LaTeX项目目录中
% 2. 在文档开头使用 \documentclass{xautCADreport}
% 3. 使用XeLaTeX编译（推荐使用latexmk -xelatex）
% ============================================================

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{xautCADreport}[2026/06/15 Xi'an University of Technology CAD Course Design Report Class]

% ============================================================
% 第一部分：文档类选项与基础设置
% ============================================================

% 将未知选项传递给ctexart文档类
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{ctexart}}
\ProcessOptions\relax

% 加载基础文档类
% - 11pt: 基础字号（对应小四号字，约12pt）
% - a4paper: A4纸张（210mm × 297mm）
% - twoside: 双面打印模式（用于页眉页脚的交替显示）
\LoadClass[11pt, a4paper, twoside]{ctexart}

% ============================================================
% 第二部分： required Packages (必需的宏包)
% ============================================================

% 页面布局设置
% top=2.5cm, bottom=2.5cm: 上、下边距2.5cm
% left=2.5cm, right=2.5cm: 左、右边距2.5cm
% 注意：装订线、页眉、页脚距离在geometry的otherkeys中设置
\RequirePackage[top=2.5cm, bottom=2.5cm, left=2.5cm, right=2.5cm]{geometry}

% 数学公式支持
\RequirePackage{amsmath, amssymb, amsfonts}   % AMS数学公式、符号、字体

% 图形支持
\RequirePackage{graphicx}                      % 插入图片（支持PNG、JPG、PDF等）

% 表格支持
\RequirePackage{booktabs}                     % 专业表格线（\toprule, \midrule, \bottomrule）
\RequirePackage{longtable}                     % 跨页长表格

% 页眉页脚设置
\RequirePackage{fancyhdr}                       % 自定义页眉页脚

% 标题格式设置
\RequirePackage{titlesec}                      % 章节标题格式
\RequirePackage{titletoc}                      % 目录格式

% 列表环境设置
\RequirePackage{enumitem}                       % 自定义列表（enumerate, itemize）

% 行距设置
\RequirePackage{setspace}                       % 设置行距（1.5倍、固定值等）

% 图表标题设置
\RequirePackage{caption}                        % 自定义图表标题格式

% 参考文献支持
\RequirePackage[numbers,sort&compress]{natbib}                        % 参考文献引用（支持author-year和numeric）
\RequirePackage{bibentry}                      % 在正文嵌入参考文献条目

% 段落格式
\RequirePackage{indentfirst}                    % 首段缩进（中文排版规范）

% 浮动体设置
\RequirePackage{float}                          % 浮动体控制（[h], [t], [b], [p]）

% 颜色支持
\RequirePackage{xcolor}                         % 颜色定义和使用

% 超链接设置
\RequirePackage{hyperref}                       % PDF超链接和书签

% 其他工具包
\RequirePackage{etoolbox}                       % 条件判断和宏工具
\RequirePackage{calc}                           % 长度计算
\RequirePackage{listings}
\RequirePackage{tcolorbox}                       % 代码排版（NC程序展示）
\RequirePackage{inconsolata}                    % 等宽字体（代码用）

% NC代码排版样式
\lstdefinelanguage{NC}{
  morekeywords={G0,G1,G2,G3,G17,G18,G19,G20,G21,G28,G40,G41,G42,G43,G49,G54,G80,G81,G83,G90,G91,G99,M0,M1,M3,M5,M6,M30,T1,T2,T3,T4,T5,S,F,X,Y,Z,A,I,J,K,R,H,D,O},
  sensitive=true,
  morecomment=[l]{(},
  morestring=[b]"
}
\renewcommand{\lstlistingname}{代码}
\lstset{
  language=NC,
  basicstyle=\ttfamily\small,
  keywordstyle=\ttfamily\small,
  commentstyle=\ttfamily\small,
  numbers=left,
  numberstyle=\tiny\color{gray},
  numbersep=6pt,
  frame=single,
  rulecolor=\color{black!20},
  backgroundcolor=\color{white},
  breaklines=true,
  breakatwhitespace=true,
  tabsize=2,
  showstringspaces=false,
  xleftmargin=1em,
  framexleftmargin=1em
}

% ============================================================
% 第三部分：字体与编码设置
% ============================================================

% 使用fontspec宏包进行字体配置（XeLaTeX专用）
\RequirePackage{fontspec}

% 设置英文字体为Times New Roman（符合格式要求）
\setmainfont{Times New Roman}

% 设置中文字体
% SimSun: 宋体（正文用小四号宋体）
% AutoFakeBold=true: 启用伪粗体（解决某些字体没有粗体的问题）
% AutoFakeSlant=true: 启用伪斜体
\setCJKmainfont{SimSun}[AutoFakeBold=true, AutoFakeSlant=true]

% 设置中文无衬线字体为黑体（标题用粗黑体）
% SimHei: 黑体
\setCJKsansfont{SimHei}[AutoFakeBold=true]

% 定义楷体字体族（页眉用5号楷体）
% KaiTi: 楷体
\setCJKfamilyfont{kai}[AutoFakeSlant=true]{KaiTi}

% 提供\kaishu命令（如果已定义则不会重复定义）
\providecommand{\kaishu}{\CJKfamily{kai}}

% 定义华文行楷（封面用）
\setCJKfamilyfont{STXK}[AutoFakeBold=true]{STXingkai}

% 定义隶书（封面用）
\setCJKfamilyfont{lishu}{LiSu}

% 提供\STXK命令（华文行楷）和\lishu命令
\providecommand{\STXK}{\CJKfamily{STXK}}
\providecommand{\lishu}{\CJKfamily{lishu}}

% ============================================================
% 第四部分：行距与缩进设置
% ============================================================

% 首行缩进2字符（中文排版规范）
\setlength{\parindent}{2em}

% 行距设置：1.5倍行距
% 说明：Word中的"固定值20pt"在小四号字（12pt）时约为1.67倍
% 但格式要求中说"行间距设置为：固定值"，这里使用1.5倍行距
% 如需精确匹配Word的"固定值20pt"，可使用 \setstretch{1.67} 或 \linespread{1.67}
\linespread{1.5}

% 禁止页面底部拉伸（防止因图片浮动导致行间距被撑大）
\raggedbottom

% 字间距设置为"标准"（LaTeX默认即为标准字间距，无需额外设置）
% 如需调整字间距，可使用 \CJKsetecglue 命令

% ============================================================
% 第五部分：页眉页脚设置
% ============================================================

% 清空默认页眉页脚设置
\fancyhf{}

% 设置页面样式为fancy
\pagestyle{fancy}

% 增加页眉高度（避免页眉内容溢出）
\setlength{\headheight}{20pt}

% 页眉设置（双面打印模式）
% 奇数页（CO = Center Odd）：显示章节名
% 格式：5号楷体，居中
% \leftmark: 当前章节名（需要配合\markboth或\section的mark设置）
\fancyhead[CO]{\zihao{5}\kaishu\leftmark}

% 偶数页（CE = Center Even）：显示"数字化设计与制造课程设计说明书"
% 格式：5号楷体，居中
\fancyhead[CE]{\zihao{5}\kaishu 2026年数字化设计与制造课程设计说明书}

% 页脚设置：页码居中
% 格式：5号宋体
\fancyfoot[C]{\zihao{5}\songti\thepage}

% 页眉横线设置
% 0.4pt单线（符合格式要求）
\renewcommand{\headrulewidth}{0.4pt}

% 页脚横线设置（不需要横线）
\renewcommand{\footrulewidth}{0pt}

% ============================================================
% 第六部分：标题格式设置（严格遵循格式要求）
% ============================================================

% 一级标题（\section）
% 格式要求：三号粗黑体，居左，单倍行距
% \zihao{3}: 三号字（16pt）
% \heiti: 黑体
% \bfseries: 加粗
% \centering: 居中对齐
\titleformat{\section}{\zihao{3}\heiti\bfseries\centering}{\thesection}{1em}{}

% 一级标题间距设置
% 第一个0pt: 段前间距
% 第二个0pt: 段后间距
% 第三个0pt: 行前间距（单倍行距）
% 注意：格式要求"单倍行距"，这里设置为0pt让LaTeX自动处理
\titlespacing*{\section}{0pt}{0pt}{0pt}

% 二级标题（\subsection）
% 格式要求：小三号粗黑体，居左，单倍行距
% \zihao{-3}: 小三号字（15pt）
\titleformat{\subsection}{\zihao{-3}\heiti\bfseries\raggedright}{\thesubsection}{1em}{}
\titlespacing*{\subsection}{0pt}{0pt}{0pt}

% 三级标题（\subsubsection）
% 格式要求：四号粗黑体，居左，单倍行距
% \zihao{4}: 四号字（14pt）
\titleformat{\subsubsection}{\zihao{4}\heiti\bfseries\raggedright}{\thesubsubsection}{1em}{}
\titlespacing*{\subsubsection}{0pt}{0pt}{0pt}

% 四级标题（\paragraph）
% 格式要求：小四号粗黑体，居左
% \zihao{-4}: 小四号字（12pt）
\titleformat{\paragraph}{\zihao{-4}\heiti\bfseries\raggedright}{\theparagraph}{1em}{}
\titlespacing*{\paragraph}{0pt}{0pt}{0pt}

% 五级标题（\subparagraph）
% 格式要求：（1）小四号宋体
% 注意：格式要求使用"(1)"格式，这里使用中文数字括号
\titleformat{\subparagraph}{\zihao{-4}\songti}{（\arabic{subparagraph}）}{0.5em}{}
\titlespacing*{\subparagraph}{0pt}{0pt}{0pt}

% ============================================================
% 第七部分：公式编号设置
% ============================================================

% 公式按章节编号（格式要求：公式号按章编排，如（2.3））
% 效果：公式编号显示为 (章节号-公式序号)
\numberwithin{equation}{section}

% 修改公式编号格式为"（章节号.公式序号）"
\renewcommand{\theequation}{\arabic{section}.\arabic{equation}}

% ============================================================
% 第八部分：图表标题格式设置
% ============================================================

% 图标题设置
% 格式要求：
% - 中文用五号宋体
% - 英文用Times New Roman体五号
% - 图号与图题间应空1个字距
% - 在图的下方居中标出
\captionsetup[figure]{
  font={small},                           % 五号字（10.5pt）
  labelfont={},                         % 标签加粗
  textfont={},                           % 文本字体（默认宋体）
  justification=centering,                % 居中
  name={图},                              % 图标签
  labelsep=space,                         % 标签与文本间空格（1个字距）
  position=bottom,                        % 标题在图下方
  format=hang                             % 悬挂缩进（多行标题时）
}

% 表标题设置
% 格式要求：
% - 中文用五号宋体
% - 英文用Times New Roman体五号
% - 表格序号和表题间空1个字距
% - 必须置于表格上方居中排列
\captionsetup[table]{
  font={small},                           % 五号字（10.5pt）
  labelfont={},                         % 标签加粗
  textfont={},                           % 文本字体（默认宋体）
  justification=centering,                % 居中
  name={表},                              % 表标签
  labelsep=space,                         % 标签与文本间空格（1个字距）
  position=top,                          % 标题在表格上方
  format=hang                             % 悬挂缩进（多行标题时）
}

% ============================================================
% 第九部分：目录格式设置
% ============================================================

% 目录标题格式
% 格式要求：黑体三号，居中
\renewcommand{\contentsname}{\centering\zihao{3}\heiti 目\quad 录\par\vspace{2em}}

% 目录条目格式
% 设置section条目的格式
% 0pt: 左边距
% \zihao{-4}: 小四号字
% \songti: 宋体
% \quad: 标签与标题间间距
% \titlerule*[0.5pc]{.}: 点线填充
% \contentspage: 页码
\titlecontents{section}[0pt]{\zihao{-4}\songti}{\thecontentslabel\quad}{}{\titlerule*[0.5pc]{.}\contentspage}

% 设置subsection条目的格式
% 2em: 左边距（缩进）
\titlecontents{subsection}[2em]{\zihao{-4}\songti}{\thecontentslabel\quad}{}{\titlerule*[0.5pc]{.}\contentspage}

% 设置subsubsection条目的格式
% 4em: 左边距（缩进）
\titlecontents{subsubsection}[4em]{\zihao{-4}\songti}{\thecontentslabel\quad}{}{\titlerule*[0.5pc]{.}\contentspage}

% ============================================================
% 第十部分：摘要环境设置
% ============================================================

% 中文摘要环境
% 格式要求：
% - "摘要"题头：小四号黑体加粗，居中
% - 正文：小四号宋体
% - "关键词"：小四号宋体加粗
\renewenvironment{abstract}{
  \clearpage
  % "序言"题头：居中、三号、黑体加粗
  \centering\zihao{3}\heiti\bfseries 序言
  \par\vspace{1em}                       % 题头与正文间空一行
  % 正文：首行缩进、小四号、宋体
  \noindent\zihao{-4}\songti\par
  % 取消居中，恢复两端对齐
  \raggedright
}{
  \par
}

% 英文摘要环境
% 格式要求：
% - 论文题目：全部用大写字母、Arial四号加粗
% - Abstract：Arial四号加粗
% - 姓名：Arial四号加粗
% - 正文：Times New Roman小四号
% - Key words：Times New Roman小四号加粗
%
% 使用方法：
% \begin{Abstract}{THESIS TITLE}
% Abstract content...
% \end{Abstract}
%
% 注意：需要手动传入论文题目（大写）
\newenvironment{Abstract}[1][]{%
  \clearpage
  % 如果提供了论文题目，则显示
  \ifx&#1&\else
    % 论文题目：居中、四号、Arial加粗、全部大写
    \centering\zihao{4}\textbf{\MakeUppercase{#1}}
    \par\vspace{0.5em}
  \fi
  % Abstract题头：居中、四号、加粗
  \centering\zihao{4}\textbf{Abstract}
  \par\vspace{1em}                        % 题头与正文间空一行
  % 正文：小四号、Times New Roman
  \noindent\zihao{-4}\par
  % 取消居中，恢复两端对齐
  \raggedright
}{
  \par
}

% ============================================================
% 第十一部分：参考文献格式设置
% ============================================================

% 使用gbt7714宏包（符合GB/T 7714-2015国标）
\RequirePackage{gbt7714}

% 设置参考文献样式为数字编号制
\bibliographystyle{gbt7714-numerical}

% 参考文献列表字体设置
% 格式要求：五号宋体（英文用Times New Roman体五号）
\renewcommand{\bibfont}{\zihao{5}}

% 参考文献标题格式
\renewcommand{\bibname}{\zihao{3}\heiti 参考文献}

% ============================================================
% 第十二部分：致谢环境设置
% ============================================================

% 致谢环境
% 格式要求：
% - "致谢"标题：黑体三号，居中
% - 正文：小四号宋体
\newcommand{\acknowledgment}{
  \clearpage
  % 添加致谢章节（不编号，但计入目录）
  \section*{致\quad 谢}
  % 添加到目录
  \addcontentsline{toc}{section}{致谢}
  % 正文：小四号、宋体
  \zihao{-4}\songti
}

% ============================================================
% 第十三部分：自定义命令
% ============================================================

% 图引用命令（自动添加"图"字）
\newcommand{\figref}[1]{图\ref{#1}}

% 表引用命令（自动添加"表"字）
\newcommand{\tabref}[1]{表\ref{#1}}

% 公式引用命令（自动添加"式"字和括号）
\newcommand{\eqnref}[1]{式(\ref{#1})}

% ============================================================
% 第十四部分：列表格式设置
% ============================================================

% 设置enumerate环境的默认格式
% 一级列表：(1), (2), (3)...
\renewcommand{\theenumi}{(\arabic{enumi})}
\renewcommand{\labelenumi}{\theenumi}

% 二级列表：a., b., c....
\renewcommand{\theenumii}{\alph{enumii}.}
\renewcommand{\labelenumii}{\theenumii}

% 三级列表：(a), (b), (c)...
\renewcommand{\theenumiii}{(\alph{enumiii})}
\renewcommand{\labelenumiii}{\theenumiii}

% ============================================================
% 第十五部分：图表按章节编号
% ============================================================

% 图按章节编号（格式要求：所有插图按章编号，如第1章的第1张插图为"图1-1"）
\counterwithin{figure}{section}
% 修改图编号格式为"章节号-图序号"
\renewcommand{\thefigure}{\arabic{section}-\arabic{figure}}

% 表按章节编号（格式要求：表格序号一律采用阿拉伯数字分章编号，如第3章第1个表的表序表示为"表3-1"）
\counterwithin{table}{section}
% 修改表编号格式为"章节号-表序号"
\renewcommand{\thetable}{\arabic{section}-\arabic{table}}

% ============================================================
% 第十六部分：封面命令
% ============================================================

% 定义封面所需命令（用户可在导言区设置）
\newcommand{\major}[1]{\def\@major{#1}}           % 专业
\newcommand{\class}[1]{\def\@class{#1}}           % 班级
\newcommand{\studentid}[1]{\def\@studentid{#1}} % 学号
\newcommand{\advisor}[1]{\def\@advisor{#1}}       % 指导教师

% 封面制作命令（严格按DOCX封面格式）


\newcommand{\makecover}{
  \thispagestyle{empty}
  \pagenumbering{gobble}
  \begin{center}
    % 0. 顶部图片
    \includegraphics[width=0.6\textwidth]{figures/图片1.png}

    \vspace{0.8cm}

    % 1. 主标题：26pt，华文行楷，加粗，居中
    {\fontsize{36pt}{48pt}\selectfont\STXK\bfseries 数字化设计与制造\par}

    \vspace{0.7cm}

    % 2. 副标题区
    % 第二行：课程设计（52pt，隶书，不加粗，居中）
    {\fontsize{52pt}{62pt}\selectfont\lishu 课程设计\par}
    \vspace{0.3cm}

    % 第三行：说  明  书（26pt，黑体，加粗，居中，字间空格）
    {\fontsize{26pt}{36pt}\selectfont\heiti\bfseries
      说\hspace*{2em}明\hspace*{2em}书\par}

    \vfill

    % 3. 信息区：每个字段一行，标签左对齐，值居中在下划线上
    {\zihao{3}\songti
      \setlength{\tabcolsep}{0pt}
      \begin{tabular}{@{}l@{\hspace{0.5em}}c@{}}
        \textbf{专业：}    & \underline{\makebox[8cm][c]{\@major}}    \\
        \textbf{班级：}    & \underline{\makebox[8cm][c]{\@class}}    \\
        \textbf{学号：}    & \underline{\makebox[8cm][c]{\@studentid}}\\
        \textbf{姓名：}    & \underline{\makebox[8cm][c]{\@author}}   \\
        \textbf{指导教师：}& \underline{\makebox[8cm][c]{\@advisor}}  \\
      \end{tabular}
      \par
    }

    \vfill

    % 4. 日期（加粗，居中）
    {\zihao{3}\songti\bfseries \today\par}
  \end{center}
  \clearpage
  \pagenumbering{arabic}
  \setcounter{page}{1}
}



% ============================================================
% 第十七部分：超链接设置
% ============================================================

% 设置超链接样式
% 注意：colorlinks=true会使用颜色而不是框线
% linkcolor=black: 内部链接颜色（黑色，符合打印要求）
% citecolor=black: 引用链接颜色（黑色）
% urlcolor=blue: URL链接颜色（蓝色）
\hypersetup{
  colorlinks=true,
  linkcolor=black,
  citecolor=black,
  urlcolor=blue,
  bookmarksopen=true,
  bookmarksopenlevel=2,
}

% ============================================================
% 第十七部分：其他设置
% ============================================================

% 设置浮动体默认位置
% h: 此处，t: 页顶，b: 页底，p: 单独一页
\renewcommand{\fps@figure}{htbp}
\renewcommand{\fps@table}{htbp}

% 设置图片和表格的延伸（避免浮动体过于分散）
\renewcommand{\topfraction}{0.85}
\renewcommand{\bottomfraction}{0.70}
\renewcommand{\textfraction}{0.15}
\renewcommand{\floatpagefraction}{0.66}

% ============================================================
% 文件结束
% ============================================================
\endinput
%%
%% End of file `xautCADreport.cls'.
