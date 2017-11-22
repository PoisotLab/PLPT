TEXMFHOME = $(shell kpsewhich -var-value=TEXMFHOME)
INSTALL_DIR = $(TEXMFHOME)/tex/latex/pltheme
FILE=slides
OUTPUT=$(FILE)_final.pdf

all: $(OUTPUT)

background.png: makebackground.jl
	julia $<

.PHONY: clean install

rmd2md: $(wildcard $(FILE).Rmd)
	@$(if $(wildcard $(FILE).Rmd),Rscript -e "library(knitr); knit(input='$<', output='$(SOURCE)')",echo "No Rmd file found")

jmd2md: $(wildcard $(FILE).Jmd)
	@$(if $(wildcard $(FILE).Jmd),julia -e 'using Weave; weave("$<", doctype="pandoc")',echo "No Jmd file found")

$(FILE).md: jmd2md rmd2md

$(FILE).tex: $(FILE).md
	pandoc $< -t beamer --slide-level 2 -o $@ --template ./template/pl.tex

$(FILE).pdf: $(FILE).tex
	latexmk

$(OUTPUT): $(FILE).pdf
	cp $< $@

clean:
	latexmk	-c
	rm *.{vrb,nav,snm}

install:
	mkdir -p $(INSTALL_DIR)
	cp *.sty $(INSTALL_DIR)
