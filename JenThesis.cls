%% JenThesis.cls
%% Copyright by Christian Vetter from university Jena (Germany)
%
% This class is designed for any kind of thesis, e.g. diploma-, bachelor- or master thesis and should make it easier for you to create a realy cool design.
% It is absolutely permitted (and desired) to modify and share this class.
%
% For fair comments and proposals you can reach me by mail. To provide spam, the mail address is encrypted by ROT13-algorithm. Use google to find an decryption-tool.
% Puevfgvna.Irggre@hav-wran.qr

\ProvidesClass{JenThesis}[2017/04/09 v0.26]
\LoadClassWithOptions{scrbook}


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
	\RequirePackage{scrlayer-scrpage}
	\RequirePackage{hyperref}
	\RequirePackage{xcolor}
	\RequirePackage[super]{nth}
	\RequirePackage{avant}
	
	\newcommand{\eog}[2]{#1}


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
	\newcommand*{\dayofsubmission}[1]{\def\@dayofsubmission{#1}}		\dayofsubmission{}
	
	\renewcommand*{\dedication}[2][]{\def\@dedication{#2}\def\@dedicationAddon{#1}} 
	\dedication[]{}	
	
		
	\newcommand*\@referee{}
	\newcounter{numreferees}
	\newcommand*{\referee}[2][\stepcounter{numreferees}\eog{\parbox[t]{3.5ex}{\nth{\thenumreferees}} Referee}{\thenumreferees. Gutachter}]{\g@addto@macro{\@referee}{#1: &\quad #2\\}}
	
	
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%	      Process package options        %%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%	
	
	\DeclareOption{print}{\geometry{bindingoffset=1mm}}
	
	% Add language specific definitions here or find a way to figure out the user set language
%	\DeclareOption{english}{\AtBeginDocument{\selectlanguage{english}}}
%	\DeclareOption{german}{\AtBeginDocument{\selectlanguage{ngerman}}}
%	\DeclareOption{french}{\AtBeginDocument{\selectlanguage{french}}}
%	\DeclareOption{italian}{\AtBeginDocument{\selectlanguage{italian}}}
	
	\ProcessOptions\relax

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%	       Define package layout         %%%%%
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
%%%%%         New length definitions       	 %%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%	

	\newlength{\prelogoskip}	\setlength{\prelogoskip}{1em}
	\newlength{\postlogoskip}	\setlength{\postlogoskip}{1em}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%             Font Settings         	 %%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%	

	\renewcommand{\textsf}[2][m]{{\sffamily\fontseries{#1}\selectfont#2}}
	\setlength{\parskip}{1em}
	
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
				\@referee\\[1em]
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
	
