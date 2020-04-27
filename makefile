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
	Rscript -e "if(!require(yaml)) install.packages('yaml'); if(!require(githubinstall)) install.packages('githubinstall'); pck <- yaml::read_yaml('requirements.yml'); if(length(pck$r_packages) > 0) install.packages(setdiff(pck$r_packages, rownames(installed.packages()))); toInstall <- setdiff(pck$r_github_packages, sapply(rownames(installed.packages())[sapply(rownames(installed.packages()), function(x) {!is.null(packageDescription(x)['GithubRepo'][[1]])})], function(x) paste0(packageDescription(x)['GithubUsername'][[1]], '/', packageDescription(x)['GithubRepo'][[1]]))); if(length(toInstall) > 0) githubinstall::githubinstall(toInstall);"

clean:
	rm -rf index_cache index_files index.html

.PHONY: server pdf install clean
