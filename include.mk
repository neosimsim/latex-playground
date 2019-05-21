.POSIX:
.SUFFIXES: .tex .pdf

.tex.pdf:
	pdflatex $*
	if grep -q 'Please (re)run Biber on the file:' $*.log; then biber $*; pdflatex $*; fi
	if grep -q 'LaTeX Warning: There were undefined references.' $*.log; then pdflatex $*; fi

TEXOBJ = \
	*.aux \
	*.bbl \
	*.bcf \
	*.blg \
	*.log \
	*.out \
	*.pdf \
	*.run.xml \
	*.toc \
