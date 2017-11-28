---
title: Beamer template
subtitle: Using pandoc, knitr, Weave, etc...
author: Timothée Poisot
institute: Université de Montréal
date: \today
---

## Main goals

1. Easy generation of slides
2. Integration with `R` and `Julia`
3. Looks nice

## Fonts and spacing

The document uses the \alert{Noto} family -- <https://www.google.com/get/noto/>

Main body
: Noto Sans (or Serif)

Maths
: $\text{Noto Sans}$

Code
: `Noto Mono`

The linespread value has been increased to about $1.3$

## Serif font theme

The default font theme is sans serif. You can change the `template/pl.tex` first line to:

~~~ latex
@@ -1,4 +1,4 @@
-\documentclass[11pt, compress, aspectratio=1610]{beamer}
+\documentclass[11pt, compress, aspectratio=1610, serif]{beamer}

\usetheme{pl}
~~~

## Colors

The structure elements are in green, inline code is in `blue`, and alerted text
in \alert{orange}.

The background is off-white: it will *look* like it's white, but with less
eyestrain.

The foreground is not-quite-black either.

## Tables

| PID   | COMMAND        | %CPU | TIME     | #TH |
|:------|:---------------|-----:|:---------|:---:|
| 25645 | `top`          | 16.3 | 00:02.03 | 1/1 |
| 25642 | `bash`         |  0.0 | 00:00.01 |  1  |
| 25641 | `login`        |  0.0 | 00:00.02 |  2  |
| 25634 | `mdworker`     |  0.0 | 00:00.07 |  3  |
| 25624 | `mdworker`     |  0.0 | 00:00.14 |  4  |
| 25591 | `mdworker`     |  0.0 | 00:00.14 |  3  |
| 25571 | `com.apple.iC` |  0.0 | 00:00.31 |  5  |
| 25414 | `installd`     |  0.0 | 00:00.52 |  2  |
| 25366 | `com.apple.We` |  0.0 | 00:00.07 |  4  |

## Using images

\includegraphics[width=\textwidth]{figures/density.pdf}

## Maths

The Input family of fonts has some support for Greek and mathematical symbols:

$$
\frac{1}{N}\frac{\text{d}}{\text{d}t}N = N\left(r-\alert{\alpha N}\right)
$$

You can use `\alert` within math blocks.

# Using sections

## Section titles

Every section will have a small band with the background image.

They are first-level headers in markdown:

~~~ md
# Section

## Slide-title

Slide content
~~~

## Code highlighting

There is a customized color scheme for code highlighting.

~~~ julia
α = 2.0
b, c = "abc", 'c'
# This code does nothing (useful)
for i in 1:10
  rand()
  @elapsed println("i:\t$i")
end
~~~

We can also use \alert{unicode characters}.

## Visual counter

The circle next to the title of each slide moves forward at every slide
(including the section changes).

It is a useful visual key for how much slides are left.

## Output

Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac
turpis egestas. Morbi sollicitudin nisi vitae lorem interdum, eget elementum
quam elementum. Curabitur quis leo eu metus consequat ultricies. Curabitur sit
amet convallis risus. Cras vel arcu id risus efficitur commodo et eget velit.
Curabitur consequat eleifend magna, ut ultricies lorem scelerisque eu. Mauris
faucibus neque sit amet est elementum, suscipit placerat est interdum. Phasellus
sed convallis est. Nunc fermentum convallis odio eget gravida. Duis venenatis
dictum tempor.

## Background image

The background image is generated from the `makebackground.jl` file. It's the
k-nearest neighbour graph of a series of random points.

The file is `background.png` -- it can be replaced by any file \alert{as long
as} the replacement file is in the 16:10 format (for example, a 1600 $\times$
1000 image).

## Final slide

The final slide displays the background picture.

This is to avoid the awkward "Switching to black" thing that happens when there
are no slides left.

# Reproducible documents

## It's in the Makefile

Documents `slides.Jmd` and `slides.Rmd` will be detected.

They will be converted to `slides.md` using either `R`/`knitr` or `Julia`/`Weave.jl`.

# Specific commands

## Cropped images

\begincols
\column{0.68\textwidth}

The `roundpicture` command will display a picture, resized to fit into a circle:

~~~ latex
\roundpicture{images/nb.png}{Optional text}
~~~

Note that the image \alert{must} be a square.

\hfill\column{0.28\textwidth}

\roundpicture{images/nb.png}{}

\stopcols

## Plain slide

This will create a plain slide:

~~~ markdown
## {.plain}

\plain{This is large text on the background image.}
~~~

Note that the text within the `\plain` command \alert{must be \LaTeX}.

## {.plain}
\plain{This is large text on the background image.}
