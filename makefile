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
	Rscript -e "if(!require(yaml)) install.packages('yaml'); if(!require(remotes)) install.packages('remotes'); pck <- yaml::read_yaml('requirements.yml'); cran = unlist(pck$$r_packages); if(length(cran) > 0) install.packages(setdiff(cran, rownames(installed.packages())), dependencies = TRUE); toInstall <- setdiff(unlist(pck$$r_github_packages), sapply(rownames(installed.packages())[sapply(rownames(installed.packages()), function(x) {!is.null(packageDescription(x)['GithubRepo'][[1]])})], function(x) paste0(packageDescription(x)['GithubUsername'][[1]], '/', packageDescription(x)['GithubRepo'][[1]]))); if(length(toInstall) > 0) remotes::install_github(toInstall, upgrade = 'always');"

clean:
	rm -rf index_cache index_files index.html

.PHONY: server pdf install clean
