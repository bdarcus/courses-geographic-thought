FILES = *.md
PANDOC = pandoc -s 
CSS =screen.css

html: ${FILES} Makefile 
	${PANDOC} -5 --section-divs -c ${CSS} -o out/605.html 605.md

odt: ${FILES} Makefile
	${PANDOC} -s -t odt -o out/${OUTFN}.odt ${FILES}

pdf: ${FILES} Makefile
	${PANDOC} -t latex --template templates/latex.tmpl -o out/605.tex 605.md
	${PANDOC} -t latex --template templates/latex.tmpl -o out/605-syllabus.tex 605-syllabus.md
	${PANDOC} -t latex --template templates/latex.tmpl -o out/605-issues.tex 605-issues.md
	cd out; lualatex 605.tex; lualatex 605-syllabus.tex; lualatex 605-issues.tex; rm *.{aux,out,log,tex}; cd ..

all: html odt 
