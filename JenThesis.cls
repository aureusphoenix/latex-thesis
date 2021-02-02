\ProvidesClass{JenThesis}[2021/02/02 v0.1]
\PassOptionsToClass{\CurrentOption}{scrbook}
\LoadClass[chapterprefix]{scrbook}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%	      Load Required Packages	     %%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%	

	\RequirePackage[english]{babel}
	\RequirePackage[T1]{fontenc}
	\RequirePackage[utf8]{inputenc}
	\RequirePackage{lmodern}
	\RequirePackage{csquotes}
	\RequirePackage{xspace}
	\RequirePackage[onehalfspacing]{setspace}
	\RequirePackage{xifthen}
	\RequirePackage{graphicx}
	\RequirePackage{geometry}
	\RequirePackage[headsepline]{scrlayer-scrpage}
	\RequirePackage{hyperref}
	\RequirePackage{xcolor}
	\RequirePackage[super]{nth}
	\RequirePackage{avant}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%	      Input field definitions        %%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	
	\newcommand*{\salutation}[1]{\def\@salutation{#1\xspace}}	    \salutation{}
	\newcommand*{\email}[1]{\def\@email{#1\xspace}}					\email{}
	\newcommand*{\dateofbirth}[1]{\def\@dateofbirth{#1\xspace}}		\dateofbirth{}
	\newcommand*{\placeofbirth}[1]{\def\@placeofbirth{#1\xspace}}	\placeofbirth{}
	\newcommand*{\logo}[1]{\def\@logo{#1}}							\logo{}
	\newcommand*{\degree}[1]{\def\@degree{#1}}						\degree{}	
	\newcommand*{\kind}[1]{\def\@kind{#1}}							\kind{}	
	\newcommand*{\dayofdisputation}[1]{\def\@dayofdisputation{#1}}	\dayofdisputation{}
	\newcommand*{\dayofsubmission}[1]{\def\@dayofsubmission{#1}}	\dayofsubmission{}
	
	\renewcommand*{\dedication}[2][]{\def\@dedication{#2}\def\@dedicationAddon{#1}} 
	\dedication[]{}	
	
		
	\newcommand*\@referee{}
	\newcounter{numreferees}
	\newcommand*{\referee}[2][%
		{\stepcounter{numreferees}\parbox[t]{3.5ex}{\nth{\thenumreferees}}Referee}%
	]{%
		\g@addto@macro{\@referee}{#1: &\quad \parbox[t]{6cm}{#2}\\\null\\}%
	}
	
	
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%	      Process package options        %%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%	
	
	\DeclareOption{print}{\geometry{bindingoffset=10mm}}
	
	\newboolean{@chaptertoc}\setboolean{@chaptertoc}{false}
	\DeclareOption{chaptertoc}{\setboolean{@chaptertoc}{true}}
	
	\newboolean{@hidelinks}\setboolean{@hidelinks}{false}
	\DeclareOption{hidelinks}{\setboolean{@hidelinks}{true}}
	
	% Add language specific definitions here or find a way to figure out the user set language
%	\DeclareOption{english}{\AtBeginDocument{\selectlanguage{english}}}
%	\DeclareOption{german}{\AtBeginDocument{\selectlanguage{ngerman}}}
%	\DeclareOption{french}{\AtBeginDocument{\selectlanguage{french}}}
%	\DeclareOption{italian}{\AtBeginDocument{\selectlanguage{italian}}}
	
	\ProcessOptions\relax

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%	         Define page layout          %%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%		
	
	\geometry{%
		paper=a4paper,
		inner=30mm,
		outer=30mm,
		top=35mm,
		bottom=30mm,
		headheight=20mm,
		headsep=15mm, 
		footnotesep=15mm,
		heightrounded
	}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%	             Color setup             %%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%	

	\definecolor{C1}{HTML}{0B4A80}
	\definecolor{C2}{HTML}{0F5CDD}
	\definecolor{C3}{HTML}{127DD8}
	\definecolor{G1}{HTML}{333333}
	\definecolor{G2}{HTML}{555555}
	\definecolor{G3}{HTML}{6D6D6D}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%	          Headline formats           %%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%	

	\renewcommand{\thechapter}{\Roman{chapter}}
	\renewcommand*{\raggedchapter}{\raggedleft}
	\renewcommand*{\chapterformat}{%
		\chapappifchapterprefix{~\huge\thechapter}
		\vspace{-\baselineskip}
	}%

	\RedeclareSectionCommand[beforeskip=0pt, afterskip=\baselineskip]{chapter}

	\setkomafont{chapterprefix}{\Large}
	\setkomafont{chapter}{\scshape\sffamily\fontseries{l}\selectfont\color{C1}\huge}
	\setkomafont{section}{\scshape\sffamily\bfseries\color{C1}\Large}
	\setkomafont{subsection}{\scshape\sffamily\color{C1}\large}
	\setkomafont{subsubsection}{\scshape\sffamily\color{C1}}
	\setkomafont{paragraph}{\scshape\sffamily\color{C1}\normalsize}
	
	
	\renewcommand{\chapterlineswithprefixformat}[3]{%
		#2\rule{\textwidth}{1pt}\par\nobreak%
		#3\vspace{-0.5\baselineskip}\par\nobreak\rule{\textwidth}{1pt}\\[2em]%
		\normalfont\normalsize\color{black}%
		%\startcontents%
		%\printcontents{l}{1}{\setlength{\parskip}{0em}}%
	}
	
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%	        HyperRef Settings	         %%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%	

	\hypersetup{
		unicode=true,		% non-Latin characters in Acrobat’s bookmarks
		pdftoolbar=true,	% show Acrobat’s toolbar?
		pdfmenubar=true,	% show Acrobat’s menu?
		pdfnewwindow=true,	% links in new window
		colorlinks=true,	% false: boxed links; true: colored links
		linkcolor=C1,		% color of internal links
		citecolor=C1,		% color of links to bibliography
		filecolor=C1,		% color of file links
		urlcolor=C1,		% color of external links
	}
	
	\if@hidelinks
	\hypersetup{
		linkcolor={},		% color of internal links
		citecolor={},		% color of links to bibliography
		filecolor={},		% color of file links
		urlcolor={}			% color of external links
	}
	\fi
	
	\AtBeginDocument{
		\hypersetup{
			pdftitle={\@title},    % title
			pdfauthor={\@author},  % author
			pdfsubject={\@kind},   % subject of the document
	}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%         New length definitions       	 %%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%	

	\newlength{\prelogoskip}	\setlength{\prelogoskip}{1em}
	\newlength{\postlogoskip}	\setlength{\postlogoskip}{1em}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%             Font Settings         	 %%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%	

	\renewcommand{\textsf}[2][m]{{\sffamily\fontseries{#1}\selectfont#2}}
	\setlength{\parskip}{1em}
	
	\automark[section]{chapter}
	\clearpairofpagestyles
	\cfoot[-- \pagemark\ --]{-- \pagemark\ --}
	\chead[]{\headmark}
	\setkomafont{pageheadfoot}{\normalfont}
	
	
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%     Frontmatter and Title commands     %%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%		

	\newcommand{\autofrontmatter}{%
		\maketitle%
		\setcounter{tocdepth}{1}%
		\singlespacing%
		\tableofcontents%
		\onehalfspacing%
		\thispagestyle{empty}%
		\setcounter{tocdepth}{2}%
	}	

	\renewcommand{\maketitle}[1][-2]{%
		\begin{titlepage}
			\centering
			\null\vfill
			\Huge\textsc{\textsf[b]{\@title}}\par
			\vspace*{1em}		
			\huge\ifthenelse{\equal{\@subtitle}{}}{}{\textsc{\textsf[m]{\@subtitle}}}\par
			\vfill\vfill\vfill\vfill
			\Huge\ifthenelse{\equal{\@kind}{}}{}{$-$~\textsc{\@kind}~$-$}\par
			\normalsize
			\ifthenelse{\equal{\@degree}{}}{}{To achieve the academic degree of\\ \textsl{\@degree}}\par
			\vspace*{\prelogoskip}
			\includegraphics[width=0.33\textwidth]{\@logo}\par
			\vspace*{\postlogoskip}
			Submitted by \@salutation\@author,\\ born on \@dateofbirth in \@placeofbirth
			\vfill\vfill
		\end{titlepage}
		\cleardoublepage		
		\thispagestyle{empty}
		\begin{flushright}
			\null\vfill
			\Large\ifthenelse{\equal{\@dedication}{}}{}{\enquote{\textsl{\@dedication}}}
			\vspace{0.5em}
			\normalsize\ifthenelse{\equal{\@dedicationAddon}{}}{}{(\@dedicationAddon)\hspace{1ex}}					
			\vfill\vfill
			\begin{tabular}{ll}
				\@referee
				\ifthenelse{\equal{\@dayofsubmission}{}}{}{Day of Submission:&\quad 	\@dayofsubmission\\}
				\ifthenelse{\equal{\@dayofdisputation}{}}{}{Day of Disputation:&\quad 	\@dayofdisputation}
			\end{tabular}
			\vfil
		\end{flushright}		
		\cleardoublepage
		\pagestyle{scrheadings}
	}



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%	        Footnote properties          %%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%	

	% Remove footnote-reset from chapter command
	\@removefromreset{footnote}{chapter}

	% Prevent footnotes to split up to multiple pages
	\interfootnotelinepenalty=\@M
	
