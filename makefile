CONF=$(shell find conf)
IMG=images
IND=index

$(IND).html: $(IND).Rmd $(IMG) $(CONF)
	Rscript -e "rmarkdown::render('$(IND).Rmd', 'xaringan::moon_reader')"

server:
	Rscript -e "xaringan::infinite_moon_reader('$(IND).Rmd')"

pdf:
	Rscript -e "pagedown::chrome_print(input = 'index.html', output = 'slides.pdf')"

install:
	Rscript conf/installPackages.R

clean:
	rm -rf index_cache index_files index.html

.PHONY: server pdf install clean
