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

## Host your presentation on GitHub with Travis (*TODO*)
- Activate Travis to use your presentation repo
- [Generate](https://docs.travis-ci.com/user/deployment/pages/) a GitHub token to allow travis to push to your gh-pages branch
- Trigger a build by pushing a commit


## Slide content

You can find in the [presentation](https://willvieira.github.io/talkTemplate/#1) the basic syntax to create the common elements (Sections, figures, tables, etc) along with some resourceful links.
