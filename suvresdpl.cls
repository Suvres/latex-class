%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 
% File:    suvresdpl.cls      (LaTeX Document class option "suvresdpl")
%          
% Author:  Bartosz Błyszcz    (bartosz.blyszcz@gmail.com)
%          
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\message{*** [suvresdpl.cls] ---  (BB)  v1.0 <2022-02-19>  ***}       

\newif\ifpdflatex\pdflatexfalse
\NeedsTeXFormat{LaTeX2e} 
\ProvidesClass{suvresdpl} 

\RequirePackage{kvoptions}

\DeclareStringOption[pl]{language}
\ProcessKeyvalOptions*

\DeclareOption{pdflatex}{\pdflatextrue}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{report}} 
\ProcessOptions\LoadClass[a4paper,twoside,openright]{report} 

\RequirePackage{xstring}
\RequirePackage{cmap}

\RequirePackage{times}
\RequirePackage[T1]{fontenc}

\RequirePackage[english,polish]{babel}

% Użyj polskiego łamania wyrazów (zamiast domyślnego angielskiego).
\RequirePackage{polski}

% Użyj kodowania UTF-8.
\RequirePackage[utf8]{inputenc}

% \RequirePackage{xcolor}
\RequirePackage{mathtools}
\RequirePackage{amsfonts}
\RequirePackage{amsmath}
\RequirePackage{amsthm}

\RequirePackage{ragged2e}
\RequirePackage{graphicx}
\RequirePackage[usenames]{color}
\RequirePackage{url}
\RequirePackage{titlesec}
\RequirePackage{tocloft}
\RequirePackage{float}

\RequirePackage{tikz}
\usetikzlibrary{shapes.symbols}
\usetikzlibrary{shapes.geometric}
\usetikzlibrary{shapes.arrows}

\RequirePackage[none]{hyphenat}

\RequirePackage[font=small, labelfont=bf, labelsep=period]{caption}
\RequirePackage{subcaption}
\RequirePackage{enumerate}
\RequirePackage{enumitem}



% =============================================================================
% SEC:   Polecenia wymagane m.in. do generowania strony tytułowej
% =============================================================================

\def\tShorttitle#1              {\gdef\@tShorttitle{#1}}
\def\tShortauthor#1             {\gdef\@tShortauthor{#1}}
\def\tTitle#1                   {\gdef\@tTitle{#1}}
\def\tFaculty#1                 {\gdef\@tFaculty{#1}}
\def\tYear#1                    {\gdef\@tYear{#1}}
\def\tIndex#1                   {\gdef\@tIndex{#1}}
\def\tGroup#1                   {\gdef\@tGroup{#1}}
\def\tField#1                   {\gdef\@tField{#1}}
\def\secTitle#1                 {\gdef\@secTitle{#1}}
\def\acknowledgements#1         {\gdef\@acknowledgements{#1}}


% --- Table Title

\newcommand{\tablepage}{%

    \linespread{1} 

    \titlepage
    \vspace*{\stretch{1.0}}
    \begin{table}[t]
        \centering
        \resizebox{\columnwidth}{!}{\begin{tabular}[width=\textwidth]{|l|l|l|}
            \hline
            
            \parbox[t]{10cm}{\textit{\footnotesize{Autor:}} \\ \@author} 
                & \parbox[t]{2cm}{\textit{\footnotesize{Indeks:}} \@tIndex} 
                & \parbox[t]{2cm}{\textit{\footnotesize{Grupa:}} \\ \@tGroup} \\[2.5ex]
            
            \hline
            
            \multicolumn{3}{|l|}{\parbox[t]{14cm}{\textit{\footnotesize{Tytuł:}} \\ \textsc{\textbf{ \@title}}}} \\[2.5ex]
            
            \hline
            
            \parbox[t]{4cm}{\textit{\footnotesize{Kierunek:}} \\ \@tField} 
                & \parbox[t]{4cm}{\textit{\footnotesize{Wydział:}} \\  \@tFaculty} 
                & \parbox[t]{4cm}{\textit{\footnotesize{Data:}} \\ \@date} \\[2.5ex]
            
            \hline
        \end{tabular}}
    \end{table}
    \vspace*{\stretch{2.0}}
    
    \linespread{1.5}
}


% --- Fance Title

