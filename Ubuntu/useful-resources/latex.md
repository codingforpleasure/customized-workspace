
<!--ts-->
* [Latex](#latex)
   * [Checking code in pdflatex shell (similar to repl)](#checking-code-in-pdflatex-shell-similar-to-repl)
   * [commenting lines](#commenting-lines)
   * [Define macros/functions](#define-macrosfunctions)
      * [Example of one argument](#example-of-one-argument)
      * [Example of two arguments](#example-of-two-arguments)
   * [Latex Editor](#latex-editor)
   * [foreach loop](#foreach-loop)
   * [Convert math latex into svg](#convert-math-latex-into-svg)
   * [Cropped file output in LaTeX as an output](#cropped-file-output-in-latex-as-an-output)
   * [Useful shortcuts in texStudio](#useful-shortcuts-in-texstudio)
   * [Latex to SVG](#latex-to-svg)
   * [Adding node](#adding-node)
   * [Adding an arrow between two nodes](#adding-an-arrow-between-two-nodes)
   * [Adding text above an arrow between two nodes](#adding-text-above-an-arrow-between-two-nodes)
   * [Adding arrow between two nodes with veritcal and horizontal orientation](#adding-arrow-between-two-nodes-with-veritcal-and-horizontal-orientation)
   * [Adding dashed arrow between two nodes](#adding-dashed-arrow-between-two-nodes)
   * [Geomteric Shapes in Tikz](#geomteric-shapes-in-tikz)
   * [Shapes with multiple Text Parts in tikz](#shapes-with-multiple-text-parts-in-tikz)
   * [Latex with svg in inkscape](#latex-with-svg-in-inkscape)
   * [Latex](#latex-1)
   * [LaTeX mathematical symbols](#latex-mathematical-symbols)
   * [LaTex mathematical symbols (nice)](#latex-mathematical-symbols-nice)
   * [Useful](#useful)

<!-- Created by https://github.com/ekalinin/github-markdown-toc -->
<!-- Added by: gil_diy, at: Wed 16 Nov 2022 19:59:22 IST -->

<!--te-->


# Latex

## Checking code in pdflatex shell (similar to repl)

In the terminal enter `pdflatex`.

## commenting lines

```text
% this is a comment
```

## Define macros/functions

### Example of one argument
```tex
\def\testonearg[#1]{\typeout{Testing one arg: '#1'}}
```

Now let's invoke the macro by calling `testonearg`:
```tex
\testonearg[test this]
```

**Output:** ``Testing one arg: 'test this'``


### Example of two arguments

```tex
\def\testtwoargB#1#2{\typeout{Testing two args B: '#1' and '#2'}}
```

```tex
\testtwoargB{test this first}{this is, the second test.}
```

**output:** ```Testing two args B: 'test this first' and 'this is, the second test.'```

## Latex Editor

```bash
texstudio
```
## foreach loop
```
\begin{tikzpicture}
	\foreach \x in {0,1,2,3}
		\foreach \y in {0,1,2,3}
		{
			\draw (\x,\y) circle (0.2cm);
			\fill (\x,\y) circle (0.1cm);
		}
\end{tikzpicture}
```



## Convert math latex into svg

should install
```bash
npm install -g mathjax-node
```

```bash
tex2svg '\operatorname{erf}(x) = \frac{2}{\sqrt\pi}\int_0^x e^{-t^2}\,\mathrm dt.
```

output:

<p align="center"> <!-- style="width:400px;" -->
  <img src="images/svg/example.svg" title="tool tip here">
</p>

## Cropped file output in LaTeX as an output

standalone class which will automatically produce a cropped:
```
\documentclass{standalone}
```



## Useful shortcuts in texStudio

Description | Hotkey
------------|-----
Comment out | `Ctrl+T`
Uncomment | `Ctrl+U`


## Latex to SVG

Given the following file **example.tex**:
```
\documentclass[dvisvgm]{minimal}
\usepackage{tikz}
\begin{document}
Hello \tikz [baseline] \fill [fill=blue!80!black] (0,.75ex) circle[radius=.75ex];
\end{document}
```
for exporting to svg, enter:

```bash
lualatex --output-format=dvi example
dvisvgm example
```


## Adding node
```
\tikzstyle{startstop} = [rectangle, rounded corners, minimum width=3cm, minimum height=1cm, text centered, draw=black, fill=red!30]

\begin{document}

%The nodes we use to build the blocks are automatically spaced with 2 cm apart
% from their centers.

\begin{tikzpicture}[node distance=2cm]

% We add a node with the node command, 
% the round brackets are for adding a name for the node so we can easily 
% refer to the node in the rest of the code.
% 
\node(start) [startstop] {Start};
```

**Syntax is:**
\node(my-node-name) [the-tikz-style] {Actual text in node};

## Adding an arrow between two nodes

```
\draw[arrow]  (my_process1) -- (my_process2);
```
## Adding text above an arrow between two nodes

```
\draw[arrow]  (my_process1) --node{yes} (my_process2);
```
## Adding arrow between two nodes with veritcal and horizontal orientation

```
\draw[my_arrow, rounded corners]  (my_process2) |- (my_process1); 
```

## Adding dashed arrow between two nodes

```
\draw[my_arrow, dashed]  (my_process1) -- (my_process2);
```

## Geomteric Shapes in Tikz

You should make include: `\usetikzlibrary{shapes.geometric}`

Great reference in pdf file, the chapter name is: **71.3 Geometric Shapes**

Tha available shapes are:

* diamond

* ellipse

* trapezium

* semicircle

* regular polygon

* star

* isosceles triangle

* kite

* dart

* circular sector

* cylinder


## Shapes with multiple Text Parts in tikz

You should make include: `\usetikzlibrary{shapes.multipart}`

* circle split

* circle solidus

* ellipse split

* rectangle split





## Latex with svg in inkscape
[Link](https://tex.stackexchange.com/questions/61274/is-there-any-way-to-type-latex-code-directly-into-the-text-boxes-inkscape)

## Latex 

[Link](https://www.codecogs.com/latex/eqneditor.php)

## LaTeX mathematical symbols
[Link](https://oeis.org/wiki/List_of_LaTeX_mathematical_symbols)


## LaTex mathematical symbols (nice)

[Link](https://latex.wikia.org/wiki/List_of_LaTeX_symbols)

## Useful
[Plot Neural Networks with Latex](https://github.com/HarisIqbal88/PlotNeuralNet)



[fragment of Python source code to a latex](https://github.com/google/latexify_py)

