---
title: Jmd conversion
subtitle: It just works
author: Timothée Poisot
institute: LOLOLOL
date: \today
---

## How to compile

This is the code we need

~~~
julia -e 'using Weave; weave("slides.Jmd", doctype="pandoc")'
pandoc slides.md -t beamer
  --slide-level 2
  -o slides.tex
  --template ./template/pl.tex
  --highlight-style pygments
latexmk
~~~

## Using packages

~~~~{.julia}
using StatsBase
~~~~~~~~~~~~~





## Columns

\begincols
\column{0.3\textwidth}

You can have columns: 4

\column{0.7\textwidth}

~~~~{.julia}
n = 3
A = zeros(Int64, (n, n))
for i in 1:n
  A[i,i] = i
end
A
~~~~~~~~~~~~~


~~~~
3×3 Array{Int64,2}:
 1  0  0
 0  2  0
 0  0  3
~~~~





\stopcols

# Some figures

## Figures

\begincols
\column{0.35\textwidth}

~~~~{.julia}
using Plots
pgfplots()
p1 = plot(rand(10),
  size=(250,200),
  lab="")
plot!(p1, rand(10), c=:red);
xaxis!(p1, "Position");
yaxis!(p1, "Random value");
savefig(p1, "figures/test1.tex");
~~~~~~~~~~~~~





\hfill\column{0.55\textwidth}

\input{figures/test1.tex}

\stopcols

## Output



# Some code