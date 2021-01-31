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
%%%%%	            Changelog       	     %%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%	

% ToDo
% Cleanup code
% Make Font selection more streamline (with Package Options)

% v0.26
% Added salutation to add Dipl.-Phys. on title page but not in declaration of honesty

% v0.2 (Begin changes for dissertation)
% Replaced the commands \mentor, \eximiner and \coeximiner for \referee
% Put university logo on command \logo{}
% Disabled footnotereset on new chapter
% Provided \makefrontmatter command
% Provided \addchap* command to suppress page numbers
% Replaced helvet for avant as headline font

% v0.21
% Changed color system C1-C3 are colors G1-G2 are gray levels
% Made the subtitle G1

% v0.22
% Prevented footnotes to split up to multiple pages

% v0.25
% Rewrote headline code due to conflicts between titlesec and scrbook


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%	      Load Required Packages	     %%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%	

\RequirePackage[english, ngerman]{babel}

\RequirePackage[T1]{fontenc}
\RequirePackage[utf8]{inputenc}

\RequirePackage{JenLang}
\RequirePackage{JenColor}

\RequirePackage{xifthen}
\RequirePackage{lmodern}
\RequirePackage{xspace}
\RequirePackage[super]{nth}
\RequirePackage{remreset}
\RequirePackage{tabularx}
\RequirePackage{avant}
%\RequirePackage{helvet}
\RequirePackage[babel]{csquotes}
\RequirePackage[onehalfspacing]{setspace}

\RequirePackage[automark]{scrpage2}
%\RequirePackage{titlesec}
\RequirePackage{titletoc}

