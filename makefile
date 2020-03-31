CONF=$(shell find conf)
IMG=images
IND=index

$(IND).html: $(IND).Rmd $(IMG) $(CONF)
	Rscript -e "rmarkdown::render('$(IND).Rmd', 'xaringan::moon_reader')"

server:
	Rscript -e "xaringan::infinite_moon_reader('$(IND).Rmd')"

pdf:
	`npm bin`/decktape --chrome-arg=--allow-file-access-from-files index.html slides.pdf

install:
	Rscript -e 'if (!require(remotes)) install.packages("remotes"); if (!require(rmarkdown)) install.packages("rmarkdown"); if (!require(knitr)) install.packages("knitr"); if (!require(xaringan)) remotes::install_github("yihui/xaringan"); if (!require(emo)) remotes::install_github("hadley/emo"); if (!require(DT)) remotes::install_github("rstudio/DT")'

clean:
	rm -rf index_cache index_files index.html

.PHONY: server pdf install clean
