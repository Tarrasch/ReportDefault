
SHELL = /bin/sh

DOCUMENT = Report

OPENPROGRAM = -evince

all: latex openprog


fast: fastlatex openprog

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


fpdfeps:
	for i in `ls fig | grep .eps`; do epstopdf fig/$$i; done
pdfeps: 
	for i in `ls fig | grep .pdf | grep -v .pdf_t`; do svn lock fig/$$i; done
	for i in `ls fig | grep .eps`; do svn lock fig/$$i; done
	for i in `ls fig | grep .eps`; do epstopdf fig/$$i; done
