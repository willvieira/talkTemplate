if(!require(yaml))
    install.packages('yaml')

if(!require(remotes))
    install.packages('remotes')

pck <- yaml::read_yaml('requirements.yml')

# get CRAN packages
cran = unlist(pck['r_packages'])
toInstall <- setdiff(cran, rownames(installed.packages()))
print(toInstall)

# Install CRAN
if(length(toInstall) > 0)
    install.packages(toInstall, dependencies = TRUE)
    
# get github packages
toInstall <- setdiff(unlist(pck$r_github_packages), sapply(rownames(installed.packages())[sapply(rownames(installed.packages()), function(x) {!is.null(packageDescription(x)['GithubRepo'][[1]])})], function(x) paste0(packageDescription(x)['GithubUsername'][[1]], '/', packageDescription(x)['GithubRepo'][[1]])))
print(toInstall)

# install GitHub
if(length(toInstall) > 0)
    remotes::install_github(toInstall, upgrade = 'always')