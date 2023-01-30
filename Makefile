SPLT=brzdime-sezeni
COMBASE=brzdime

default:
	lualatex mbrpra.tex
	evince mbrpra.pdf &
split: default
	pdftk mbrpra.pdf cat 3-7 output $(SPLT)-1.pdf
	pdftk mbrpra.pdf cat 9-12 output $(SPLT)-2.pdf
	pdftk mbrpra.pdf cat 13-14 output $(SPLT)-3.pdf
	pdftk mbrpra.pdf cat 15-18 output $(SPLT)-4.pdf
	pdftk mbrpra.pdf cat 19-21 output $(SPLT)-5.pdf
	pdftk mbrpra.pdf cat 23-24 output $(SPLT)-6.pdf
	pdftk mbrpra.pdf cat 25-31 output $(SPLT)-7.pdf
	pdftk mbrpra.pdf cat 33-35 output $(SPLT)-8.pdf
	pdftk mbrpra.pdf cat 1-35 output $(COMBASE)-komplet.pdf
	pdftk mbrpra.pdf cat 37 output $(COMBASE)-zaznam.pdf
	pdftk mbrpra.pdf cat 38 output $(SPLT)-1-ex.pdf
	pdftk mbrpra.pdf cat 39 output $(SPLT)-4-ex.pdf
	pdftk mbrpra.pdf cat 40 output $(SPLT)-7-ex.pdf
	
book:
	pdfbook2 --paper a4paper --no-crop --short-edge -i0 -i0 -t0 -b0 mbrpra.pdf
	# the only thing we need pdfbook2 for is --short-edge
	# pdfjam --landscape --suffix book mbrp-handouts.pdf --booklet true --paper a4paper
	evince mbrpra-book.pdf
html:
	plastex --save-image-file --split-level=0 mbrpra.tex
	firefox mbrpra/index.html &
md:
	pandoc -f markdown -o starter.html -t html starter.md
	pandoc -f markdown -o starter.md-php -t markdown_phpextra starter.md
	# firefox starter.html &
