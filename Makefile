FILES = *.md
PANDOC = pandoc -s 
CSS =screen.css

html: ${FILES} Makefile 
	${PANDOC} -5 --section-divs -c ${CSS} -o out/605.html 605.md

odt: ${FILES} Makefile
	${PANDOC} -s -t odt -o out/${OUTFN}.odt ${FILES}

pdf: ${FILES} Makefile
	${PANDOC} -t latex --template templates/latex.tmpl -o out/605.tex 605.md
	cd out; lualatex 605.tex; rm *.{aux,out,log,tex}; cd ..

all: html odt 
