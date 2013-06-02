
SHELL = /bin/sh

DOCUMENT = Report

OPENPROGRAM = -evince

LATEXFLAGS = --shell-escape

all: latex openprog


fast: fastlatex openprog

presentation-make: no-source-latex openprog

presentation-publish-make: publish-latex 
	$(OPENPROGRAM) handout-$(DOCUMENT).pdf

no-source-latex:
	-pdflatex --shell-escape $(DOCUMENT)
	-pdflatex --shell-escape $(DOCUMENT)
	-pdflatex --shell-escape $(DOCUMENT)

publish-latex:
	pdflatex --jobname=handout-$(DOCUMENT) '\PassOptionsToClass{handout}{beamer} \input{$(DOCUMENT)}' 
	pdflatex --jobname=handout-$(DOCUMENT) '\PassOptionsToClass{handout}{beamer} \input{$(DOCUMENT)}' 
	pdflatex --jobname=handout-$(DOCUMENT) '\PassOptionsToClass{handout}{beamer} \input{$(DOCUMENT)}' 

fastlatex:
	-pdflatex -shell-escape $(DOCUMENT)

latex:	
	pdflatex -shell-escape $(DOCUMENT)
	pdflatex -shell-escape $(DOCUMENT)
	bibtex $(DOCUMENT)
	pdflatex -shell-escape $(DOCUMENT)
	pdflatex -shell-escape $(DOCUMENT)
	bibtex $(DOCUMENT)
	pdflatex -shell-escape $(DOCUMENT)

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
	-find . -type f -name "*.aux" -exec rm -f {} \;
	-find . -type f -name "*.toc" -exec rm -f {} \;
	-find . -type f -name "*.bbl" -exec rm -f {} \;
	-find . -type f -name "*.log" -exec rm -f {} \;
	-find . -type f -name "*.out" -exec rm -f {} \;
	-find . -type f -name "*.blg" -exec rm -f {} \;
	-find . -type f -name "*.nav" -exec rm -f {} \;
	-find . -type f -regextype posix-extended -regex '.{1,100}\.t[1-9]{1,3}' -exec rm -f {} \;
	-find . -type f -name "*.mp" -exec rm -f {} \;
	-find . -type f -regextype posix-extended -regex '.{1,100}\.[1-9]{1,3}' -exec rm -f {} \;


fpdfeps:
	for i in `ls fig | grep .eps`; do epstopdf fig/$$i; done
pdfeps: 
	for i in `ls fig | grep .pdf | grep -v .pdf_t`; do svn lock fig/$$i; done
	for i in `ls fig | grep .eps`; do svn lock fig/$$i; done
	for i in `ls fig | grep .eps`; do epstopdf fig/$$i; done

feynman-latex: fastlatex
	for i in $$(ls | grep .mp); do mpost $$i; done