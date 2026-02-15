# Ostrálka — VŠB FEI Thesis Template
Ostrálka is a template for writing bachelor and master thesis at [Faculty of Electrical Enginnering and Computer Science](https://www.fei.vsb.cz) at [Vysoká škola Báňská - Technical University of Ostrava](https://www.vsb.cz/en).

## Usage
In your CLI run:
```
typst init @preview/ostralka-vsb-fei
```
This will create a skeleton project for your thesis. Read comments in the generated `main.typ` file and modify it to your needs. Focus especially on setting your language, filling out title page details correctly and removing outlines and lists that are empty.

### Local installation
For local installation, follow [Typst's Packages tutorial for local packages](https://github.com/typst/packages/blob/main/README.md#local-packages).

## University's thesis guidelines links
- [University's LaTeX template](http://www.cs.vsb.cz/dvorsky/LaTeX.html)
- [VŠB FEI thesis styleguide](https://www.fei.vsb.cz/cs/student/zaverecne-prace)
- [Faculty logos](https://vizual.vsb.cz/cs/sablony-a-loga/loga/)

The template follows these guidelines wherever it can. When guidelines specify more than one options, these options can be configured in the template. When guidelines specify no formatting on some item but the LaTeX template does this formatting, this formatting is replicated in this template (except for tables) with mention in `main.typ` that it can be changed.

## Reporting issues and missing features
Look into template's repository's issues. Feel free to submit a PR too.

## Licensing
Refer to the [copyright](copyright) file, written in accordance with [Debian copyright file format](https://www.debian.org/doc/packaging-manuals/copyright-format/1.0/).

In a nutshell, everything in the repository is licensed under MIT license, except:
- Code in [`template`](template/) folder — MIT-0 license, meaning you can use it to write your thesis without any attribution
- Logos in [`src/logos`](src/logos/) folder — refer to <!-- TODO fill in the license --> license
- [`src/iso690-numeric-brackets-cs.csl`](src/iso690-numeric-brackets-cs.csl) file — [CC-BY-SA-3.0](https://creativecommons.org/licenses/by-sa/3.0/) license
  
  It comes from the [CSL project](https://citationstyles.org/), from [styles](https://github.com/citation-style-language/styles/) repository. Authors are listed in the [file](https://github.com/citation-style-language/styles/blob/master/iso690-numeric-brackets-cs.csl) itself. There have been some small modifications made to it to align more with ČSN ISO 690. The resulting style is not fully compliant with ČSN ISO 690, but for the purposes of thesis it's been good enough so far.

