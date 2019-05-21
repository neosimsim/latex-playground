.POSIX:
.SUFFIXES: .tex .pdf

TEX=pdflatex
TEXFLAGS=--interaction errorstop-mode

.tex.pdf:
	$(TEX) $(TEXFLAGS) $*
	if grep -q 'Please (re)run Biber on the file:' $*.log; then biber $*; $(TEX) $(TEXFLAGS) $*; fi
	if grep -q 'LaTeX Warning: There were undefined references.' $*.log; then $(TEX) $(TEXFLAGS) $*; fi

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
