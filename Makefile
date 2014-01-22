# -*- mode: makefile; -*-
EMACS=emacs --batch --no-init-file						\
--eval "(require 'org)"								\
--eval "(org-babel-do-load-languages 'org-babel-load-languages '((sh . t)))"	\
--eval "(setq org-confirm-babel-evaluate nil)"					\
--eval '(org-babel-load-file "README.org")'					\
--eval '(org-babel-tangle-file "README.org")'

files_org = $(wildcard td*.org)
files_pdf = $(files_org:.org=.pdf)

all: pdf

pdf: $(files_pdf)

$(files_pdf): %.pdf: %.org README.org
	@echo "NOTICE: Exporting $< to pdf..."
	@TEXINPUTS="./latex.d:$$TEXINPUTS" $(EMACS) --visit "$<" --funcall em-export-classes
#> /dev/null 2>&1

clean:
	@rm -rf	latex.d *.tex *.pdf *.toc *.fdb* *~ README.el

.PHONY: all pdf clean
