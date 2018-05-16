\NeedsTeXFormat{LaTeX2e}
\RequirePackage[T1]{fontenc}
\RequirePackage[utf8]{inputenc}

%default options

%spacing - default double
\newif\ifd@uble \d@ublefalse
\newif\ifs@ngle \s@ngletrue

%page numbering - default 
\newif\ifpn@top \pn@topfalse
\newif\ifpn@topr \pn@toprtrue

%chapter numbering (roman/arabic)
\newif\if@rmnchp \@rmnchptrue

%table stuff
\newif\ifmy@t@ble \my@t@blefalse
\newif\ifmy@figur@ \my@figur@false
\newif\ifmy@t@ble \my@t@blefalse

%font size
\newif\if@tenpt \@tenpttrue
\newif\if@elevenpt \@elevenptfalse
\newif\if@twelvept \@twelveptfalse

% seems we need it.
\newif\if@twoside \@twosidetrue 
\@mparswitchtrue \def\ds@draft{\overfullrule 5pt}

\newif\ift@rkish \t@rkishfalse

%Font Options
\DeclareOption{10pt}{\@tenpttrue \@elevenptfalse \@twelveptfalse}
\DeclareOption{11pt}{\@tenptfalse \@elevenpttrue \@twelveptfalse}
\DeclareOption{12pt}{\@tenptfalse \@elevenptfalse \@twelvepttrue}

%Page Numbering
\DeclareOption{pntr}{\pn@toptrue \pn@toprtrue}
\DeclareOption{pntc}{\pn@toptrue \pn@toprfalse}
\DeclareOption{pnbt}{\pn@topfalse \pn@toprfalse}

%Chapter Numbering
\DeclareOption{chaproman}{\@rmnchptrue}
\DeclareOption{chaparabic}{\@rmnchpfalse}

%Spacing
\DeclareOption{double}{\d@ubletrue \s@nglefalse}
\DeclareOption{oneandhalf}{\d@ublefalse \s@nglefalse}
\DeclareOption{single}{\d@ublefalse \s@ngletrue}

%print style
\DeclareOption{twoside}{\@twosidetrue}
\DeclareOption{oneside}{\@twosidefalse}

%Language
\DeclareOption{tr}{\t@rkishtrue}
\DeclareOption{eng}{\t@rkishfalse}