\RequirePackage{geometry}
\RequirePackage{hyperref}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%	 Fields for personal information	 %%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
	
	\newcommand{\salutation}[1]{\def \@salutation {#1\xspace}}	    \salutation{}
	\newcommand{\email}[1]{\def \@email {#1\xspace}}				\email{}
	\newcommand{\mobile}[1]{\def \@mobile {#1\xspace}}				\mobile{}
	\newcommand{\phone}[1]{\def \@phone {#1\xspace}}				\phone{}
	\newcommand{\dateofbirth}[1]{\def \@dateofbirth {#1\xspace}}	\dateofbirth{}
	\newcommand{\placeofbirth}[1]{\def \@placeofbirth {#1\xspace}}	\placeofbirth{}
	\newcommand{\address}[1]{\def \@address {#1\xspace}}			\address{}
	\newcommand{\zipcode}[1]{\def \@zipcode {#1\xspace}}			\zipcode{}
	\newcommand{\city}[1]{\def \@city {#1\xspace}}					\city{}
	\newcommand{\country}[1]{\def \@country {#1\xspace}}			\country{}
	\newcommand{\logo}[1]{\def \@logo{#1}}							\logo{}
	\newcommand{\university}[1]{\def \@university {#1\xspace}}		\university{}
	\newcommand{\faculty}[1]{\def \@faculty {#1\xspace}}			\faculty{}
	\newcommand{\institute}[1]{\def \@institute {#1\xspace}}		\institute{}
	\newcommand{\matrikelnum}[1]{\def \@matrikelnum {#1\xspace}}	\matrikelnum{}	
	\newcommand{\degree}[1]{\def \@degree {#1}}				\degree{}	
	\newcommand{\kind}[1]{\def \@kind {#1}}					\kind{}	
	\renewcommand{\dedication}[2][]{\def \@dedication {#2} \def \@dedicationAddon {#1}}	\dedication[]{}	
	\newcommand{\dayofdisputation}[1]{\def \@dayofdisputation {#1}}	\dayofdisputation{}
	\newcommand{\dayofsubmission}[1]{\def \@dayofsubmission {#1}}	\dayofsubmission{}
		
	\newcommand*\@referee{}
	\newcounter{numreferees}
	\newcommand*{\referee}[2][\stepcounter{numreferees}\eog{\parbox[t]{3.5ex}{\nth{\thenumreferees}} Referee}{\thenumreferees. Gutachter}]{\g@addto@macro{\@referee}{#1: &\quad #2\\}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%	             Options                 %%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% 1mm for proper book binding
% 10mm for glued binding
% according to my binding service

\DeclareOption{print}{\geometry{bindingoffset=1mm}}
\DeclareOption{english}{\AtBeginDocument{\selectlanguage{english}}}
\DeclareOption{german}{\AtBeginDocument{\selectlanguage{ngerman}}}

\newboolean{@chaptertoc}\setboolean{@chaptertoc}{false}
\DeclareOption{chaptertoc}{\setboolean{@chaptertoc}{true}}

\newboolean{@hidelinks}\setboolean{@hidelinks}{false}
\DeclareOption{hidelinks}{\setboolean{@hidelinks}{true}}

\ProcessOptions\relax

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%	        Prepared Color Sets	         %%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%	

\definecolor{C1}{HTML}{000000}
\definecolor{C2}{HTML}{000000}
\definecolor{C3}{HTML}{000000}
\definecolor{G1}{HTML}{808080}
\definecolor{G2}{HTML}{808080}
\definecolor{G3}{HTML}{808080}


\DeclareOption{parula}{
%\definecolor{C1}{HTML}{352A87}
\definecolor{C1}{HTML}{0B4A80}
\definecolor{C2}{HTML}{0F5CDD}
\definecolor{C3}{HTML}{127DD8}
\definecolor{G1}{HTML}{333333}
\definecolor{G2}{HTML}{555555}
\definecolor{G3}{HTML}{6D6D6D}
}


\DeclareOption{blue}{
\definecolor{C1}{HTML}{234469}
\definecolor{C2}{HTML}{4374AD}
\definecolor{C3}{HTML}{8AA8CA}
\definecolor{G1}{HTML}{787878}
\definecolor{G2}{HTML}{AAAAAA}
\definecolor{G3}{HTML}{DCDCDC}
}

\ProcessOptions\relax

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%     Provide New/Changed Commands       %%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand{\makefrontmatter}{%
	\maketitle%
	\setcounter{tocdepth}{1}%
	\singlespacing%
	\tableofcontents%
	\onehalfspacing%
	\thispagestyle{empty}%
	\setcounter{tocdepth}{2}}
	
	
	
\let\@oldaddchap\addchap
\renewcommand{\addchap}{\@ifstar\@addchapStar\@addchapNoStar}
\let\@addchapNoStar\@oldaddchap
\newcommand{\@addchapStar}[1]{%
\chapter*{#1}%
\addtocontents{toc}{\protect\contentsline{chapter} {#1}{}{}}}


\newcommand{\highlight}[1]{\textcolor{C1}{\changefont{pag}{m}{sc}#1}}




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%	          Basic Page Layout	         %%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%	

%\geometry{paper=a4paper,inner=25mm,outer=25mm,top=35mm,bottom=30mm,headheight=20mm,headsep=15mm, footnotesep=15mm,heightrounded}
\geometry{paper=a4paper,inner=30mm,outer=30mm,top=35mm,bottom=30mm,headheight=20mm,headsep=15mm, footnotesep=15mm,heightrounded}

\automark[section]{chapter}
\setkomafont{pageheadfoot}{\normalfont}

\clearscrheadfoot
\cfoot[-- \pagemark\ --]{-- \pagemark\ --}
\chead[]{\headmark}

%\setheadtopline{1.5pt}[]
\setheadsepline{1.0pt}[]
\setlength{\parskip}{1em}
\pagestyle{scrheadings}

% Remove footnote-reset from chapter command
\@removefromreset{footnote}{chapter}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%	        HyperRef Settings	         %%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%	

\hypersetup{
    unicode=true,          % non-Latin characters in Acrobat’s bookmarks
    pdftoolbar=true,        % show Acrobat’s toolbar?
    pdfmenubar=true,        % show Acrobat’s menu?
    pdfnewwindow=true,      % links in new window
    colorlinks=true,       % false: boxed links; true: colored links
    linkcolor=C1,          % color of internal links
    citecolor=C1,        % color of links to bibliography
    filecolor=C1,      % color of file links
    urlcolor=C1,          % color of external links
}

\if@hidelinks
\hypersetup{
    linkcolor={},          % color of internal links
    citecolor={},        % color of links to bibliography
    filecolor={},      % color of file links
    urlcolor={}           % color of external links
}
\fi

\AtBeginDocument{
\hypersetup{
    pdftitle={\@title},    % title
    pdfauthor={\@author},     % author
    pdfsubject={\@kind},   % subject of the document
}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%	     Design of the Titlepage	 	 %%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%	

\newcommand{\changefont}[3]{%
\fontfamily{#1}%
\fontseries{#2}% 
\fontshape{#3}% 
\selectfont}

\renewcommand*{\maketitle}[1][-2]{
		\begin{titlepage}
		
		\thispagestyle{empty}
		\centering
		
		%\newgeometry{left=25mm, right=25mm, top=25mm, bottom=25mm}
		
		\
		\vfill 
		
		\begin{Huge}
		\changefont{pag}{b}{sc}\@title\par
		\end{Huge}
		
		\vspace*{2em}		
		
		\begin{huge}
		\color{G1}\changefont{pag}{m}{sc}\@subtitle\par 
		\end{huge}
		
		\vspace{12em}

				
		\begin{Huge}		
		\ifthenelse{\equal{\@kind}{}}{}{$-$ \textsc{\@kind}\ $-$}
		\end{Huge}
		\ifthenelse{\equal{\@degree}{}}{}{\\ \eog{To achieve the academic degree of}{Zur Erlangung des akademischen Grades}\\ \textsl{\@degree}}
		\vspace*{2em}\\
		\includegraphics[width=0.33\textwidth]{\@logo}
		\vspace*{2em}\\
		\eog{Submitted by \@salutation\@author,\\ born on \@dateofbirth in \@placeofbirth}{Eingereicht von \@salutation\@author,\\ geboren am \@dateofbirth in \@placeofbirth}
		
		\vfill\vfill
		%\restoregeometry
		\end{titlepage}

		\cleardoublepage		
		
		\thispagestyle{empty}
		\vspace*{0.2\textheight}
		
		\begin{flushright}
		\begin{Large}
		\ifthenelse{\equal{\@dedication}{}}{}{\enquote{\textsl{\@dedication}}} \vspace{0.5em}
		\end{Large}		
		\ifthenelse{\equal{\@dedicationAddon}{}}{}{(\@dedicationAddon)\hspace{2ex}}		
		
		\vfill

				
		\begin{tabular}{ll}
		\@referee\\
		\ifthenelse{\equal{\@dayofsubmission}{}}{}{\eog{Day of Submission}{Tag der Abgabe}:&\quad \@dayofsubmission\\}
		\ifthenelse{\equal{\@dayofdisputation}{}}{}{\eog{Day of Disputation}{Tag der Disputation}:&\quad \@dayofdisputation}
		\end{tabular}
		\end{flushright}
				
		\cleardoublepage
		\pagestyle{scrheadings}

}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%	    	  TOC Properties	      	 %%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%	

%\titlecontents{hsectioni}[hlefti]
%{habove-codei}
%{hnumbered-entry-formati}
%{hnumberless-entry-formati}
%{hfiller-page-formati}
%[hbelow-codei]

\titlecontents{chapter}[1.9em]
{\large\changefont{pag}{b}{sc}\addvspace{1pc}}
{\contentslabel[\thecontentslabel.]{1.8em}}
{}
{\titlerule*[2ex]{}\thecontentspage}
[\addvspace{.4pc}]

\titlecontents{section}[2.2em+1.9em]
{\changefont{pag}{m}{sc}}
{\contentslabel{2.2em}}
{}
{\titlerule*[2ex]{.}\thecontentspage}

\titlecontents{subsection}[5.2em+1.9em]
{\small\changefont{pag}{m}{n}}
{\contentslabel{3.2em}}
{}
{\titlerule*[2ex]{.}\thecontentspage}

				
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%	  	    Heading Properties	 	   	 %%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%	

%\titleformat{ command }[ shape ]{ format }{ label }{ sep }{ before-code }[ after-code ]


\renewcommand{\thechapter}{\Roman{chapter}}
\RedeclareSectionCommand[beforeskip=0pt, afterskip=\baselineskip]{chapter}

\renewcommand\chapterlineswithprefixformat[3]{%
	#2\rule{\textwidth}{1pt}\par\nobreak%
	#3\vspace{-0.5\baselineskip}\par\nobreak\rule{\textwidth}{1pt}\\[2em]%
	\normalfont\normalsize\color{black}%
	\startcontents%
	\printcontents{l}{1}{\setlength{\parskip}{0em}}%
}


\renewcommand*{\raggedchapter}{\raggedleft}
\renewcommand*{\chapterformat}{%
	\chapappifchapterprefix{~\huge\thechapter}
	\vspace{-\baselineskip}
}%


\setkomafont{chapterprefix}{\Large}
\setkomafont{chapter}{\changefont{pag}{m}{sc}\color{C1}\huge}
\setkomafont{section}{\changefont{pag}{b}{sc}\color{C1}\Large}
\setkomafont{subsection}{\changefont{pag}{m}{sc}\color{C1}\large}
\setkomafont{subsubsection}{\changefont{pag}{m}{sc}\color{C1}}
\setkomafont{paragraph}{\changefont{pag}{m}{sc}\color{C1}\normalsize}





%\newcommand*{\partformat}{\partname~\thepart\autodot}
%\newcommand*{\chapterformat}{\mbox{\chapappifchapterprefix{\nobreakspace}\thechapter\autodot\IfUsePrefixLine{}{\enskip}}}
%\newcommand*{\sectionformat}{\thesection\autodot\enskip}
%\newcommand*{\othersectionlevelsformat}[3]{#3\autodot\enskip}

%\renewcommand*{\sectionformat}{\makebox[0pt][r]{\thesection\autodot\enskip}}
%\renewcommand*{\subsectionformat}{\makebox[0pt][r]{\thesubsection\autodot\enskip}}
%\renewcommand*{\subsubsectionformat}{\makebox[0pt][r]{\thesubsubsection\autodot\enskip}}
%\renewcommand*{\paragraphformat}{\makebox[0pt][r]{\theparagraph\autodot\enskip}}

%\renewcommand*{\chaptermarkformat}{\chapappifchapterprefix{\ }\thechapter\autodot\enskip}
%\renewcommand*{\sectionmarkformat}{\thesection\autodot\enskip}
%\renewcommand*{\subsectionmarkformat}{\thesubsection\autodot\enskip}
%\renewcommand*{\chaptermarkformat}{\chapapp~\thechapter\autodot\enskip}




%% OLD STUFF

%\RedeclareSectionCommand[beforeskip=30pt,afterskip=20pt]{chapter}
%\renewcommand*\chapterheadmidvskip{\par\nobreak\vspace{10pt}}

%\titleformat{\chapter}
%[display]
%{\vspace*{-15ex}\color{C1}\changefont{pag}{m}{sc}}
%{\filleft\MakeUppercase{\chaptertitlename}\, \Huge\thechapter}
%{4ex}
%{\titlerule\LARGE\vspace{1ex}\filright}
%[\vspace{2ex}\titlerule
%\if@chaptertoc
%\normalfont\normalsize\color{black}\vspace{4em}
%\startcontents
%\printcontents{l}{1}{\setlength{\parskip}{0em}}
%\fi]

%\titleformat{name=\chapter,numberless}[display]
%{\vspace*{-22ex}}{}{0ex}
%{\color{C1}\changefont{pag}{m}{sc}\titlerule\LARGE\vspace{1ex}\filright}
%[\vspace{2ex}\titlerule]

%\titleformat{\section}
%{\color{C1}\LARGE\changefont{pag}{b}{sc}}
%{\thesection}{4mm}{}

%\titlespacing*{\section}
%{0ex}{3.5ex plus .1ex minus .2ex}{1.5ex minus .1ex}

%\titleformat{\subsection}
%{\color{C1}\large\changefont{pag}{b}{sc}}
%{\thesubsection}{4mm}{}

%\titlespacing*{\subsection}
%{0ex}{3.5ex plus .1ex minus .2ex}{1.5ex minus .1ex}

%\titleformat{\subsubsection}
%{\color{C1}\large\changefont{pag}{b}{sc}}
%{}{0.65em}{}

%\titlespacing*{\subsubsection}
%{0ex}{3.5ex plus .1ex minus .2ex}{0ex minus .1ex}

% \titlespacing*{ command }{ left }{ before-sep }{ after-sep }[ right-sep ]
%\titleformat{\paragraph}[runin]{\color{C1}\changefont{pag}{b}{n}}{}{}{}[]
%\titlespacing*{\paragraph}{0ex}{0ex}{2ex}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%	  	     Listing Symbols	 	   	 %%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%	

\renewcommand{\labelitemi}{$-$}
\renewcommand{\labelitemii}{\,\begin{picture}(1,1)(0,-3)\circle*{3}\end{picture}}
\renewcommand{\labelitemiii}{\,\begin{picture}(1,1)(0,-3)\circle{3}\end{picture}}
\renewcommand{\labelitemiv}{\,\begin{picture}(1,1)(0,-3)\circle{3}\end{picture}\hspace*{-0.18ex}\begin{picture}(1,1)(0,-3)\circle*{1.25}\end{picture}}


\let\olditemize\itemize
\def\itemize{
\olditemize
\vspace*{-1ex}
\setlength{\itemsep}{-1ex}
\setlength{\parsep}{1ex}
}
\let\oldenumerate\enumerate
\def\enumerate{
\oldenumerate
\vspace*{-1ex}
\setlength{\itemsep}{-1ex}
\setlength{\parsep}{1ex}
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%% Declaration of Academic Honesty / Selbstständigkeitserklärung %%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcolumntype{L}[1]{>{\raggedright\arraybackslash}p{#1}}
\newcommand{\declarationheadline}{\texorpdfstring{\eog{Declaration of Academic Honesty}{Eidesstattliche Erklärung}}{}}
\newcommand{\declarationtext}{\vspace*{10ex}\eog{
I, \@author, hereby declare on my honor, that I independently composed the instant thesis, without undue assistance from third parties and without using other than the indicated literature. From other sources directly or indirectly acquired data and concepts are highlighted by stating the source.

Nobody received monetary benefits for work performed in connection with this \MakeLowercase{\@kind}. The work has not been presented yet, neither at home nor abroad in the same or similar way to any other examining authority.

To the best of my knowledge and belief I hereby affirm that I said the truth and concealed nothing.
}{
Hiermit versichere ich, \@author, an Eides statt, dass ich die vorliegende Arbeit selbstständig, ohne unzulässige Hilfe Dritter und ohne Benutzung anderer als der angegebenen Literatur angefertigt habe. Die aus anderen Quellen direkt oder indirekt übernommenen Daten und Konzepte sind unter Angabe der Quelle gekennzeichnet.

Niemand hat von mir unmittelbar oder mittelbar geldwerte Leistungen für Arbeiten erhalten, die im Zusammenhang mit dem Inhalt dieser \@kind stehen. Die Arbeit wurde bisher weder im In- noch Ausland in gleicher oder ähnlicher Form einer anderen Prüfungsbehörde vorgelegt. 

Ich versichere, dass ich nach bestem Wissen die reine Wahrheit gesagt und nichts verschwiegen habe.}
}

\newcommand{\declaration}{\@ifstar\@declarationStar{\@declarationNoStar}}

\newcommand{\@declarationNoStar}[1][]{
\clearpage
\addchap{\declarationheadline}
\thispagestyle{empty}
\declarationtext
\ifthenelse{\isempty{#1}}{\vspace*{7em}}{\vspace*{5em}}
\begin{center}
\begin{tabular}{L{4cm}p{0.28\textwidth}L{3.5cm}}
 \ifthenelse{\isempty{#1}}{}{\@city, \today} &&	\ifthenelse{\isempty{#1}}{}{\hspace*{0.25cm}\includegraphics[width=3cm]{#1}}	\\\cline{1-1}\cline{3-3}
 \eog{Place, Date}{Ort, Datum}     && \eog{Signature}{Unterschrift}
\end{tabular}
\end{center}
}

\newcommand{\@declarationStar}[1][]{
\clearpage
\chapter*{\declarationheadline}
\thispagestyle{empty}
\declarationtext
\ifthenelse{\isempty{#1}}{\vspace*{7em}}{\vspace*{5em}}
\begin{center}
\begin{tabular}{L{4cm}p{0.28\textwidth}L{3.5cm}}
 \ifthenelse{\isempty{#1}}{}{\@city, \today} &&	\ifthenelse{\isempty{#1}}{}{\hspace*{0.25cm}\includegraphics[width=3cm]{#1}}	\\\cline{1-1}\cline{3-3}
 \eog{Place, Date}{Ort, Datum}     && \eog{Signature}{Unterschrift}
\end{tabular}
\end{center}
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%     Other, minor things     %%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Prevent footnotes to split up to multiple pages
\interfootnotelinepenalty=\@M

