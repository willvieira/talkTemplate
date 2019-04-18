ASS=$(shell find assests)
CONF=$(shell find conf)
IMG=images
IND=index

$(IND).html: $(IND).Rmd $(IMG) $(CONF) $(ASS)
	Rscript -e "rmarkdown::render('$(IND).Rmd', 'xaringan::moon_reader')"

server:
	Rscript -e "xaringan::infinite_moon_reader('$(IND).Rmd')"

pdf:
	`npm bin`/decktape --chrome-arg=--allow-file-access-from-files index.html slides.pdf

deps:
	Rscript -e 'if (!require(rmarkdown)) install.packages("rmarkdown"); if (!require(knitr)) install.packages("knitr"); if(!require(devtools)) install.packages("devtools"); if (!require(xaringan)) devtools::install_github("yihui/xaringan"); if (!require(pBrackets)) install.packages("pBrackets", dep = T); if (!require(latex2exp)) install.packages("latex2exp", dep = T)'

clean:
	rm -rf index_cache index_files index.html

.PHONY: server pdf deps clean
