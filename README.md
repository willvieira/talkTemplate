# talkTemplate

[![Build Status](https://travis-ci.org/willvieira/talkTemplate.svg?branch=master)](https://travis-ci.org/willvieira/talkTemplate) [![html](https://img.shields.io/badge/read-html-blue)](https://willvieira.github.io/talkTemplate/#1) [![pdf](https://img.shields.io/badge/read-pdf-yellow)](https://willvieira.github.io/talkTemplate/slides.pdf)

## Setup

First click on the [Use this template](https://github.com/astefanutti/decktape](https://github.com/PoisotLab/manuscript-template/generate)) button to fork this repository, and clone it to your local.

It is recomended to install all (R packages 📦) dependencies:

```make
make install
```

If you use other R packages for your presentation, add them to the `requeriments.yml` file

Once dependencies are solved, you can server your presentation on local to be automatically updated while editing:

```make
make server
```

Finally, publish your final `html` presentation with:

```make
make
```

### PDF output

To export the `html` presentation to `pdf`:

```make
make pdf
```

But you need Google Chrome installed (or other chromium such as Brave; although you have to specify the full path to find the chromium browser in the makefile). You can also use [decktape](https://github.com/astefanutti/decktape).

Note that if you have activated travis to build your presentation, it will automatically compile a pdf and push it to the gh-pages branch.

## Host your presentation on GitHub with Travis
- Sign in on [Travis-ci.org](https://travis-ci.org/), open [this](https://travis-ci.org/account/repositories) page, and activate Travis to integrate your presentation repo
- [Generate](https://docs.travis-ci.com/user/deployment/pages/#setting-the-github-token) a GitHub token to allow travis to push to your gh-pages branch
- On the Settings page of your activated repo (https://travis-ci.org/github/USERNAME/REPONAME/settings), add the token generated on GitHub as an Environment Variables with name `GITHUB_PAT`
- Update the badges link on the `README.md` with your repo name
- Now after a commit, travis will compile your presentation in both `html` and `pdf`, and push them to the gh-pages branch

## Slide content

You can find in the [presentation](https://willvieira.github.io/talkTemplate/#1) the basic syntax to create the common elements (Sections, figures, tables, etc) along with some resourceful links.