\newcommand{\fancypage}{%

    \titlepage
    \centering
    \line(1,0){400} \\
    [4mm]
    \textbf{\textsc{ \Large{ \@title}}} \\
    \line(1,0){300} \\
    [4mm]
    \textsc{\large{ \@secTitle}} \\

    \vspace*{\fill}

    \begin{flushright}
        \textsc{
            \@author \\
            \@date
        }            
    \end{flushright}
    
    \clearpage
	\thispagestyle{empty} 
	
	% Strona z podziękowaniami.
	{~}\vspace{20mm}
	
	\clearpage
	\titlepage
	
	\vspace*{15cm} \vfill
	\begin{flushright} 
		\begin{minipage}[!h]{10cm}
			{\Large\itshape \@acknowledgements}
		\end{minipage}
	\end{flushright}
	
	\clearpage
	\thispagestyle{empty}
	
	~ \newpage
	
	% Obecna strona będzie mieć nr 5.
	\setcounter{page}{5}
}


% --- Simple Fance Title

\newcommand{\simplefancypage}{%

    \titlepage
    \centering
    \line(1,0){400} \\
    [4mm]
    \textbf{\textsc{ \Large{ \@title}}} \\
    \line(1,0){300} \\
    [4mm]
    \textsc{\large{ \@secTitle}} \\

    \vspace*{\fill}

    \begin{flushright}
        \textsc{
            \@author \\
            \@date
        }            
    \end{flushright}
    
	% Obecna strona będzie mieć nr 2.
	\setcounter{page}{2}
}



% =============================================================================
% SEC:   Ustawienia związane z formatowaniem tekstu
% =============================================================================

\RequirePackage{geometry}

% rozmiary marginesów i nagłówka/stopki
\geometry{lmargin=30mm, rmargin=30mm, tmargin=30mm, bmargin=30mm, foot=10mm, head=10mm} 

% interlinia
\linespread{1.5}  

% znak wypunktowania użyty w liście wypunktowania
\renewcommand{\labelitemi}{--}  

% Kontrola sierot i wdów - działa lepiej niż \widowpenalty i \clubpenalty
\RequirePackage[all,defaultlines=2]{nowidow} 
\brokenpenalty=10000\relax


% =============================================================================
% SEC:   Ustawienia nagłówków i stopek
% =============================================================================

\RequirePackage{fancyhdr}

