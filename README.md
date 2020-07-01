# talkTemplate

![Build](https://github.com/willvieira/talkTemplate/workflows/Build/badge.svg) [![html](https://img.shields.io/badge/read-html-blue)](https://willvieira.github.io/talkTemplate/#1) [![pdf](https://img.shields.io/badge/read-pdf-yellow)](https://willvieira.github.io/talkTemplate/slides.pdf)

## Abstract

Here it goes the abstract of the slides. I show here how to setup this template, basic syntax for creating the content, and some `JS` macros.

## Take home messages

- Start with a template is much easier to start your presentation
- Here you don't have to worry about dependencies, deployment and how to generate a PDF

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

Note that if you have activated GitHub actions to build your presentation, it will automatically compile a pdf and push it to the gh-pages branch.

## Host your presentation on GitHub
- On the Settings page of your repo (https://github.com/USER_NAME/REPO_NAME/settings/), go to the GitHub Pages section and make sure the Source used is the `gh-pages branch`
- Update the badges link on the `README.md` with your repo name
- Now after a commit, GitHub actions will compile your presentation in both `html` and `pdf`, and push them to the gh-pages branch

*Note: after forking the template, it usually takes few hours to your presentation be available on the link https://USER_NAME.github.io/REPO_NAME/*

## Slide content

You can find in the [presentation](https://willvieira.github.io/talkTemplate/#1) the basic syntax to create the common elements (Sections, figures, tables, etc) along with some resourceful links.
