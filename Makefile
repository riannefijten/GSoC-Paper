all: document.pdf
	@echo "********* Latex Summary *********"
	@grep -i error document.log || true
	@grep -i warning document.log || true

update: document.pdf

document.bbl: document.bib
	pdflatex document || true
	bibtex document || true

document.pdf: document.tex document.bbl
	pdflatex document.tex
	pdflatex document.tex
	pdflatex document.tex

distclean: clean

clean:
	rm -f *.bbl *.aux document.pdf *.blg *.log *.ps *.fff *.lof *.lot *.ttt *.dvi *~ *.Rout *-blx.bib
