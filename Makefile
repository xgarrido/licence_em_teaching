# -*- mode: makefile; -*-
files_org = $(wildcard td*.org)
files_pdf = $(files_org:.org=.pdf)

all: pdf

pdf: $(files_pdf)

$(files_pdf): %.pdf: %.org
	@echo "NOTICE: Exporting $< to pdf..."
	@zsh -i -c "org-pages --pdf generate"
	@zsh -i -c "org-pages --pdf generate"

clean:
	@rm -rf	latex.d *.tex *.pdf *.toc *.fdb* *~ README.el

.PHONY: all pdf clean
