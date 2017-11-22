---
title: Title
subtitle: Subtitle
author: Timothée Poisot
institute: Université de Montréal
date: \today
---

## A slide

~~~~{.julia}
A = rand((3,3))
sum(A)
~~~~~~~~~~~~~


~~~~
5.24813268142187
~~~~





# Plots

## Setting things up

~~~~{.julia}
using Plots
pyplot()
~~~~~~~~~~~~~


~~~~
Plots.PyPlotBackend()
~~~~





## Columns

\begincols
\column{0.48\textwidth}

~~~~{.julia}
p1 = plot(
  # These are the data
  sort(rand(40)),
  # This is the plot size
  size  = (250, 200),
  # We don't want borders
  frame = :grid,
  # We don't want a legend
  leg   = false
  );
savefig(p1, "figures/scatter.pdf");
~~~~~~~~~~~~~





\hfill\column{0.48\textwidth}

\includegraphics[width=\columnwidth]{figures/scatter.pdf}

\stopcols

## Output

Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac
turpis egestas. Morbi sollicitudin nisi vitae lorem interdum, eget elementum
quam elementum. Curabitur quis leo eu metus consequat ultricies. Curabitur sit
amet convallis risus. Cras vel arcu id risus efficitur commodo et eget velit.
Curabitur consequat eleifend magna, ut ultricies lorem scelerisque eu. Mauris
faucibus neque sit amet est elementum, suscipit placerat est interdum. Phasellus
sed convallis est. Nunc fermentum convallis odio eget gravida. Duis venenatis
dictum tempor.

# Some code

## Default plotting
