// If you wish to add a title, authors or keywords, do so here!
#set document(
  title: [Bachelors thesis example],
  author: ("Your name"),
  keywords: (
    "keyword1",
    "keyword2"
  )
)

// Change the line (inside func-conf.typ):
// #let language = "en"
// to:
// #let language = "cs"
// if your thesis will be in Czech..



//******************************************************************************
// Template example author: Dr00g on Discord / Dr00gy on GitHub

// Sources / references for the template:
// 1. https://www.cs.vsb.cz/dvorsky/Download/LaTeX/Czech/BachelorThesis.pdf (LaTeX)
// 2. https://vizual.vsb.cz/cs/sablony-a-loga/psani-dokumentu/
// 3. https://homel.vsb.cz/~luk76/students/Urban_Bc.pdf (OUTDATED)

// Special thanks to astra3 on Discord for helping me figure out more intricate markup

// Typst documentation can be found in "Help" or at:
// https://typst.app/docs/reference/
//******************************************************************************



// Imports from the function + config file
#import ("func-conf.typ"): generateFirstPage, template, generateBeforeContents, language, assignmentTitle, abbSymbTitle, figuresListTitle, tablesListTitle

#show: template



// Actual document elements start here..
// The very first page of the document
// String parameters:
// 1) The title of your thesis in Czech or English
// 2) The title of your thesis again in the other language
// 3) Your full name
// 4) The supervisor of your thesis
// 5) The year in which you are creating your thesis
// 6) Your language setting, do not change this one, for your sake :)

#generateFirstPage(
  "Optical Mapping Technology Sequence Mapping Visualization Tool",
  "Nástroj pro vizualizaci mapování sekvencí technologie optického mapování",
  "Darin Pytel",
  "Ing. Michal Vašinek, Ph.D.",
  2024,
  language
)



// Your thesis assignment page, replace placeholder text with your own:

#heading(outlined: false, level: 2)[#assignmentTitle]
\
Optické mapování genomu je technologie, která umožňuje zkoumání rozsáhlých
strukturálních variant zkoumaného genomu. Aby bylo možné sledovat odchylky zkoumaného genomu od referenčního genomu, je zapotřebí sekvence ať už simulovaného nebo skutečného charakteru namapovat na referenční sekvenci. Cílem této práce by mělo být vytvoření aplikace, která by vhodným způsobem vizualizovala různá namapování sekvencí na referenční genom a umožnila vizuální identifikaci oblastí, do kterých může být obtížné sekvence přesně mapovat. Vizualizace bude cílit na dva pohledy, první pohled bude z hlediska jedné zkoumané sekvence a jejích alternativních mapování napříč genomem, druhý pohled bude zaměřen na jednu oblast genomu a k ní budou doplněny různé sekvence. Zásady pro vypracování práce jsou následující:
\
+ Seznámení se s technologií optického mapování.
+ Navrhnout a naimplementovat ve zvolené technologii vizualizace optického mapování.
#pagebreak()



// Other pages before the "Contents":
// String parameters:
// 1) The Czech text for your thesis
// 2) The English text for your thesis
// 5) Your language setting, do not change this one, for your sake :)
// 6) The text of your acknowledgement
// 3), 4) For keywords, simply put them into these arrays.. change the size however you like:

#let czechKeywords = (
  "optické mapování",
  "genomika",
  "mapování sekvencí",
  "vizuální nástroj"
)

#let englishKeywords = (
  "optical mapping",
  "genomics",
  "sequence mapping",
  "visual tool"
)

#generateBeforeContents(
  "AAA",
  "BBB",
  czechKeywords,
  englishKeywords,
  language,
  "CCC"
)



// Contents
#outline(fill: none) // TODO: Add rule for ... styling for nested chapters / figures
#pagebreak()



// List of symbols and abbreviations
// Insert your short names and their long names here..
= #abbSymbTitle
#linebreak()
#linebreak()
/ DVD: Digital Versatile Disc
/ TNT: Trinitrotoluen
/ UML: Unified Modeling Language
/ HTML: Hyper Text Markup Language
/ TUG: TEX Users Group
#pagebreak()



// List of Figures
#outline(
  title: [#figuresListTitle],
  target: figure.where(kind: image)
)\
#pagebreak()



// List of Tables
#outline(
  title: [#tablesListTitle],
  target: figure.where(kind: table)
)\
#pagebreak()



// Now continue on your own :)
// The Contents should update themselves as you write..
// = Heading1 - A big heading
// == Heading2 - A smaller heading
// #linebreak() or \ \ - A blank line (\ can ofc, be used as an escape character)
// Lorem(int) - Dummy text, replace "int" with a numerical value
// Typst documentation can be found in "Help" or at:
// https://typst.app/docs/reference/
== Chapter 1
= Introduction
Place
\ \
Holder