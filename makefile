S=slides

all: $S.pdf

$S.pdf: *.tex elastic.sty makefile imgs/*
	latexmk -bibtex -enc -etex -e '$$latex=q/xelatex %O -shell-escape %S/' $S.tex

watch:
	latexmk -pvc -bibtex -enc -etex -e '$$latex=q/xelatex %O -shell-escape %S/' $S.tex



check: *.tex
	for tex in $$(find . -name "*.tex"); do aspell -l en -c -t $$tex ; echo "Done checking $$tex" ; 	done

clean:
	rm -f *.aux *.toc *. *.bbl *.blg *.log *.nav *.out *.snm *.vrb *_latexmk *.fls *.pyg
