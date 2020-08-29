
<!--ts-->
   * [Latex](#latex)
      * [Latex Editor](#latex-editor)
      * [Convert math latex into svg](#convert-math-latex-into-svg)
      * [Useful shortcuts in texStudio](#useful-shortcuts-in-texstudio)
      * [Latex to SVG](#latex-to-svg)
      * [Adding node](#adding-node)
      * [Latex with svg in inkscape](#latex-with-svg-in-inkscape)
      * [Latex](#latex-1)
      * [LaTeX mathematical symbols](#latex-mathematical-symbols)
      * [LaTex mathematical symbols (nice)](#latex-mathematical-symbols-nice)
      * [Useful](#useful)

<!-- Added by: gil_diy, at: 2020-08-29T10:30+03:00 -->

<!--te-->


# Latex

## Latex Editor

```bash
texstudio
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


## Latex with svg in inkscape
[Link](https://tex.stackexchange.com/questions/61274/is-there-any-way-to-type-latex-code-directly-into-the-text-boxes-inkscape)

## Latex 

[Link](https://www.codecogs.com/latex/eqneditor.php)

## LaTeX mathematical symbols
[Link](https://oeis.org/wiki/List_of_LaTeX_mathematical_symbols)


## LaTex mathematical symbols (nice)

[Link](https://latex.wikia.org/wiki/List_of_LaTeX_symbols)

## Useful
[Great ](https://youtu.be/4u8FxNEDUeg)