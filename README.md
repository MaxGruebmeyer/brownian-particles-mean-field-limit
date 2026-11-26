# Brownian Particle Systems and its Mean-Field Limit

"Brownian Particle Systems and its Mean-Field Limit" was the topic of my Bachelor's
thesis in Mathematics. It was written at the University of Augsburg, Germany and
supervised by Prof. Chengcheng Ling. The second examiner was Prof. Dirk Blömker.

The thesis is split into three parts. One giant prerequisites block, a simpler
example I developed myself, and a more complex example which is based on Prof.
Sznitman's work presented at the 19th Saint-Flour Summer School on Probability in
1989.

This repo contains the LaTeX code for my thesis, mainly so I can reference it digitally
and remotely. The prerequisites section in particular is useful some times.
But if someone else ever stumbles across this and finds it helpful that would be
great too :)

## Download links

PDFs are build and published [here](https://github.com/MaxGruebmeyer/brownian-particles-mean-field-limit/releases/tag/pdf-latest)
as part of a GitHub action.

## How to build

Of course you can also build the PDFs locally.
Run the following sequence from within the `latex` directory.
```
pdflatex thesis.tex
bibtex thesis
pdflatex thesis.tex
pdflatex thesis.tex
```
or just use `latexmk -pf thesis.pdf` from within the `latex` directory.

## Print and Non-print versions

`latex/thesis.tex` may begin with `\documentclass[print]{thesis}`, which compiles
the thesis in print mode. It has wider margins, and shifts even and odd pages.
It is done so the thesis looks nicer when printed on paper. For a digital version
just omit it.
