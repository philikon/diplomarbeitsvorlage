all: Diplomarbeit.pdf

Diplomarbeit.aux: Diplomarbeit.tex Kapitel/*.tex
	latex Diplomarbeit.tex

Diplomarbeit.dvi: Diplomarbeit.aux
	bibtex Diplomarbeit
	latex Diplomarbeit.tex

Diplomarbeit.pdf: Diplomarbeit.dvi
	dvipdfm Diplomarbeit.dvi