\pagestyle{fancy}
\renewcommand{\chaptermark}[1]{\markboth{\thechapter.\ #1}{}}
\renewcommand{\sectionmark}[1]{\markright{\thesection.\ #1}}


\def\headAndFootWithShort{

    \renewcommand{\headrulewidth}{0.5pt}
    \renewcommand{\footrulewidth}{0pt}
    \fancyhf{}
    \fancyhead{}
    \fancyhead[RE,LO]{\slshape{\small \rightmark}}
    \fancyhead[RO,LE]{\bfseries \thepage}
    \fancyhead[LO,RE]{\small \textit{\leftmark}}
    
    \def\footShort{
        \fancyfoot[LE,RO]{\small \@tShortauthor\quad\textit{\@tShorttitle}}
        \renewcommand{\footrulewidth}{0.5pt}
    }
}

\def\headAndFoot{
    \renewcommand{\headrulewidth}{0pt}
    \renewcommand{\footrulewidth}{0.5pt}
    \fancyhf{}
    \fancyhead{}
    \fancyfoot[RO,LE]{\bfseries \thepage}
}



\def\headAndFootCasual{
    \renewcommand{\headrulewidth}{0pt}
    \renewcommand{\footrulewidth}{0pt}
    \fancyhf{}
    \fancyhead{}

    \fancyfoot[CO,CE]{- \thepage \ -}

}




\frenchspacing
\sloppy 
\flushbottom



% =============================================================================
% SEC:   Ustawienia formatowania tytułów rozdziałów, podrozdziałów, itd.
% =============================================================================

\titleformat{\chapter}[block]
{\bfseries\LARGE}{\filright \LARGE\thechapter. }{0ex}{}
%odstępy: lewy, góra, dół
\titlespacing{\chapter}{0pt}{17mm}{19mm}
\titleformat{\section}[block]
{\bfseries\Large}{\filright \Large\thesection. }{0ex}{}
\titlespacing{\section}{7mm}{8mm plus 0mm minus 1mm}{4mm plus 0mm minus 1mm}
\titleformat{\subsection}[block]
{\bfseries\large}{\filright \large\thesubsection. }{0ex}{}
\titlespacing{\subsection}{7mm}{6mm}{2.5mm}
\titleformat{\subsubsection}[block]
{\bfseries\normalsize}{\filright \normalsize\thesubsubsection. }{0ex}{}
\titlespacing{\subsubsection}{7mm}{3mm}{1.5mm}


% Określ maksymalny poziom numeracji (głębsze poziomy nie będą miały numeru).
%   (np. 1 - chapter, 2 - section, itd.)
\setcounter{secnumdepth}{4}


% =============================================================================
% SEC:   Ustawienia generowania spisu treści i spisu rysunków
% =============================================================================

\renewcommand{\cfttoctitlefont}{\bfseries\Large}
\renewcommand{\cftbeforetoctitleskip}{20mm}
\renewcommand{\cftaftertoctitleskip}{19mm}
\renewcommand{\cftchapleader}{\cftdotfill{\cftdot}}
\renewcommand{\cftsecleader}{\cftdotfill{\cftdot}}
\renewcommand{\cftsubsecleader}{\cftdotfill{\cftdot}}
\renewcommand{\cftchapaftersnum}{.}
\renewcommand{\cftsecaftersnum}{.}
\renewcommand{\cftsubsecaftersnum}{.}
\setlength{\cftparskip}{2pt}
\setlength{\cftbeforechapskip}{0mm}
\renewcommand{\cftchappagefont}{\normalsize}



% =============================================================================
% SEC:   Ustawienia wyświetlania liczb (zgodne z polskimi zwyczajami typograficznymi)
% =============================================================================

\RequirePackage{siunitx}

\sisetup{
	output-decimal-marker = {,},  % symbol dziesiętny
	%	round-mode=places,
	%	round-precision=4,
	group-separator={~},  % separator grupy 3 cyfr
}

% =============================================================================
% SEC:   Ustawienia wyświetlania URL-i
% =============================================================================

% Zmiana kroju czcionki URL-i z czcionki o stałej szerokości na szeryfową z kursywą.
\renewcommand\UrlFont{\rmfamily\itshape}

% =============================================================================
% SEC:   Ustawienia podpisów pod ilustracjami
% =============================================================================

\captionsetup[subfigure]{labelfont=md}
\captionsetup{%
	% Użyj okrągłych nawiasów wokół odwołań do "podilustracji".
	subrefformat=parens,
	% Margines z obu stron podpisu.
	margin=2cm,
	% W przypadku podpisów mieszczących się w jednej linii nie stosuj justowania, tylko wyśrodkuj cały podpis.
	singlelinecheck=on,
}

% =============================================================================
%    SEC:   Konfiguracja bibliografii
% =============================================================================

\RequirePackage[
	style=numeric,
	sorting=none,
	%
	% Zastosuj styl wpisu bibliograficznego właściwy językowi publikacji.
	language=autobib,
	autolang=other,
	% Zapisuj datę dostępu do strony WWW w formacie RRRR-MM-DD.
	urldate=iso8601,
	% Nie dodawaj numerów stron, na których występuje cytowanie.
	backref=false,
	% Podawaj ISBN.
	isbn=true,
	% Nie podawaj URL-i, o ile nie jest to konieczne.
	url=false,
	%
	% Ustawienia związane z polskimi normami dla bibliografii.
	maxbibnames=3,
	% Wybór silnika generowania bibliografii:
	% backend=bibtex  % - jeżeli używamy BibTeX-a
	backend=biber   % - jeżeli używamy biber-a
]{biblatex}

\RequirePackage{csquotes}
% Ponieważ `csquotes` nie posiada polskiego stylu, można skorzystać z mocno zbliżonego stylu chorwackiego.
\DeclareQuoteAlias{croatian}{polish}

\addbibresource{bibliografia.bib}

% Nie wyświetlaj wybranych pól.
%\AtEveryBibitem{\clearfield{note}}

\DeclareFieldFormat*{title}{,,\textit{#1}''}


% =============================================================================
%    SEC:   Konfiguracja listingów
% =============================================================================

% Użyj czcionki kroju Courier.
\RequirePackage{courier}

\RequirePackage{listings}
\lstloadlanguages{TeX}

\lstset{
	literate={ą}{{\k{a}}}1
           {ć}{{\'c}}1
           {ę}{{\k{e}}}1
           {ó}{{\'o}}1
           {ń}{{\'n}}1
           {ł}{{\l{}}}1
           {ś}{{\'s}}1
           {ź}{{\'z}}1
           {ż}{{\.z}}1
           {Ą}{{\k{A}}}1
           {Ć}{{\'C}}1
           {Ę}{{\k{E}}}1
           {Ó}{{\'O}}1
           {Ń}{{\'N}}1
           {Ł}{{\L{}}}1
           {Ś}{{\'S}}1
           {Ź}{{\'Z}}1
           {Ż}{{\.Z}}1,
    captionpos=b,
    backgroundcolor=\color{lstBackground},   
    commentstyle=\ttfamily\itshape\color{gray},
    tabsize = 4, %% set tab space width
    showstringspaces = false, %% prevent space marking in strings, string is defined as the text that is generally printed directly to the console
    numbers = left, %% display line numbers on the left
    keywordstyle = \color{blue}, %% set keyword color
    stringstyle = \color{red}, %% set string color
    rulecolor = \color{black}, %% set frame color to avoid being affected by text color
    basicstyle = \small \ttfamily , %% set listing font and size
    breaklines = true, %% enable line breaking
    numberstyle = \tiny,
}

% =============================================================================
%    SEC:   Konfiguracja tabel
% =============================================================================

\RequirePackage{array}
\RequirePackage{tabularx}
\RequirePackage{multirow}
\RequirePackage{booktabs}
\RequirePackage{makecell}
\RequirePackage[flushleft]{threeparttable}

% defines the X column to use m (\parbox[c]) instead of p (`parbox[t]`)
\newcolumntype{C}[1]{>{\hsize=#1\hsize\centering\arraybackslash}X}

% =============================================================================
%    SEC:   INNE
% =============================================================================

\newcommand{\RedefinePlainStyle}{%
	% Ponowne zdefiniowanie stylu `plain`, aby usunąć numer strony z pierwszej strony spisu treści i poszczególnych rozdziałów.
	\fancypagestyle{plain}
	{
		% Usuń nagłówek i stopkę
		\fancyhf{}
		% Usuń linie.
		\renewcommand{\headrulewidth}{0pt}
		\renewcommand{\footrulewidth}{0pt}
	}
}

\AtBeginDocument{
	\renewcommand{\tablename}{Tabela}
	\renewcommand{\figurename}{Rys.}
}

\newcommand{\trans}[1]{(\textit{#1})}


% =============================================================================
% SEC:   grafy
% =============================================================================

\tikzstyle{startstop} = [rectangle, rounded corners, minimum width=3cm, minimum height=1cm,text centered, draw=black, fill=strongorange!50]
\tikzstyle{io} = [trapezium, trapezium left angle=70, trapezium right angle=110, minimum width=3cm, minimum height=1cm, text centered, draw=black, fill=blue!30]
\tikzstyle{process} = [rectangle, minimum width=3cm, minimum height=1cm, text centered, draw=black, fill=lighteryellow!30]
\tikzstyle{decision} = [diamond, minimum width=3cm, minimum height=1cm, text centered, draw=black, fill=lightblue!50, align=center]
\tikzstyle{arrow} = [thick,->,>=stealth]
\tikzstyle{backarrow} = [thick,<-,>=stealth]


% =============================================================================
% SEC:   Kolory
% =============================================================================

\definecolor{darkgreen}{RGB}{  0 104  56}
\definecolor{lightblue}{RGB}{181 212 239}
\definecolor{strongorange}{RGB}{247 148  30}
\definecolor{lighteryellow}{RGB}{242 245 205}
\definecolor{lstBackground}{rgb}{0.95,0.95,0.90}



% =============================================================================
% SEC:   Niestandardowe środowiska
% =============================================================================

% ----------------------------------------------------------------------------
%    Środowisko do tworzenia opisów symboli użytych w równaniu
% ----------------------------------------------------------------------------

\SetLabelAlign{parright}{\parbox[t]{\labelwidth}{\raggedleft#1}}
\setlist[description]{style=multiline, topsep=10pt, align=parright}

% Odstęp po obu stronach półpauzy.
\newlength{\descriptiondashgap}
\setlength{\descriptiondashgap}{0.5em}

% Element na liście symboli matematycznych użytych w równaniu (symbol wyrównany do prawej, oddzielony półpauzą od definicji)
\renewcommand*\descriptionlabel[1]{\hspace \labelsep \normalfont \bfseries #1 \mdseries\hspace{\descriptiondashgap}--\hspace{\descriptiondashgap}}

% Odległość półpauzy od lewego marginesu.
\newlength{\eqwheremargin}
\setlength{\eqwheremargin}{2cm}

\newenvironment{eqwhere}[1][]
{%
	\setlength{\eqwheremargin}{#1}%
	\begin{description}[leftmargin=\eqwheremargin, itemsep=0cm, labelsep=0cm]
}
{\end{description}}

