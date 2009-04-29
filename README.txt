Hinweise
========

Diese Diplomarbeitsvorlage wurde ursprünglich vom FSR Physik
bereitgestellt und von mir für meine Diplomarbeit angepasst.  Ich gebe
hiermit im Prinzip also nur meine Tipps und Tricks weiter, ohne den
Anspruch zu erheben, eine formal und technisch komplette Vorlage
bereitzustellen.


Unterschiede zur FSR-Vorlage
----------------------------

* Zweiseitiger Druck mit entsprechend angepassten Rändern und
  Kopfzeilen.

* Times statt Computer Modern als Schrift

* Keine Einrückung am Anfang eines Absatzes

* Anpassung der Silbentrennungsparameter

* Nummerierung von Tabelle, Abbildungen und Gleichungen nach dem
  Schema ``kapitel.lfd-nr`` statt ``kapitel.abschnitt.lfd-nr``

* Beispiele zum Zeichnen von Feynman-Graphen


dvipdfm als LaTeX-Treiber
-------------------------

Als Kompromiss zwischen dem reinen PDF-Treiber ``pdflatex`` und dem
Umweg über PostScript mittels ``dvips`` bzw. ``dvipdf`` (beide sind
nicht zu empfehlen!) empfiehlt sich ``dvipdfm``.  Er wandelt die
DVI-Daten direkt in PDF um.  Damit entstehen qualitativ bessere
PDF-Dateien, in denen z.B. Inhaltsverzeichnis und Querverweise noch
navigierbar sind (dank ``hyperref``-Paket).

dvipdfm kann allerdings keine EPS-Dateien o.ä. einbinden.  Bei mir hat
sich als vorteilhaft herausgestellt, sämtliche Abbildungen als PDF
vorzuhalten.  Gnuplot beispielsweise kann ohne Probleme PDF ausgeben.
Die PDF-Dateien müssen in der PDF-Version 1.2 vorliegen, höhere
Versionen kann dvipdfm leider nicht bearbeiten.  Man kann allerdings
"schummeln" und PDF-Dateien einfach nachträglich als Version 1.2
deklarieren, indem man den PDF-Header ändert.  In jedem Fall benötigt
dvipdfm Informationen über die "bounding box", die sich mit dem
Programm ``ebb`` erzeugen lassen.  Siehe dazu
http://www.tex.ac.uk/cgi-bin/texfaq2html?label=dvipdfmgraphics.


Makefile
--------

Um die verschiedenen Arbeitsschritte beim Generieren des PDFs zu
automatisieren, liegt der Vorlage ein Makefile für GNU make bei.
Damit reicht ein Aufruf von ``make`` auf, um LaTeX, BibTeX und dvipdfm
in der richtigen Reihenfolge aufzurufen.


Feynman-Diagramme mit feynMF
----------------------------

Das Paket feynMF erlaubt es, Feynman-Diagramme in LaTeX zu zeichnen.
Es generiert wahlweise Metafont- oder MetaPost-Dateien, die ihrerseits
wiederum ins LaTeX-Dokument eingebunden werden.  Dieser Vorlage liegt
``feynmp.sty`` bei, das auf MetaPost aufbaut.  Dazu gehört
``feynmp.mp``, worin sämtliche zu feynMF gehörenden MetaPost-Routinen
definiert sind.  Es handelt sich dabei um von mir leicht modifizierte
Versionen.  Mit diesen Modifikationen ist es möglich,
Vertexdekorationen mit beliebigen Liniendicken zu malen.  Das erlaubt
z.B. das Malen eines dicken Kreuzes an einem Vertex, um einen
Counterterm zu kennzeichen.

Das Makefile ist bereits für die MetaPost-Dateien angepasst.  Falls
Feynman-Diagramme nicht benötigt werden, können die entsprechenden
Zeilen einfach entfernt werden.