\def\@deptie{Industrial Engineering} \def\@tdeptie{Endüstri Mühendisliği}
\def\@deptmath{Mathematics} \def\@tdeptmath{Matematik}
\def\@deptlfm{Logistics and Finance Management} \def\@tdeptlfm{Lojistik ve Finansman Yönetimi}
\def\@deptceng{Computer Engineering} \def\@tdeptceng{Bilgisayar Mühendisliği}
\def\DeclareDepartment#1{
	\def\@department{\csname @dept#1\endcsname}
	\def\@tdepartment{\csname @tdept#1\endcsname}
}
\DeclareOption{ceng}{\DeclareDepartment{ceng}}
\DeclareOption{ie}{\DeclareDepartment{ie}}
\DeclareOption{math}{\DeclareDepartment{math}}
\DeclareOption{lfm}{\DeclareDepartment{lfm}}

% Phd or MS
\newif\ifm@s \m@sfalse
\DeclareOption{ms}{\m@strue}
\DeclareOption{phd}{\m@sfalse}

%Unspecified input handler
\DeclareOption*{Invalid Option \CurrentOption }

\ProcessOptions\relax
%\LoadClass{book}

\newif\ifturkish
\ift@rkish
\RequirePackage[english,turkish,french]{babel}
\turkishtrue 
\else
\RequirePackage[turkish,english,french]{babel}
\turkishfalse
\fi

\addto\extrasturkish{%
  \uccode`i=\string"9D \uccode\string"19 = `I
  \lccode\string"9D=`i \lccode`I=\string"19 }
\addto\noextrasturkish{%
  \uccode`i=`I \lccode`I=`i }
\ift@rkish
%%% TURKISH Text Templates

\def\@tocl{İÇİNDEKİLER}
\def\@lot{TABLOLAR LİSTESİ}
\def\@lof{ŞEKİLLER LİSTESİ}
\def\@loab{KISALTMALAR LİSTESİ}
\def\@chapterslabel{BÖLÜMLER}
\def\@figureslabel{ŞEKİLLER}
\def\@tableslabel{TABLOLAR}
\def\@tablelabel{Tablo}
\def\@titleparta{GALATASARAY ÜNİVERSİTESİ\\
       \MakeUppercase{\expandafter{\@tgraduateschool}}\\
	\MakeUppercase{\@tdegree} TEZİ}
\def\@titlepartb{\MakeUppercase{\@tdepartment}\\
	ANA BİLİM DALI}
\def\@approvallabel{Tezin Onayı:}
\def\@approvaltext{{\bf \MakeUppercase{\@author}} tarafından, {\bf Galatasaray Üniversitesi, \@tdepartment} ana bilim dalında {\bf \@tdegree} derecesinin gerekliliklerini kısmen yerine getirmek için teslim edilmiştir,}
\def\@directoraff{Enstitü Müdürü, {\bf Fen Bilimleri Enstitüsü}}
\def\@chairlabel{Bölüm Başkanı}
\def\@supervisorlabel{Tez Yöneticisi}
\def\@cosupervisorlabel{Ortak Tez Yöneticisi}
\def\@committeelabel{Juri Üyeleri}
\def\@datelabel{Tarih}
\def\@chapapp{\vskip4mm BÖLÜM}

\else
%%% ENGLISH Text Templates
\def\@tocl{TABLE OF CONTENTS}
\def\@lot{LIST OF TABLES}
\def\@lof{LIST OF FIGURES}
\def\@loab{LIST OF ABBREVIATIONS}
\def\@chapterslabel{CHAPTERS}
\def\@figureslabel{FIGURES}
\def\@tableslabel{TABLES}
\def\@tablelabel{Table }
\def\@titleparta{\textbf{Thesis}\\ \vskip 1cm
Submitted in Partial Fulfillment \vskip 0.5cm
       of the Requirements\vskip 0.5cm for the Degree of
       }
\def\@titlepartb{\textbf{\uppercase\expandafter{\@degree}}
	\vskip 0.4cm
	in
	\vskip 0.4cm
	\textbf{\MakeUppercase{\@department}}
	\vskip 0.4cm
	in the
	\vskip 0.4cm
	\textbf{INSTITUTE OF SCIENCE AND ENGINEERING} 
	\vskip 0.4cm
	of
	\vskip 0.4cm
	\textbf{GALATASARAY UNIVERSITY} 
	\vskip 1.1cm       
         }
\def\@approvallabel{Approval of the thesis:}
\def\@approvaltext{submitted by {\bf \MakeUppercase{\@author}} in partial fulfillment of the
requirements for the degree of {\bf \@degree~ in \@department~ Department, Galatasaray University} by,}
\def\@directoraff{Dean, Graduate School of {\bf Natural and Applied Sciences}}
\def\@chairlabel{Head of Department}
\def\@supervisorlabel{Supervisor}
\def\@cosupervisorlabel{Co-supervisor}
\def\@committeelabel{Examining Committee Members}
\def\@datelabel{Date}
\def\@chapapp{ }
\fi

% Font naming
\DeclareOldFontCommand{\rm}{\normalfont\rmfamily}{\mathrm}
\DeclareOldFontCommand{\sf}{\normalfont\sffamily}{\mathsf}
\DeclareOldFontCommand{\tt}{\normalfont\ttfamily}{\mathtt}
\DeclareOldFontCommand{\bf}{\normalfont\bfseries}{\mathbf}
\DeclareOldFontCommand{\it}{\normalfont\itshape}{\mathit}
\DeclareOldFontCommand{\sl}{\normalfont\slshape}{\@nomath\sl}
\DeclareOldFontCommand{\sc}{\normalfont\scshape}{\@nomath\sc}
\DeclareRobustCommand*\cal{\@fontswitch\relax\mathcal}
\DeclareRobustCommand*\mit{\@fontswitch\relax\mathnormal}

%input the appropriate .def file
\if@tenpt \input{gsu10.def} \fi
\if@elevenpt \input{gsu11.def} \fi
\if@twelvept \input{gsu12.def} \fi

\newif\if@lg@rithmloaded \@lg@rithmloadedfalse
\AtBeginDocument{
\@ifpackageloaded{algorithm2e}{\@lg@rithmloadedtrue}{\@lg@rithmloadedfalse}
}

%\ifpn@top\footheight=0cm\footskip=0cm%
%\else\footheight=12pt\footskip=30pt\headsep=0cm\headheight=0cm\fi

\ifpn@top
    \footskip=0cm%
\else
    \footskip=4.6cm\headsep=0cm\headheight=0cm
\fi

%\def\expthr@@#1{%
%   \expandafter\expandafter\expandafter%
%   \uplowcase\expandafter{#1}}
%\def\expthr@@#1{ \expandafter\expandafter\expandafter\uplowcase{#1}}
\def\expthr@@#1{#1}

\newtoks\@tmp

\def\uplowcase#1{\textsc{#1}}

\newtoks\@last \newtoks\@name

\def\i@uthor#1 #2.mend{\def\paramtw@{#2}\ifx\paramtw@\empty\@last={#1}%
\else\ifx\t@r\empty\@name={#1}\def\t@r{t@r}\else%
\@name=\expandafter{\the\@name{} #1}\fi\i@uthor#2.mend\fi}
\def\inv@uthor#1{\def\t@r{}\@name={}\@last={}\i@uthor#1 .mend%
\expthr@@{\the\@last}, \expthr@@{\the\@name}}

\newcommand{\singlespacing}{\renewcommand{\baselinestretch}{1}%
\let\@tmpcurrentsize=\currentsize \footnotesize \@tmpcurrentsize}
\newcommand{\doublespacing}{\renewcommand{\baselinestretch}{2}
\let\@tmpcurrentsize=\currentsize \footnotesize \@tmpcurrentsize}
\newcommand{\oneandhalfspacing}{\renewcommand{\baselinestretch}{1.5}
\let\@tmpcurrentsize=\currentsize \footnotesize \@tmpcurrentsize}
\def\@prelimsize{\@setsize\@prelimsize{14pt}\xiipt\@xiipt
\let\currentsize=\@prelimsize}

\let\f@@tnote\footnote
\def\footnote#1{\f@@tnote{\singlespacing #1}}

\def\labelenumi{\arabic{enumi}.}
\def\theenumi{\arabic{enumi}}
\def\labelenumii{(\alph{enumii})}
\def\theenumii{\alph{enumii}}
\def\p@enumii{\theenumi}
\def\labelenumiii{\roman{enumiii}.}
\def\theenumiii{\roman{enumiii}}
\def\p@enumiii{\theenumi(\theenumii)}
\def\labelenumiv{\Alph{enumiv}.}
\def\theenumiv{\Alph{enumiv}}
\def\p@enumiv{\p@enumiii\theenumiii}

\def\labelitemi{$\bullet$}
\def\labelitemii{\bf --}
\def\labelitemiii{$\ast$}
\def\labelitemiv{$\cdot$}

\def\verse{\let\\=\@centercr
 \list{}{\itemsep\z@ \itemindent -1.5em\listparindent \itemindent
 \rightmargin\leftmargin\advance\leftmargin 1.5em}\item[]}
\let\endverse\endlist
\def\quotation{\list{}{\listparindent 1.5em
 \itemindent\listparindent
 \rightmargin\leftmargin\parsep 0pt plus 1pt}\item[]}
\let\endquotation=\endlist
\def\quote{\par \singlespacing \list{}{\rightmargin\leftmargin}\item[]}
\let\endquote=\endlist

\def\descriptionlabel#1{\hspace\labelsep \bf #1}
\def\description{\list{}{\labelwidth\z@ \itemindent-\leftmargin
 \let\makelabel\descriptionlabel}}
\let\enddescription\endlist
\newdimen\descriptionmargin
\descriptionmargin=3em

\def\titlepage{\@restonecolfalse\if@twocolumn\@restonecoltrue\onecolumn
 \else \newpage \fi \@prelimsize \pagestyle{empty}}
\def\endtitlepage{\if@restonecol\twocolumn \else \newpage \fi
\pagestyle{plain}\normalsize}

\def\approvalpage{\@restonecolfalse\if@twocolumn\@restonecoltrue\onecolumn
 \else \newpage \fi \@prelimsize \pagestyle{empty}}
\def\endapprovalpage{\if@restonecol\twocolumn \else \newpage \fi
\pagestyle{plain}\normalsize}

\arraycolsep 5pt \tabcolsep 6pt \arrayrulewidth .4pt \doublerulesep 2pt
\tabbingsep \labelsep
\skip\@mpfootins = \skip\footins
\fboxsep = 3pt \fboxrule = .4pt

\newcounter {part}
\newcounter {chapter}
\newcounter {section}[chapter]
\newcounter {subsection}[section]
\newcounter {subsubsection}[subsection]
\newcounter {paragraph}[subsubsection]
\newcounter {subparagraph}[paragraph]

\def\thepart {\Roman{part}}
\if@rmnchp \def\thechapter{\Roman{chapter}}
  \else \def\thechapter{\vspace*{10pt} \arabic{chapter}} \fi
\def\thesection {\thechapter.\arabic{section}}
\def\thesubsection {\thesection.\arabic{subsection}}
\def\thesubsubsection {\thesubsection .\arabic{subsubsection}}
\def\theparagraph {\thesubsubsection.\arabic{paragraph}}
\def\thesubparagraph {\theparagraph.\arabic{subparagraph}}
\def\@chapappendix{APPENDIX}

\def\@pnumwidth{1.55em}
\def\@tocrmarg {2.55em}
\def\@dotsep{4.5}
\setcounter{tocdepth}{6}
\def\tableofcontents{
\thispagestyle{empty}
\singlespacing
\prechapter*{\vskip1.5mm \begin{flushleft}
 \@tocl
\end{flushleft}   \@mkboth{CONTENTS}{CONTENTS}}
\addcontentsline{toc}{leads}{\protect\numberline {}\@tocl}
\ift@rkish
\selectlanguage{turkish}
\fi
 \@starttoc{toc}\if@restonecol\twocolumn\fi\newpage }

\def\l@part#1#2{\addpenalty{-\@highpenalty}
 \addvspace{1.25em plus 1pt} \begingroup
 \@tempdima 3em \parindent \z@ \rightskip \@pnumwidth \parfillskip
-\@pnumwidth
 {\large \bf \leavevmode #1\hfil \hbox to\@pnumwidth{\hss #2}}\par
 \nobreak \endgroup}
\def\l@leads{\@dottedtocline{1}{0em}{0em}}
\def\l@nodots#1#2{\pagebreak[3]\noindent #1\par
  \vskip 0.5em}
\def\l@chapter{\pagebreak[3]
  \@dottedtocline{1}{0.0em}{1.5em}}
\def\l@section{\@dottedtocline{1}{3.8em}{3.5em}}
\def\l@subsection{\@dottedtocline{2}{7.3em}{4.1em}}
\def\l@subsubsection{\@dottedtocline{3}{11.4em}{5em}}
\def\l@paragraph{\@dottedtocline{4}{16.4em}{5em}}
\def\l@subparagraph{\@dottedtocline{5}{21.4em}{6em}}

% \def\appendices{\oneandhalfspacing
% \@restonecolfalse\if@twocolumn\@restonecoltrue\onecolumn
%  \fi\chapter*{APPENDICES\@mkboth {APPENDICES}{APPENDICES}}
% \addcontentsline{toc}{nodots}{\protect\numberline {}APPENDICES}
%     \setcounter{chapter}{0}\setcounter{section}{0}\setcounter{subsection}{0}
%     \renewcommand{\@chapapp}{\appendixname}
%     \def\thechapter{\Alph{chapter}}
% }
\def\appendix{\selectlanguage{English} \cleardoublepage \par
 \setcounter{chapter}{0}
 \setcounter{section}{0}
 \setlength{\topmargin}{0.5cm}
 	\selectlanguage{English}
 \def\@chapapp{APPENDIX}
 \addcontentsline{toc}{leads}{\protect\numberline {}APPENDICES}
 \def\thechapter{   \MakeUppercase \appendixname \hskip 12pt \Alph{chapter}}}
 

\def\listoffigures{\pagestyle{empty} \oneandhalfspacing
\@restonecolfalse\if@twocolumn\@restonecoltrue\onecolumn
 \fi\prechapter*{\vskip-1mm \begin{flushleft}
\@lof 
\end{flushleft}  \@mkboth
 {\@lof}{\@lof}}
\addcontentsline{toc}{leads}{\protect\numberline\MakeUppercase {}LIST OF FIGURES}
\@starttoc{lof}\if@restonecol
 \twocolumn\fi\newpage }
\def\l@figure{\@myfiguredottedtocline{1}{0em}{2.0em}}

\def\listoftables{\thispagestyle{empty} \oneandhalfspacing
\@restonecolfalse\if@twocolumn\@restonecoltrue\onecolumn
 \fi\prechapter*{\vskip-1mm \begin{flushleft}
 \@lot
 \end{flushleft}\@mkboth
 {\@lot}{\@lot}}
\addcontentsline{toc}{leads}{\protect\numberline\MakeUppercase {}LIST OF TABLES}
\@starttoc{lot}\if@restonecol
 \twocolumn\fi\newpage }
\def\l@table{\@mytabledottedtocline{1}{0em}{2.0em}}

\def\theglossary#1{\def\he@dgl@{\singlespacing
\@restonecoltrue \if@twocolumn\@restonecolfalse
 \fi\columnseprule \z@ \columnsep 35pt
 \prechapter*{\vskip 3.5mm \begin{flushleft}
 \expandafter{\@symb@l} \end{flushleft}
\@mkboth{{\@symb@l}}{{\@symb@l}}}%
\parindent \z@ \parskip \z@ plus .3pt\relax }%
 \def\symb@l[##1]{\def\@symb@l{##1}\he@dgl@}%
\@ifnextchar[{\symb@l}{\symb@l[\@loab]}%
\addcontentsline{toc}{leads}{\protect\numberline\MakeUppercase {}\@loab}
\begin{list}{}{\settowidth\labelwidth{[#1]}\leftmargin\labelwidth %labelsep 0.1cm
 \advance\leftmargin\labelsep \itemsep \z@}\def\makelabel##1{##1 \hfil}}%
\def\endtheglossary{\end{list}\if@restonecol\onecolumn\else\clearpage\fi}

%If you have problems with the position of ABBREVATIONS title, you may try to 
%(1) commenting out the above lines, and
%(2) uncomment the following lines.

%\def\glossary{\@ifnextchar[\gl@ssary{\gl@ssary[ABBREVIATIONS]}}
%\def\endglossary{\endgl@ssary}
%\def\gl@ssary[#1]{\@restonecoltrue\if@twocolumn\@restonecolfalse\fi\columnseprule
%\z@
%\columnsep 35pt%\twocolumn
%\chapter*{\vskip *-5mm* LIST OF #1}
%\@mkboth {#1}{#1}
%\addcontentsline{toc}{leads}{\protect\numberline {}LIST OF
%\uppercase{#1}}\singlespacing}
%\def\endgl@ssary{\if@restonecol\onecolumn\else\clearpage\fi}

\def\listofillustrations{\singlespacing
\addcontentsline{toc}{leads}{\protect\numberline\MakeUppercase{{}LIST OF ILLUSTRATIONS}}
\@restonecolfalse\if@twocolumn\@restonecoltrue\onecolumn\fi
 \prechapter*{LIST OF ILLUSTRATIONS\@mkboth
 {LIST OF ILLUSTRATIONS}{LIST OF ILLUSTRATIONS}}\@starttoc{loi}\if@restonecol
 \twocolumn\fi\newpage }
\def\l@illustration{\@dottedtocline{1}{1.5em}{2.3em}}

\AtBeginDocument{%
	\addto\captionsfrench{%
	\renewcommand{\bibname}{\hspace*{-12cm} REFERENCES}%
	}}

%%               to get correct references
\def\bibliography#1{
\newpage 
\thispagestyle{empty}
 \typeout{REFERENCES}
  \addcontentsline{toc}{chapter}{REFERENCES}
  \if@filesw\immediate\write\@auxout{\string\bibdata{#1}}\fi
  \@input{\jobname.bbl}\renewcommand\bibname{REFERENCES}}
\def\thebibliography#1{ \selectlanguage{english} \AtBeginDocument{\renewcommand{\bibname}{REFERENCES}}\renewcommand\bibname{REFERENCES} \chapter*{\begin{flushleft}REFERENCES\end{flushleft}\@mkboth
 {BIBLIOGRAPHY}{BIBLIOGRAPHY}}\list
 {[\arabic{enumi}]}{\settowidth\labelwidth{[#1]}\leftmargin\labelwidth
 \advance\leftmargin\labelsep
 \usecounter{enumi}}
 \def\newblock{\hskip .11em plus .33em minus .07em}
 \sloppy\clubpenalty4000\widowpenalty4000
 \sfcode`\.=1000\relax}


\newif\if@restonecol
\def\theindex{\@restonecoltrue\if@twocolumn\@restonecolfalse\fi
\columnseprule \z@
\columnsep 35pt\twocolumn[\@makeschapterhead{Index}]
 \@mkboth{INDEX}{INDEX}\thispagestyle{plain}\parindent\z@
 \parskip\z@ plus .3pt\relax\let\item\@idxitem}
\def\@idxitem{\par\hangindent 40pt}
\def\subitem{\par\hangindent 40pt \hspace*{20pt}}
\def\subsubitem{\par\hangindent 40pt \hspace*{30pt}}
\def\endtheindex{\if@restonecol\onecolumn\else\clearpage\fi}
\def\indexspace{\par \vskip 10pt plus 5pt minus 3pt\relax}

\def\footnoterule{\kern-3\p@
 \hrule width \columnwidth
 \kern 2.6\p@}
\@addtoreset{footnote}{chapter}
\long\def\@makefntext#1{\parindent 1em\noindent
 \hbox to 1.8em{\hss$^{\@thefnmark}$}#1}

\setcounter{topnumber}{2}
\def\topfraction{.7}
\setcounter{bottomnumber}{1}
\def\bottomfraction{.3}
\setcounter{totalnumber}{3}
\def\textfraction{.2}
\def\floatpagefraction{.5}
\setcounter{dbltopnumber}{2}
\def\dbltopfraction{.7}
\def\dblfloatpagefraction{.5}

%captionlar icin buraya bak
\long\def\@makecaption#1#2{
 \ifmy@figur@ \vskip 20pt\fi
 \setbox\@tempboxa\hbox{#1: #2}
 \ifdim \wd\@tempboxa >\hsize #1: #2\par \else \hbox
to\hsize{\hfil\box\@tempboxa\hfil}
 \vskip7.5pt
 \fi \ifmy@t@ble \vskip 20pt\fi}

\newcounter{illustration}[chapter]
\def\theillustration{\thechapter.\@arabic\c@illustration}
\def\fps@illustration{tbp}
\def\ftype@illustration{3}
\def\ext@illustration{loi}
\def\fnum@illustration{Illustration \theillustration}
\def\illustration{\singlespacing \my@figur@true \@float{illustration}}
\let\endillustration\end@float
\@namedef{illustration*}{\@dblfloat{illustration}}
\@namedef{endillustration*}{\end@dblfloat}

\newcounter{figure}[chapter]
\def\thefigure{\thechapter.\@arabic\c@figure}
\def\fps@figure{tbp}
\def\ftype@figure{1}
\def\ext@figure{lof}
\def\fnum@figure{Figure \thefigure}
\def\figure{\singlespacing \my@figur@true \@float{figure}}
\let\endfigure\end@float
\@namedef{figure*}{\@float{figure}}
\@namedef{endfigure*}{\end@float}

\newcounter{table}[chapter]
\def\thetable{\thechapter.\@arabic\c@table}
\def\fps@table{tbp}
\def\ftype@table{2}
\def\ext@table{lot}
\def\fnum@table{\@tablelabel \thetable}
\def\table{\singlespacing \my@t@bletrue \@float{table}}
\let\endtable\end@float
\@namedef{table*}{\@float{table}}
\@namedef{endtable*}{\end@float}


\def\@graduateschool{Institute of Science and Engineering}
\def\@tgraduateschool{Fen Bilimleri Enstitüsü}
\ifm@s
\def\@shortdegree{M.S}
\def\@degree{Master of Science}
\def\@tdegree{Yüksek Lisans}
\else
\def\@shortdegree{Ph.D.}
\def\@degree{Doctor of Philosophy}
\def\@tdegree{Doktora}
\fi

\def\department#1{\def\@department{#1}}
\def\@departmentofsupervisor{}\def\departmentofsupervisor#1{\def\@departmentofsupervisor{#1}}
\def\turkishdepartmentofsupervisor#1{\def\@turkishdepartmentofsupervisor{#1}}
\def\@departmentofcosupervisor{}\def\departmentofcosupervisor#1{\def\@departmentofcosupervisor{#1}}
\def\turkishdepartmentofcosupervisor#1{\def\@turkishdepartmentofcosupervisor{#1}}
\def\turkishdepartment#1{\def\@tdepartment{#1}}
\def\@ttitle{}\def\turkishtitle#1{\def\@ttitle{#1}}

\def\@proftitlename{Prof. Dr.}\def\@tproftitlename{Prof. Dr.}
\def\@assocproftitlename{Assoc. Prof. Dr.}\def\@tassocproftitlename{Doç. Dr.}
\def\@assistproftitlename{Assist. Prof. Dr.}\def\@tassistproftitlename{Yrd. Doç. Dr.}
\def\@drtitlename{Dr.}\def\@tdrtitlename{Dr.}

\def\@director{}
\def\director{\@ifnextchar[{\@academicdirector}{\@plaindirector}}
\def\@plaindirector#1{\def\@director{#1}}
\def\@academicdirector[#1]#2{\def\@director{\csname @#1titlename\endcsname\space#2}}

\def\@headofdept{}
\def\headofdept{\@ifnextchar[{\@academicheadofdept}{\@plainheadofdept}}
\def\@plainheadofdept#1{\def\@headofdept{#1}}
\def\@academicheadofdept[#1]#2{\def\@headofdept{\csname @#1titlename\endcsname\space#2}}

\def\@supervisor{}\def\@turkishsupervisor{} 
\def\supervisor{\@ifnextchar[{\@academicsupervisor}{\@plainsupervisor}}
\def\@plainsupervisor#1{\def\@supervisor{#1} \def\@turkishsupervisor{#1}}
\def\@academicsupervisor[#1]#2{
	\def\@supervisor{\csname @#1titlename\endcsname\space#2}
	\def\@turkishsupervisor{\csname @t#1titlename\endcsname\space#2}
}
\def\turkishsupervisor#1{\def\@turkishsupervisor{#1}}

\newif\ifexist@co \exist@cofalse
\def\@cosupervisor{} \def\@turkishcosupervisor{} 
\def\cosupervisor{\@ifnextchar[{\@academiccosupervisor}{\@plaincosupervisor}}
\def\@plaincosupervisor#1{\def\@cosupervisor{#1} \def\@turkishcosupervisor{#1}\exist@cotrue }
\def\@academiccosupervisor[#1]#2{
	\def\@cosupervisor{\csname @#1titlename\endcsname\space#2}
	\def\@turkishcosupervisor{\csname @t#1titlename\endcsname\space#2}\exist@cotrue 
}
\def\turkishcosupervisor#1{\def\@turkishcosupervisor{#1}}

\def\@affiliationi{} \def\affiliationi#1{\def\@affiliationi{#1}}
\def\@affiliationii{} \def\affiliationii#1{\def\@affiliationii{#1}}
\def\@affiliationiii{} \def\affiliationiii#1{\def\@affiliationiii{#1}}
\def\@affiliationiv{} \def\affiliationiv#1{\def\@affiliationiv{#1}}
\def\@affiliationv{} \def\affiliationv#1{\def\@affiliationv{#1}}
\def\@taffiliationi{} \def\turkishaffiliationi#1{\def\@taffiliationi{#1}}
\def\@taffiliationii{} \def\turkishaffiliationii#1{\def\@taffiliationii{#1}}
\def\@taffiliationiii{} \def\turkishaffiliationiii#1{\def\@taffiliationiii{#1}}
\def\@taffiliationiv{} \def\turkishaffiliationiv#1{\def\@taffiliationiv{#1}}
\def\@taffiliationv{} \def\turkishaffiliationv#1{\def\@taffiliationv{#1}}

\def\@committeememberi{} \def\@tcommitteememberi{} 
\def\@committeememberii{} \def\@tcommitteememberii{} 
\def\@committeememberiii{} \def\@tcommitteememberiii{} 
\def\@committeememberiv{} \def\@tcommitteememberiv{} 
\def\@committeememberv{} \def\@tcommitteememberv{} 
\def\committeememberi{\@ifnextchar[{\@academiccommitteemember{i}}{\@plaincommitteemember{i}}}
\def\committeememberii{\@ifnextchar[{\@academiccommitteemember{ii}}{\@plaincommitteemember{ii}}}
\def\committeememberiii{\@ifnextchar[{\@academiccommitteemember{iii}}{\@plaincommitteemember{iii}}}
\def\committeememberiv{\@ifnextchar[{\@academiccommitteemember{iv}}{\@plaincommitteemember{iv}}}
\def\committeememberv{\@ifnextchar[{\@academiccommitteemember{v}}{\@plaincommitteemember{v}}}
\def\@plaincommitteemember#1#2{\expandafter\def\csname @committeemember#1\endcsname{#2} \expandafter\def\csname @tcommitteemember#1\endcsname{#2}}
\def\@academiccommitteemember#1[#2]#3{
	\expandafter\def\csname @committeemember#1\endcsname{\csname @#2titlename\endcsname\space#3}
	\expandafter\def\csname @tcommitteemember#1\endcsname{\csname @t#2titlename\endcsname\space#3}
}
\def\turkishcommitteememberi#1{\def\@tcommitteememberi{#1}}
\def\turkishcommitteememberii#1{\def\@tcommitteememberii{#1}}
\def\turkishcommitteememberiii#1{\def\@tcommitteememberiii{#1}}
\def\turkishcommitteememberiv#1{\def\@tcommitteememberiv{#1}}
\def\turkishcommitteememberv#1{\def\@tcommitteememberv{#1}}

\def\@trtitle{}
\def\trtitle#1{\def\@trtitle{#1}}
\def\@keywords{} 
\def\keywords#1{\def\@keywords{#1}}
\def\@anahtarklm{} \def\anahtarklm#1{\def\@anahtarklm{#1}}
\def\@motscles{} \def\motscles#1{\def\@motscles{#1}}
\def\maketitle{\begin{titlepage}\normalsize
\let\footnotesize\small \let\footnoterule\relax \setcounter{page}{1}
\null \nointerlineskip
 \begin{center} \vskip 0.30cm plus0pt
 \nointerlineskip
 \vbox{\oneandhalfspacing \textbf{\MakeUppercase{\@disptitle}} \\(\MakeUppercase{\@trtitle)}}
 \vbox{}
\vskip 1.1cm plus0pt minus2mm \nointerlineskip
 \vbox{by\vskip 0.5cm \textbf{\expandafter{\MakeUppercase{\@author}}, \ifm@s B.S. \else M.S. \fi}}
\vskip 1.85cm plus0pt minus1cm \nointerlineskip
 \vbox{\oneandhalfspacing \@titleparta}
\vskip 1.85cm plus0pt minus2mm \nointerlineskip 
 \vbox{\oneandhalfspacing \@titlepartb}
\vskip 1.5cm plus0pt minus1cm \nointerlineskip
\vspace{\stretch{1}}
 \vbox{\textbf{
\ifx\kernel@date\@date
	\ift@rkish\MakeUppercase{\@tdate}\else\MakeUppercase{\@date}\fi
	\else
	\ift@rkish\@datetoturuc{\@date}\else\MakeUppercase{\@date}\fi
	\fi}
} 
\vskip 1.6cm plus0pt minus0.5cm \nointerlineskip
\end{center}
\end{titlepage}
\setcounter{footnote}{0} \let\thanks\relax
\gdef\@thanks{}\let\maketitle\relax}

\def\turmonthjanuary{Ocak}
\def\turmonthfebruary{Şubat}
\def\turmonthmarch{Mart}
\def\turmonthapril{Nisan}
\def\turmonthmay{Mayıs}
\def\turmonthjune{Haziran}
\def\turmonthjuly{Temmuz}
\def\turmonthaugust{Ağustos}
\def\turmonthseptember{Eylül}
\def\turmonthoctober{Ekim}
\def\turmonthnovember{Kasım}
\def\turmonthdecember{Aralık}
\def\@trmonth#1{\csname turmonth#1\endcsname}
\def\@helperdatetoturuc#1 #2\nil{
\lowercase{\def\@temp{#1}}
\MakeUppercase{\@trmonth{\@temp}}~#2}
\def\@helperdatetotur#1 #2\nil{
\lowercase{\def\@temp{#1}}
\@trmonth{\@temp}~#2}
\def\@datetotur#1{\expandafter\@helperdatetotur#1\nil}
\def\@datetoturuc#1{\expandafter\@helperdatetoturuc#1\nil}

\def\showresume{
\thispagestyle{empty}
\addcontentsline{toc}{leads}{\protect\numberline\MakeUppercase{{}R\'{E}SUM\'{E}}}
\@restonecolfalse
\if@twocolumn
    \@restonecoltrue\onecolumn
 \fi
 \prechapter*{ \begin{flushleft} R\'{E}SUM\'{E} \end{flushleft}}
\selectlanguage{french}
\@mkboth {R\'{E}SUM\'{E}}{R\'{E}SUM\'{E}}
 \oneandhalfspacing
\ifd@uble\doublespacing\else\ifs@ngle\singlespacing\else\oneandhalfspacing\fi\fi
\@resumetext}
\def\endshowresume{\vskip 1.5\baselineskip \par \noindent \textbf{Mots Clés :} \@motscles
\gdef\@motscles{}\let\motscles\relax
\if@restonecol \twocolumn\fi\oneandhalfspacing\newpage
\ift@rkish\selectlanguage{turkish}\fi }


\def\showoz{
\thispagestyle{empty}
\addcontentsline{toc}{leads}{\protect\numberline\MakeUppercase{{}\"OZET}}
\@restonecolfalse
\if@twocolumn
    \@restonecoltrue\onecolumn
 \fi
 \prechapter*{\begin{flushleft}\"{O}ZET\end{flushleft}}
\selectlanguage{turkish}
\@mkboth {\raggedright \"{O}ZET}{\raggedright\"{O}ZET}  \oneandhalfspacing
\ifd@uble\doublespacing\else\ifs@ngle\singlespacing\else\oneandhalfspacing\fi\fi
\@oztext}
\def\endshowoz{\vskip 1.5\baselineskip \par \noindent \textbf{Anahtar Kelimeler :} \@anahtarklm
\gdef\@anahtarklm{}\let\anahtarklm\relax
\gdef\@tdegree{}
\gdef\@tdepartment{}\let\turkishdepartment\relax
\gdef\@ttitle{}\let\turkishtitle\relax
\gdef\@supervisor{}\let\supervisor\relax
\gdef\@cosupervisor{}\let\cosupervisor\relax
\if@restonecol \twocolumn\fi\oneandhalfspacing\newpage
\ift@rkish\relax\else\selectlanguage{english}\fi }

\newcommand{\abstract}[1]{\newcommand{\@abstracttext}{#1}}
\newcommand{\resume}[1]{\newcommand{\@resumetext}{#1}}
\newcommand{\oz}[1]{\newcommand{\@oztext}{#1}}
\newcommand{\dedication}[1]{\newcommand{\@dedicationtext}{#1}}
\newcommand{\turkishdedication}[1]{\newcommand{\@tdedicationtext}{#1}}
\newcommand{\turkishacknowledgments}[1]{\newcommand{\@tacknowledgmentstext}{#1}}
\newcommand{\acknowledgments}[1]{\newcommand{\@acknowledgmentstext}{#1}}

\def\showabstract{
\thispagestyle{empty}
\setlength{\parindent}{0em}
\setlength{\parskip}{10pt}
\addcontentsline{toc}{leads}{\protect\numberline\MakeUppercase{{}ABSTRACT}}
\@restonecolfalse
\if@twocolumn
    \@restonecoltrue\onecolumn
 \fi
 \prechapter*{\vskip 0.3cm \begin{flushleft} ABSTRACT \end{flushleft}}\@mkboth {ABSTRACT}{ABSTRACT} 
\selectlanguage{english}
 
\ifd@uble\doublespacing\else\ifs@ngle\singlespacing\else\oneandhalfspacing\fi\fi
\@abstracttext}
\def\endshowabstract{
\vskip 1.5\baselineskip \par \noindent \textbf{Keywords :} \@keywords
\gdef\@keywords{}\let\keywords\relax
\gdef\@shortdegree{}
\gdef\@department{}\let\department\relax
\gdef\@supervisor{}\let\supervisor\relax
\gdef\@cosupervisor{}\let\cosupervisor\relax
\if@restonecol \twocolumn\fi\newpage 
\ift@rkish\selectlanguage{turkish}\fi}

\def\showdedication{
\begin{center}\null
\vspace*{\fill}
\ift@rkish
\@tdedicationtext
\else
\@dedicationtext
\fi}

\def\endshowdedication{
\vspace*{\fill}
\end{center}
\newpage}

\def\approval{
\thispagestyle{empty}
\null
\parindent0cm
\singlespacing
\vskip1.0cm plus0pt minus2mm \nointerlineskip
\parbox[t]{15cm}{\begin{center} \@approvallabel\end{center}}
\vskip1.0cm plus0pt minus2mm \nointerlineskip
\parbox[t]{15cm}{\begin{center}\singlespacing \bf{\MakeUppercase{\@disptitle}}\end{center}}
\vskip2.0cm plus0pt minus2mm \nointerlineskip
\parbox[t]{14.5cm}{\singlespacing \@approvaltext}
\vskip1.5cm plus0pt minus2mm \nointerlineskip
 \vbox{\bf{\@committeelabel:}}
\vskip0.5cm plus0pt minus2mm \nointerlineskip
\vbox{
		\parbox{11cm}{\singlespacing \expthr@@{\@dispsupervisor}\\
		\@supervisorlabel, {\bf \expthr@@{\@dispdepartmentofsupervisor}}} \hfill \parbox{3cm}{\singlespacing \begin{center}
                      \rule{3cm}{1pt}
                      \end{center}\nointerlineskip}}

\ifexist@co
\vskip0.5cm plus0pt minus2mm \nointerlineskip  
  \vbox{
  \parbox{11cm}{\singlespacing \expthr@@{\@cosupervisor}\\ \@cosupervisorlabel, {\bf
\expthr@@{\@dispdepartmentofcosupervisor}}} \hfill \parbox{3cm}{\singlespacing \begin{center} \rule{3cm}{1pt} \end{center}\nointerlineskip}}
\else
\fi  

\vskip0.5cm plus0pt minus2mm \nointerlineskip  
  \vbox{
  \parbox{11cm}{\singlespacing \expthr@@{\@dispcommitteememberi}\\  {\bf
\expthr@@{\@dispaffiliationi}}} \hfill \parbox{3cm}{\singlespacing \begin{center} \rule{3cm}{1pt} \end{center}\nointerlineskip}}

\vskip0.5cm plus0pt minus2mm \nointerlineskip  
  \vbox{
  \parbox{11cm}{\singlespacing \expthr@@{\@dispcommitteememberii}\\  {\bf
\expthr@@{\@dispaffiliationii}}} \hfill \parbox{3cm}{\singlespacing \begin{center} \rule{3cm}{1pt} \end{center}\nointerlineskip}}

\ifm@s
\ifexist@co                  
\vskip0.5cm plus0pt minus2mm \nointerlineskip  
  \vbox{
  \parbox{11cm}{\singlespacing \expthr@@{\@dispcommitteememberiii}\\  {\bf
\expthr@@{\@dispaffiliationiii}}} \hfill \parbox{3cm}{\singlespacing \begin{center} \rule{3cm}{1pt} \end{center}\nointerlineskip}}
\else
\ifexist@co                  
\vskip0.5cm plus0pt minus2mm \nointerlineskip  
  \vbox{
  \parbox{11cm}{\singlespacing \expthr@@{\@dispcommitteememberiii}\\  {\bf
\expthr@@{\@dispaffiliationiii}}} \hfill \parbox{3cm}{\singlespacing \begin{center} \rule{3cm}{1pt} \end{center}\nointerlineskip}}
\else
\fi 
\fi
\fi 

\ifm@s
\else
\vskip0.5cm plus0pt minus2mm \nointerlineskip  
  \vbox{
  \parbox{11cm}{\singlespacing \expthr@@{\@dispcommitteememberiv}\\  {\bf
\expthr@@{\@dispaffiliationiv}}} \hfill \parbox{3cm}{\singlespacing \begin{center} \rule{3cm}{1pt} \end{center}\nointerlineskip}}
\fi

\ifm@s
\else
\ifexist@co 
\vskip0.5cm plus0pt minus2mm \nointerlineskip  
  \vbox{
  \parbox{11cm}{\singlespacing \expthr@@{\@dispcommitteememberiv}\\  {\bf
\expthr@@{\@dispaffiliationiv}}} \hfill \parbox{3cm}{\singlespacing \begin{center} \rule{3cm}{1pt} \end{center}\nointerlineskip}}
\fi
\fi

\vskip1.5cm plus0pt minus2mm \nointerlineskip
 \vbox{\parbox{11cm}{\bf
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\@datelabel:}
 \hfill \parbox{3cm}{\singlespacing \begin{center} \rule{3cm}{1pt} \end{center}\nointerlineskip}}

\newpage}

\newcommand{\@showturkishacknowledgments}{
\setlength{\parindent}{0em}
\setlength{\parskip}{10pt}

\@restonecolfalse
\if@twocolumn
    \@restonecoltrue\onecolumn
\fi
\vskip6.5mm
\prechapter*{TEŞEKKÜRLER} \selectlanguage{turkish}\@mkboth{TEŞEKKÜRLER}{TEŞEKKÜRLER}
\addcontentsline{toc}{leads}{\protect\numberline{}TEŞEKKÜRLER}
\ifd@uble\doublespacing\else\ifs@ngle\singlespacing\else\oneandhalfspacing\fi\fi
\@tacknowledgmentstext
\if@restonecol
    \twocolumn
\fi
\ift@rkish
\relax
\else
\selectlanguage{english}
\fi
\newpage
\setlength{\parindent}{0em}
\setlength{\parskip}{3pt}
}

\newcommand{\@showacknowledgments}{
\setlength{\parindent}{0em}
\setlength{\parskip}{10pt}
\ifd@uble\doublespacing\else\ifs@ngle\singlespacing\else\oneandhalfspacing\fi\fi

\@restonecolfalse
\if@twocolumn
    \@restonecoltrue\onecolumn
\fi
\vskip6.5mm
\prechapter*{\vskip0.5cm \begin{flushleft} ACKNOWLEDGMENTS \end{flushleft}} 
\@mkboth{ACKNOWLEDGMENTS}{ACKNOWLEDGMENTS}
\addcontentsline{toc}{leads}{\protect\numberline\MakeUppercase{{}ACKNOWLEDGEMENTS}}
\oneandhalfspacing
\@acknowledgmentstext
\if@restonecol
    \twocolumn
\fi
\newpage
\setlength{\parindent}{0em}
\setlength{\parskip}{3pt}
}

%\def\acknowledgments{
%\addcontentsline{toc}{leads}{\protect\numberline {}ACKNOWLEDGMENTS}
%\@restonecolfalse\if@twocolumn\@restonecoltrue\onecolumn
%\fi\prechapter*{ACKNOWLEDGMENTS}\@mkboth {ACKNOWLEDGMENTS}{ACKNOWLEDGMENTS}}
%\def\endacknowledgments{\if@restonecol \twocolumn\fi\doublespacing\newpage}

\newenvironment{preface}{
\addcontentsline{toc}{leads}{\protect\numberline\MakeUppercase{{}PREFACE}}
\@restonecolfalse
\if@twocolumn
    \@restonecoltrue\onecolumn
 \fi
\prechapter*{PREFACE}\@mkboth {PREFACE}{PREFACE}
}{
\if@restonecol
    \twocolumn
\fi
\newpage
}

\newenvironment{curriculumvitae}{
\@restonecolfalse
\if@twocolumn
    \@restonecoltrue\onecolumn
\fi
\chapter*{\vskip 0.3cm \begin{flushleft} BIOGRAPHICAL SKETCH \end{flushleft}} \@mkboth{BIOGRAPHICAL SKETCH}{BIOGRAPHICAL SKETCH}
\addcontentsline{toc}{leads}{\protect\numberline\MakeUppercase{{}BIOGRAPHICAL SKETCH}}
}{
\if@restonecol
    \twocolumn
\fi

}

\def\vita{\thispagestyle{empty} \addcontentsline{toc}{leads}{\protect\numberline\MakeUppercase{{}VITA}}
\@restonecolfalse\if@twocolumn\@restonecoltrue\onecolumn
 \pagestyle{plain}
 \fi\chapter*{VITA}\@mkboth {VITA}{VITA}}
\def\endvita{\if@restonecol \twocolumn\fi}

\def\preliminaries{\pagenumbering{roman}\pagestyle{plain}
\ift@rkish
\selectlanguage{turkish}
\def\@disptitle{\@ttitle}
\def\@dispdepartment{\@tdepartment}
\def\@dispsupervisor{\@turkishsupervisor}
\def\@dispdepartmentofsupervisor{\@ifundefined{@turkishdepartmentofsupervisor}{\@departmentofsupervisor}{\@turkishdepartmentofsupervisor}}
\def\@dispdepartmentofcosupervisor{\@ifundefined{@turkishdepartmentofcosupervisor}{\@departmentofcosupervisor}{\@turkishdepartmentofcosupervisor}}
\def\@dispaffiliationi{\@taffiliationi}
\def\@dispaffiliationii{\@taffiliationii}
\def\@dispaffiliationiii{\@taffiliationiii}
\def\@dispaffiliationiv{\@taffiliationiv}
\def\@dispaffiliationv{\@taffiliationv}
\def\@dispcommitteememberi{\ifx\@tcommitteememberi\empty\@committeememberi\else\@tcommitteememberi\fi}
\def\@dispcommitteememberii{\ifx\@tcommitteememberii\empty\@committeememberii\else\@tcommitteememberii\fi}
\def\@dispcommitteememberiii{\ifx\@tcommitteememberiii\empty\@committeememberiii\else\@tcommitteememberiii\fi}
\def\@dispcommitteememberiv{\ifx\@tcommitteememberiv\empty\@committeememberiv\else\@tcommitteememberiv\fi}
\def\@dispcommitteememberv{\ifx\@tcommitteememberv\empty\@committeememberv\else\@tcommitteememberv\fi}
\else
\selectlanguage{english}
\def\@disptitle{\@title}
\def\@dispdepartment{\@department}
\def\@dispsupervisor{\@supervisor}
\def\@dispdepartmentofsupervisor{\@departmentofsupervisor}
\def\@dispdepartmentofcosupervisor{\@departmentofcosupervisor}
\def\@dispaffiliationi{\@affiliationi}
\def\@dispaffiliationii{\@affiliationii}
\def\@dispaffiliationiii{\@affiliationiii}
\def\@dispaffiliationiv{\@affiliationiv}
\def\@dispaffiliationv{\@affiliationv}
\def\@dispcommitteememberi{\@committeememberi}
\def\@dispcommitteememberii{\@committeememberii}
\def\@dispcommitteememberiii{\@committeememberiii}
\def\@dispcommitteememberiv{\@committeememberiv}
\def\@dispcommitteememberv{\@committeememberv}
\fi
\maketitle
\approval
\ift@rkish
\@showturkishacknowledgments
\else
\@showacknowledgments
\fi
\tableofcontents
\listoffigures
\listoftables


\if@lg@rithmloaded
\renewcommand{\listalgorithmcfname}{LIST OF ALGORITHMS}
\makeatletter
\def\listofalgorithms{\singlespacing
\@restonecolfalse\if@twocolumn\@restonecoltrue\onecolumn
 \fi
 \ifturkish
 \prechapter*{\vskip-1mm ALGORİTMALAR LİSTESİ\@mkboth
 {ALGORİTMALAR LİSTESİ}{ALGORİTMALAR LİSTESİ}}
\addcontentsline{toc}{leads}{\protect\numberline {}ALGORİTMALAR LİSTESİ}
\else
 \prechapter*{\vskip0.4cm \begin{flushleft}
LIST OF ALGORITHMS 
\end{flushleft}  \@mkboth
 {LIST OF ALGORITHMS}{LIST OF ALGORITHMS}}
\addcontentsline{toc}{leads}{\protect\numberline\MakeUppercase{{}LIST OF ALGORITHMS}}
\fi
\@starttoc{loa}\if@restonecol
 \twocolumn\fi\newpage 
 \ifturkish
 \addtocontents{loa}{\protect\numberline{}ALGORİTMALAR}
 \addtocontents{loa}{\par}
%\addcontentsline{loa}{nodots}{\protect\numberline{}ALGORİTMALAR}
\else
%\addcontentsline{loa}{nodots}{\protect\numberline{}ALGORITHMS}
\addtocontents{loa}{\protect\numberline{}}
\addtocontents{loa}{\par}
\fi}
\def\l@algocf{\@myalgodottedtocline{1}{0em}{2.0em}}
\makeatother
%\listofalgorithms
\showabstract
\endshowabstract
%\showresume
%\endshowresume
\showoz
\endshowoz
\fi
}%
\def\endpreliminaries{
\if@twoside\cleardoublepage\else\newpage\fi\pagestyle{headings}\pagenumbering{arabic}%
\addtocontents{toc}{\protect\numberline {}}
\addtocontents{lot}{\protect\numberline {}}
\addtocontents{lot}{\par}
\addtocontents{lof}{\protect\numberline {}}
\addtocontents{lof}{\par}
\ift@rkish
\shorthandoff{=}
\shorthandoff{:}
\shorthandoff{!}
\fi
}

\mark{{}{}}
\setlength{\textheight}{22.7cm}
\def\ps@headings{\let\@mkboth\markboth
\def\@oddfoot{}\def\@evenfoot{}%
\ifpn@topr \def\@evenhead{\hbox{}  \rm\thepage}
\else \def\@evenhead{\hbox{} \hfil \rm\thepage \hfil} \fi
\let\@oddhead=\@evenhead%
\def\chaptermark##1{\markboth {{\ifnum \c@secnumdepth >\m@ne
 \thechapter. \  ##1\fi}}{}}%
\def\sectionmark##1{\markright {{\ifnum \c@secnumdepth >\z@
 \thesection. \ \fi ##1}}}}

\def\ps@plain{\let\@mkboth\markboth 
\def\@evenfoot{\hbox{} \hfil \rm\thepage \hfil} \let\@oddfoot=\@evenfoot%
\def\@evenhead{} \let\@oddhead=\@evenhead%
\def\chaptermark##1{\markboth {{\ifnum \c@secnumdepth >\m@ne
  \thechapter. \ \fi ##1}}{}}%
\def\sectionmark##1{\markright {{\ifnum \c@secnumdepth >\z@
 \thesection. \ \fi ##1}}}}

\def\ps@myheadings{\let\@mkboth\@gobbletwo
\def\@oddhead{\hbox{}\sl\rightmark \hfil
\rm\thepage}\def\@oddfoot{}\def\@evenhead{\rm \thepage\hfil\sl\leftmark\hbox
{}}\def\@evenfoot{}\def\sectionmark##1{}\def\subsectionmark##1{}}

\def\today{\ifcase\month\or
 January\or February\or March\or April\or May\or June\or
 July\or August\or September\or October\or November\or December\fi~\number\year}

\def\bugun{\ifcase\month\or
 Ocak\or \c{S}ubat\or Mart\or Nisan\or May{\i}s\or Haziran\or
 Temmuz\or A\u{g}ustos\or Eyl\"{u}l\or Ekim\or Kas{\i}m\or Aral{\i}k\fi
 \space\number\year}

\let\@date\today
\let\kernel@date\today
\let\@tdate\bugun

%\let\orighead\@makechapterhead
\renewcommand\@makechapterhead[1]{\vspace{4cm}\begin{flushleft}
  {\normalfont
    \ifnum \c@secnumdepth >\m@ne
         \large\bfseries \thechapter \hspace{1.5em}\large \bfseries \MakeUppercase{#1}%\hspace{1ex}       
    \fi
    
 %   \interlinepenalty\@M
    \par\nobreak
    \vskip0.8\baselineskip  %\vskip29pt
  }
\end{flushleft}}
%\renewcommand*{\@makechapterhead}[1]{\orighead{\MakeUppercase{#1}}}


\@addtoreset{equation}{chapter}
\def\theequation{\thechapter.\arabic{equation}}

\ifpn@top \pagestyle{headings} \else \pagestyle{plain} \fi
\pagenumbering{arabic} \onecolumn

\textheight=23.7cm

\uccode`@=`I \lccode`@="10

\let\@enddoc=\enddocument
\def\enddocument{\label{`@lastpage'}\@enddoc }

