# load requirements file
string = readLines('requirements.yml')

# select cran and github packages
whichRpackage <- grep('r_packages:', string)
whichGHpackage <- grep('r_github_packages:', string)

if(sum(whichGHpackage) > 0)
{
    rPackages <- sub('-', '', gsub('[[:space:]]', '', string[(whichRpackage + 1):(whichGHpackage - 1)]))
    ghPackages <- sub('-', '', gsub('[[:space:]]', '', string[(whichGHpackage + 1):(length(string))]))

}else{
    rPackages <- sub('-', '', gsub('[[:space:]]', '', string[(whichRpackage + 1):length(string)]))
}


# Check if Packages are already installed
newRpackages <- rPackages[!(rPackages %in% installed.packages()[,"Package"])]
if(exists('ghPackages'))
{
    newGHpackages <- ghPackages[!(ghPackages %in% installed.packages()[,"Package"])]
    newRpackages <- append(newRpackages, newGHpackages)
    if(sum(newGHpackages) > 0)
}

# Ask if we want to install all the needed packages
text <- 'Packages to be installed:\n'
cat(paste0(text, paste0(paste0('- ', newRpackages), collapse = '\n')))

answer <- menu(c("Yes", "No"), title = "Do you want to install all of them?")


# Install CRAN packages if needed
if(answer == 1)
{
    for(rPack in rPackages)
        if (!require(rPack)) install.packages(rPack)

    # Install github packages if needed
    if(exists('ghPackages'))
    {
        # remotes needed to install packages from GitHub
        if (!require(remotes)) install.packages(remotes)

        for(ghPack in ghPackages)
            if (!require(ghPack)) remotes::install_github(ghPack)

    }
}else{
    stop('Stopping compilation, needed packages are not installed.')
}