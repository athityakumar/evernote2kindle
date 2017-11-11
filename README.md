# Evernote to Kindle converter

This repository contains parts of [this](https://github.com/seanhagen/enex-to-markdown) and [this](https://github.com/paulfurley/markdown-to-epub-mobi) awesome projects, to create a MOBI book that's transferrable to your Kindle, from all your EverNote notebooks. For this to work, you'll have to export each of your notebooks / all your notes into the `~/Downloads/` directory with a `.enex` extension.

### Installation

- Install [Pandoc](https://pandoc.org/installing.html)
- Install [kindlegen](https://www.amazon.com/gp/feature.html?docId=1000765211)
- `git clone git@github.com:athityakumar/evernote2kindle.git`
- `cd evernote2kindle`
- `gem install bundler`
- `bundle install`

### Usage

- `sh pipeline.sh` : Reads all `.enex` files from `~/Downloads` directory, generates the markdown, EPUB and MOBI files. If things go right, you should find your Notebook-wise markdown files at `chapters/` directory, and the generated `EPUB` and `MOBI` versions in the `build/` directory. If something goes wrong, open an issue here.

### License 

MIT License 2017 - [Athitya Kumar](https://github.com/athityakumar)