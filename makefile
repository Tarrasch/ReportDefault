
SHELL = /bin/sh

DOCUMENT = Report

OPENPROGRAM = -evince

LATEXFLAGS = -shell-escape

TEMPFILES =  "*.aux" "*.toc" "*.bbl" "*.log" "*.out" "*.blg" "*.nav"  "*.mp" "*.acn" "*.acr" "*.alg" "*.glg" "*.glo" "*.gls" "*.xdy"


all: latex openprog

.PHONY: all glossaries-latex latex-then-glossaries fast presentation-make presentation-publish-make no-source-latex publish-latex glossaries fast-latex latex dual-source-latex openprog clean cleanall fpdfeps pdfeps feynman-latex

.NOTPARALLEL: %


glossaries-latex: fastlatex glossaries latex openprog

glossaries-nosource-latex: fastlatex glossaries no-source-latex openprog

fast: fastlatex openprog

presentation-make: no-source-latex openprog

presentation-publish-make: publish-latex 
	$(OPENPROGRAM) handout-$(DOCUMENT).pdf

no-source-latex:
	-pdflatex $(LATEXFLAGS) $(DOCUMENT)
	-pdflatex $(LATEXFLAGS) $(DOCUMENT)
	-pdflatex $(LATEXFLAGS) $(DOCUMENT)

publish-latex:
	pdflatex --jobname=handout-$(DOCUMENT) '\PassOptionsToClass{handout}{beamer} \input{$(DOCUMENT)}' 
	pdflatex --jobname=handout-$(DOCUMENT) '\PassOptionsToClass{handout}{beamer} \input{$(DOCUMENT)}' 
	pdflatex --jobname=handout-$(DOCUMENT) '\PassOptionsToClass{handout}{beamer} \input{$(DOCUMENT)}' 

glossaries:
	-makeglossaries $(DOCUMENT)

fastlatex:
	-pdflatex $(LATEXFLAGS) $(DOCUMENT)

latex:	
	pdflatex $(LATEXFLAGS) $(DOCUMENT)
	pdflatex $(LATEXFLAGS) $(DOCUMENT)
	bibtex $(DOCUMENT)
	pdflatex $(LATEXFLAGS) $(DOCUMENT)
	pdflatex $(LATEXFLAGS) $(DOCUMENT)
	bibtex $(DOCUMENT)
	pdflatex $(LATEXFLAGS) $(DOCUMENT)

dual-source-latex:
	-pdflatex $(LATEXFLAGS) $(DOCUMENT)
	-pdflatex $(LATEXFLAGS) $(DOCUMENT)
	bibtex $(SOURCE)
	bibtex $(PERSONAL)
	-pdflatex $(LATEXFLAGS) $(DOCUMENT)
	-pdflatex $(LATEXFLAGS) $(DOCUMENT)
	bibtex $(SOURCE)
	bibtex $(PERSONAL)
	-pdflatex $(LATEXFLAGS) $(DOCUMENT)

openprog:
	$(OPENPROGRAM) $(DOCUMENT).pdf

clean:
	-find . -type f -name "*~" -exec rm -f {} \;

cleanall: clean
	for i in $(TEMPFILES); do \
		find . -type f -name $$i -exec rm -f {} \; ; \
	done
	-find . -type f -regextype posix-extended -regex '.{1,100}\.t[1-9]{1,3}' -exec rm -f {} \;
	-find . -type f -regextype posix-extended -regex '.{1,100}\.[1-9]{1,3}' -exec rm -f {} \;


fpdfeps:
	for i in `ls fig | grep .eps`; do epstopdf fig/$$i; done
pdfeps: 
	for i in `ls fig | grep .pdf | grep -v .pdf_t`; do svn lock fig/$$i; done
	for i in `ls fig | grep .eps`; do svn lock fig/$$i; done
	for i in `ls fig | grep .eps`; do epstopdf fig/$$i; done

feynman-latex: fastlatex
	for i in $$(ls | grep .mp); do mpost $$i; done