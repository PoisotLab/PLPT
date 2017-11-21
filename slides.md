---
title: EcologicalNetwork.jl
subtitle: Analysis of ecological interactions
author: Timothée Poisot
institute: Université de Montréal
date: \today
---

## The `EcologicalNetwork` package

~~~~{.julia}
using EcologicalNetwork
data = ollerton();

η(data)
~~~~~~~~~~~~~


~~~~
3-element Array{Float64,1}:
 0.640955
 0.646288
 0.635621
~~~~





# Visualising networks

## Setting up the environment

~~~~{.julia}
using Plots
pgfplots()
~~~~~~~~~~~~~


~~~~
Plots.PGFPlotsBackend()
~~~~





## Default plotting

\begincols
\column{0.48\textwidth}

~~~~{.julia}
p1 = plot(data, size=(250, 100));
savefig(p1, "figures/ollerton.tex");
~~~~~~~~~~~~~





\hfill\column{0.48\textwidth}

\input{figures/ollerton.tex}

\stopcols

## Output

# Some code

## Default plotting
