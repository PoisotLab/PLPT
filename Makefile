TEXMFHOME = $(shell kpsewhich -var-value=TEXMFHOME)
INSTALL_DIR = $(TEXMFHOME)/tex/latex/pltheme
FILE=slides
OUTPUT=$(FILE)_final.pdf

.DEFAULT: $(OUTPUT)
.PHONY: clean install

$(FILE).md: $(FILE).Jmd
	julia -e 'using Weave; weave("$<", doctype="pandoc")'

$(FILE).tex: $(FILE).md
	pandoc $< -t beamer --slide-level 2 -o $@ --template ./template/pl.tex --highlight-style pygments

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
