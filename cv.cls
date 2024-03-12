\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{cv}[2022/04/29 v1.0.0 CV Class]

\LoadClass[a4paper, 11pt]{article}

\RequirePackage{arev}
\RequirePackage{array}
\RequirePackage[english]{babel}
\RequirePackage[ddmmyyyy, hhmmss]{datetime}
\RequirePackage{enumitem}
\RequirePackage{fontenc}
\RequirePackage{fontspec}
\RequirePackage{fontawesome5}
\RequirePackage{geometry}
\RequirePackage[hidelinks, pdfencoding=auto]{hyperref}
\RequirePackage{indentfirst}
\RequirePackage{lastpage}
\RequirePackage{paralist}
\RequirePackage{setspace}
\RequirePackage[skins]{tcolorbox}
\RequirePackage{textcomp}
\RequirePackage{tikz}
\RequirePackage{titlesec}
\RequirePackage{url,parskip}
\RequirePackage{xcolor}
\RequirePackage{xparse}
\RequirePackage{fancyhdr}
\RequirePackage{wasysym}

\newcommand*{\fontdir}[1][fnt/]{\def\@fontdir{#1}}
\fontdir

\definecolor{accentcolor}{HTML}{400000}
\definecolor{bordercolor}{HTML}{505050}

\geometry{left=1.5cm, top=1.5cm, right=1.5cm, bottom=2.0cm, footskip=0.8cm}

\titleformat{\section}{\Large\raggedright}{}{0em}{}[\titlerule]
\titlespacing{\section}{0pt}{2pt}{2pt}

% Fancy header and footer
\fancyhfoffset{0em}
\renewcommand{\headrulewidth}{0pt}
\fancyhf{}
\pagestyle{fancy}

\renewcommand{\dateseparator}{.}
\newcommand\listdelimiter{\enspace\textbullet\enspace}

\newlist{ranglelist}{enumerate}{1}
\setlist[ranglelist,1]{label=\faAngleRight, leftmargin=0.5cm, itemsep=0.5mm}

\newcolumntype{R}[1]{>{\hfill}m{#1}}

\defaultfontfeatures{Mapping=tex-text}
\setmainfont{SourceSans3}
[Path=\@fontdir, BoldFont=*-Regular, ItalicFont=*-LightIt, UprightFont=*-Light]

\newcommand{\faIconBox}[1]{\makebox[1.2em][c]{#1}}
\newcommand{\emailSymbol}{\faIconBox{\faEnvelope[regular]}}
\newcommand{\phoneSymbol}{\faIconBox{\faPhone}}
\newcommand{\githubSymbol}{\faIconBox{\faGithub}}
\newcommand{\webpageSymbol}{\faIconBox{\faLink}}
\newcommand{\linkedinSymbol}{\faIconBox{\faLinkedin}}
\newcommand{\telegramSymbol}{\faIconBox{\faTelegram}}
\newcommand{\leetcodeSymbol}{\faIconBox{\faLink}}
\newcommand{\locationSymbol}{\faIconBox{\faMapMarker*}}
\newcommand{\addSectionSymbol}{\faIconBox{\faPlus}}
\newcommand{\achSectionSymbol}{\faIconBox{\faStar}}
\newcommand{\eduSectionSymbol}{\faIconBox{\faGraduationCap}}
\newcommand{\expSectionSymbol}{\faIconBox{\faLaptop}}
\newcommand{\langSectionSymbol}{\faIconBox{\faLanguage}}
\newcommand{\projSectionSymbol}{\faIconBox{\faCode}}
\newcommand{\skillSectionSymbol}{\faIconBox{\faCogs}}
\newcommand{\techSectionSymbol}{\faIconBox{\faTasks}}

\newcommand\link[2]{\color{accentcolor}\href{#1}{#2}\color{black}}

\newcommand{\cvtag}[1]{
  \tikz[baseline]
  \node[
    anchor=base, draw=bordercolor, rounded corners=0.5ex, inner xsep=1ex,
    inner ysep =0.55ex, text height=1.3ex, text depth=.25ex
  ]
  {#1};
}

\newcommand*{\firstname}[1]{\def\@firstname{#1}}
\newcommand*{\lastname}[1]{\def\@lastname{#1}}
\newcommand*{\name}[2]{\def\@firstname{#1}\def\@lastname{#2}}
\newcommand*{\user}[2]{\color{accentcolor}{\fontsize{30pt}{0pt}\selectfont\textsc{#1} \textsc{\textbf{#2}}}\color{black}}
\newcommand*{\socialsymbol}[2]{\link{#1}{#2}}
\newcommand*{\sociallink}[3]{\textcolor{accentcolor}{#1}\enskip\link{#2}{#3}\quad}
\newcommand*{\socialtext}[2]{\textcolor{accentcolor}{#1}\enskip#2\quad}
\newcommand*{\position}[1]{\def\@position{#1}}
\newcommand*{\xemail}[1]{\sociallink{\emailSymbol}{mailto:#1}{#1}}
\newcommand*{\xphone}[1]{\sociallink{\phoneSymbol}{tel:#1}{#1}}
\newcommand*{\github}[1]{\sociallink{\githubSymbol}{https://github.com/#1}{#1}}
\newcommand*{\xwebpage}[1]{\sociallink{\webpageSymbol}{https://#1/}{#1}}
\newcommand*{\linkedin}[1]{\sociallink{\linkedinSymbol}{https://linkedin.com/in/#1}{#1}}
\newcommand*{\telegram}[1]{\sociallink{\telegramSymbol}{https://t.me/#1}{#1}}
\newcommand*{\leetcode}[1]{\sociallink{\leetcodeSymbol}{https://leetcode.com/#1}{#1}}
\newcommand*{\address}[1]{\socialtext{\locationSymbol}{#1}}
\newcommand*{\cvtitle}[1]{\color{accentcolor}\textbf{\Large{#1}}\color{black}}

\newcommand*{\socialemail}[1]{\def\@socialemail{#1}}
\newcommand*{\socialphone}[1]{\def\@socialphone{#1}}
\newcommand*{\socialaddress}[1]{\def\@socialaddress{#1}}
\newcommand*{\socialgithub}[1]{\def\@socialgithub{#1}}
\newcommand*{\socialwebpage}[1]{\def\@socialwebpage{#1}}
\newcommand*{\sociallinkedin}[1]{\def\@sociallinkedin{#1}}
\newcommand*{\socialtelegram}[1]{\def\@socialtelegram{#1}}
\newcommand*{\socialleetcode}[1]{\def\@socialleetcode{#1}}
\newcommand*{\socialpicture}[1]{\def\@socialpicture{#1}}

\newcommand*\twocolumnsection[2]{
  \begin{minipage}[t]{\dimexpr(0.65\linewidth) - 1.0em}#1\end{minipage}
  \hfill
  \begin{minipage}[t]{\dimexpr(0.35\linewidth) - 1.0em}#2\end{minipage}
}

\newcommand*{\cvheader}{
  \begin{minipage}[c][4.0cm][t]{0.69\linewidth}
    \user{\@firstname}{\@lastname} \vspace{0.7em} \\
    \cvtitle{\@position} \medskip \\
    \@socialaddress \medskip \\
    \@socialemail \smallskip \@socialphone \smallskip \\
    \@socialgithub \smallskip \@sociallinkedin \smallskip \@socialtelegram \smallskip \\
  \end{minipage}
  \begin{minipage}[c][4.0cm][t]{0.29\linewidth}
    \begin{flushright}
      \begin{tikzpicture}
        \clip (0,0) circle (1.8cm) node {\includegraphics[width=3.6cm]{pic/\@socialpicture}};
      \end{tikzpicture}
    \end{flushright}
  \end{minipage}
  \vspace{0.5em}
}

\newcommand*{\footer}[1]{
  \fancyfoot{}
  \fancyfoot[L]{\textsc{\small{\today}}}
  \fancyfoot[C]{\textsc{\small{#1}}}
  \fancyfoot[R]{\textsc{\small{\thepage/\pageref{LastPage}}}}
}

\newcommand\cvsection[2]{
  \section{\texorpdfstring{\color{accentcolor}#2\enspace\textsc{\textbf{#1}}}{#1}}
}

\newcommand\cquad{%
  \hspace{0.2em}
}
