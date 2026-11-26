\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{thesis}
\LoadClass[12pt]{scrartcl}


\RequirePackage{amsmath, amssymb, graphicx, mathtools} %
\RequirePackage{amsthm, thmtools}
\RequirePackage{geometry}
\RequirePackage{pgfornament}
\RequirePackage[english]{babel}
\RequirePackage{enumitem}
\RequirePackage{csquotes}
\RequirePackage{microtype}
\RequirePackage[most]{tcolorbox}
\RequirePackage{xcolor}

\graphicspath{{Bilder/}{img/}}

\MakeOuterQuote{"}
\setlength\parindent{0pt}


% ----------------------------------------
%         Argumente der Classfile
% ----------------------------------------

\RequirePackage{kvoptions}
\SetupKeyvalOptions{prefix=}
\DeclareBoolOption[false]{print}
\ProcessKeyvalOptions*

% ----------------------------------------
%            Druck oder Digital
% ----------------------------------------

\ifprint
	\geometry{
		a4paper,
		twoside,
		includeheadfoot,
		inner=32mm,
		outer=26mm,
		top=26mm,
		bottom=26mm,
		bindingoffset=10mm
	}
\else
	\geometry{
		top=40pt,
		left=40pt,
		right=40pt
	}
\fi

% ----------------------------------------
%                 Formate
% ----------------------------------------

\newtheoremstyle{satz}%
{3pt}%
{3pt}%
{}%
{}%
{\bfseries}%
{}%
{\newline}%
{\thmname{#1}\thmnumber{ #2}\thmnote{ --- #3}}%

% Unnumbered style; the counter is decremented so these environments
% share intern:theorem without consuming a number.
\newtheoremstyle{definition}%
{3pt}%
{3pt}%
{}%
{}%
{\bfseries}%
{}%
{.5em}%
{\thmname{#1}\addtocounter{intern:theorem}{-1}\thmnote{ --- #3}\\}%

\theoremstyle{satz}
\newtheorem{intern:theorem}{Theorem}[section]
\newtheorem{intern:lemma}[intern:theorem]{Lemma}
\newtheorem{intern:observation}[intern:theorem]{Observation}
\newtheorem{intern:remark}[intern:theorem]{Remark}
\newtheorem{intern:corollary}[intern:theorem]{Corollary}
\newtheorem{intern:satz}[intern:theorem]{Satz}
\newtheorem{intern:korollar}[intern:theorem]{Korollar}
\newtheorem{intern:proposition}[intern:theorem]{Proposition}
\newtheorem{intern:hauptsatz}[intern:theorem]{Hauptsatz}
\newtheorem{intern:vermutung}[intern:theorem]{Vermutung}

\theoremstyle{definition}
\newtheorem{intern:definition}[intern:theorem]{Definition}
\newtheorem{intern:bemerkung}[intern:theorem]{Bemerkung}
\newtheorem{intern:aufgabe}[intern:theorem]{Aufgabe}

% ----------------------------------------
%                  Farben
% ----------------------------------------

\definecolor{primary}{RGB}{0,0,0}
\definecolor{secondary}{RGB}{0,0,0}
\definecolor{basic}{RGB}{0,0,0}
\definecolor{highlight}{RGB}{0,0,0}

% ----------------------------------------
%          Stile und Environments
% ----------------------------------------

\tcbset{
	thmbox/.style={
		enhanced,
		breakable,
		colback=white,
		boxrule=0pt,
		colframe=white,
		borderline west={2.5pt}{0pt}{#1},
		sharp corners,
		before skip=15pt,
		after skip=15pt
	},
	theorem/.style={thmbox=primary},
	satz/.style={thmbox=primary},
	hauptsatz/.style={thmbox=primary},
	lemma/.style={thmbox=secondary},
	observation/.style={thmbox=secondary},
	remark/.style={thmbox=secondary},
	corollary/.style={thmbox=secondary},
	korollar/.style={thmbox=secondary},
	proposition/.style={thmbox=secondary},
	bemerkung/.style={thmbox=secondary},
	definition/.style={thmbox=basic},
	vermutung/.style={thmbox=highlight},
	aufgabe/.style={thmbox=highlight},
}

\newcommand{\DeclareBoxedEnv}[1]{%
	\newenvironment{#1}%
	{\begin{tcolorbox}[#1]\begin{intern:#1}}%
	{\end{intern:#1}\end{tcolorbox}}%
}

\makeatletter
\@for\env:=%
theorem,lemma,observation,remark,corollary,satz,korollar,proposition,hauptsatz,vermutung,definition,bemerkung,aufgabe%
\do{
	\expandafter\DeclareBoxedEnv\expandafter{\env}
}
\makeatother

% ----------------------------------------
%                 Commands
% ----------------------------------------

\newcommand\highlight[1]{%
{\bf\color{highlight}#1}%
}

\newcommand\fancytrenner[1]{
\begin{center}
\begin{tikzpicture}
	\node[yscale=0.7, basic] at (0,1) {\pgfornament[width=0.98\textwidth]{88}};
\node[basic, fill=white] (text) at (0,0) {\Large #1};
\node[yscale=0.7, basic] at (0,-1) {\pgfornament[width=0.98\textwidth]{88}};
\end{tikzpicture}
\end{center}
}

\newcommand\prependix{
\pagenumbering{gobble}
}

\newcommand\content{
\pagenumbering{fancy}
}
