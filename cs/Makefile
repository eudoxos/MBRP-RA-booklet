SPLT=brzdime-sezeni
COMBASE=brzdime
SHEET1=38 38 39 39 40 37
SHEETLOG6=37 37 37 37 37 37

.PHONY: print

#exex1:
#	pdftk mbrpra.pdf cat 38 38 38 38 output $(SPLT)-1-exex.pdf
#brzda:
#	pdftk mbrpra.pdf cat 5 5 output $(SPLT)-1-brzda.pdf

neo2023:
	pdfjam mbrpra.pdf 12,35 --nup 2x1 --landscape --outfile 2023-slovni-zasoba-pocity-potreby.pdf

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
print:
	#lualatex mbrpra.tex && lualatex mbrpra.tex && lualatex mbrpra.tex
	#pdftk mbrpra.pdf cat 38 38 output print/brzdime-letak-1-100ks.pdf
	#pdftk mbrpra.pdf cat 39 39 output print/brzdime-letak-2-100ks.pdf
	#pdftk mbrpra.pdf cat 40 37 output print/brzdime-letak-3-100ks.pdf
	#pdftk mbrpra.pdf cat 37 37 output print/brzdime-letak-4-300ks.pdf
	gs -sOutputFile=mbrpra-grey.pdf -sDEVICE=pdfwrite -sColorConversionStrategy=Gray -dProcessColorModel=/DeviceGray -dCompatibiltyLevel=1.4 -dNOPAUSE -dBATCH mbrpra.pdf
	pdftk mbrpra-grey.pdf cat 1-36 output print/brzdime-booklet-vnitrek.pdf
gray:
	gs -sOutputFile=print/brzdime-booklet-vnitrek.gray.pdf -sDEVICE=pdfwrite -sColorConversionStrategy=Gray -dProcessColorModel=/DeviceGray -dCompatibiltyLevel=1.4 -dNOPAUSE -dBATCH print/brzdime-booklet-vnitrek.pdf
	
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
