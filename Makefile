default:
	lualatex mbrp-handouts.tex
	evince mbrp-handouts.pdf &
book:
	pdfbook2 --paper a4paper --no-crop --short-edge -i0 -i0 -t0 -b0 mbrp-handouts.pdf
	# the only thing we need pdfbook2 for is --short-edge
	# pdfjam --landscape --suffix book mbrp-handouts.pdf --booklet true --paper a4paper
	evince mbrp-handouts-book.pdf
html:
	plastex --save-image-file --split-level=0 mbrp-handouts.tex
	firefox mbrp-handouts/index.html &
