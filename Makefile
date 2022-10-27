SPLT=brzdime-sezeni

default:
	lualatex mbrpra.tex
	evince mbrpra.pdf &
split: default
	pdftk mbrpra.pdf cat 5-12 output $(SPLT)-1.pdf
	pdftk mbrpra.pdf cat 13-16 output $(SPLT)-2.pdf
	pdftk mbrpra.pdf cat 17-20 output $(SPLT)-3.pdf
	pdftk mbrpra.pdf cat 21-28 output $(SPLT)-4.pdf
	pdftk mbrpra.pdf cat 29-32 output $(SPLT)-5.pdf
	pdftk mbrpra.pdf cat 33-36 output $(SPLT)-6.pdf
	pdftk mbrpra.pdf cat 37-44 output $(SPLT)-7.pdf
	pdftk mbrpra.pdf cat 45-48 output $(SPLT)-8.pdf
	pdftk mbrpra.pdf cat 1-48 output $(SPLT)-vsechno.pdf
	
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
