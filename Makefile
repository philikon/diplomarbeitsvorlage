all: Diplomarbeit.pdf

### feynMF-spezifische Regeln.  Können entfernt werden, wenn
### Feynman-Diagramme nicht benötigt werden.

MPFILES := $(foreach file, $(basename $(wildcard Feynman/*mp)), $(file).1)

# Don't try to compile feynmp.mp
Feynman/feynmp.1:
	true

Feynman/%.1: Feynman/%.mp
	cd Feynman && mpost $*

### Ende feynMF-spezifische Regeln

Diplomarbeit.aux: Diplomarbeit.tex Kapitel/*.tex Bilder/* $(MPFILES)
	latex Diplomarbeit.tex

Diplomarbeit.dvi: Diplomarbeit.aux
	bibtex Diplomarbeit
	latex Diplomarbeit.tex

Diplomarbeit.pdf: Diplomarbeit.dvi
	dvipdfm Diplomarbeit.dvi
