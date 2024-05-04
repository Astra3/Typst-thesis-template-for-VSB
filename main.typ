#set document(title: [Bachelors thesis template], author: ("Dr00g", "Darin"), keywords: ("Dr00g", "Darin", "Bachelor", "Bachelors", "Thesis"))


// TODO:
// Check for correct formatting and page config
// Fix Contents outline (+ make it more.. intelligent and suitable for general use)
// Create more functions where needed
// Add a figure, pseudocode etc.


// LINKS:
// https://typst.app/docs/reference/model/outline/#definitions-entry
// https://typst.app/docs/reference/introspection/query/
// https://typst.app/docs/reference/foundations/function/#definitions-where
// https://typst.app/docs/reference/introspection/here/
// https://typst.app/docs/reference/foundations/content/#definitions-location
// https://typst.app/docs/reference/foundations/arguments/
// https://typst.app/docs/reference/foundations/selector/
// https://typst.app/docs/reference/foundations/array/
// https://typst.app/docs/guides/page-setup-guide/


// Template author: Dr00g on Discord
// Sources / references for the template:
/*
1. https://www.cs.vsb.cz/dvorsky/Download/LaTeX/Czech/BachelorThesis.pdf (LateX)
2. https://vizual.vsb.cz/cs/sablony-a-loga/psani-dokumentu/
3. https://homel.vsb.cz/~luk76/students/Urban_Bc.pdf (OUTDATED)
*/

// Typst documentation can be found in "Help" or at:
// https://typst.app/docs/reference/


// Pages styling
#set page(
  //width: 50cm,
  //height: 50cm,
  margin: (x: 2.5cm),
  paper: "a4"
)

// Styling of headers and normal text
#show heading: set text(font: "Calibri", weight: "bold", size: 20pt, lang: "cs", spacing: 160%)

#set text(
  font: "Calibri",
  size: 11pt,
  lang: "cs"
)

#set par(
  leading: 12.65pt, // Can be of value between x1.15 to x1.5
)

#counter(page).update(0)

// First page generation
#let fullName = "Darin Pytel" // Your full name here
#let leading = "Ing. Michal Vašinek, Ph.D." // Who is leading your thesis
#let year = 2024 // The year in which you are creating your thesis

#let generateFirstPage() = {
move(dx: -23pt, dy: 0pt, image("CZ-visuals/FEI-ochranna-zona-CZ.png", width: 60%))

heading[Ukázka sazby kvalifikační práce]
linebreak()

[#set text(size: 14pt, spacing: 160%)
Diploma Thesis Typesetting Demo
]
linebreak()
linebreak()
[#set text(size: 20pt, spacing: 160%)
#fullName
]
for i in range(20) { // Single line break with "\", enter or linebreak()
  linebreak()
}

[#set text(size: 14pt, spacing: 160%)
Bakalářská práce

Vedoucí práce: #leading

Ostrava, #year]
pagebreak()
}

#generateFirstPage()


// Thesis assignment
#set par(
  first-line-indent: 11pt,
  leading: 12.65pt
)

#set list(indent: 20pt)
#set enum(indent: 20pt)

= Nástroj pro vizualizaci mapování sekvencí technologie optického mapování
\
Optické mapování genomu je technologie, která umožňuje zkoumání rozsáhlých
strukturálních variant zkoumaného genomu. Aby bylo možné sledovat odchylky zkoumaného genomu od referenčního genomu, je zapotřebí sekvence ať už simulovaného nebo skutečného charakteru namapovat na referenční sekvenci. Cílem této práce by mělo být vytvoření aplikace, která by vhodným způsobem vizualizovala různá namapování sekvencí na referenční genom a umožnila vizuální identifikaci oblastí, do kterých může být obtížné sekvence přesně mapovat. Vizualizace bude cílit na dva pohledy, první pohled bude z hlediska jedné zkoumané sekvence a jejích alternativních mapování napříč genomem, druhý pohled bude zaměřen na jednu oblast genomu a k ní budou doplněny různé sekvence. Zásady pro vypracování práce jsou následující:
\
+ Seznámení se s technologií optického mapování.
+ Navrhnout a naimplementovat ve zvolené technologii vizualizace optického mapování.
#pagebreak()


// Abstract
#counter(page).update(0)
= Abstrakt
\
#lorem(50)

= Klíčová slova
\
keyword1; keyword2; keyword3

#for i in range(5) {
  linebreak()
}

= Abstract
\
#lorem(50)

= Keywords
\
keyword1; keyword2; keyword3

#pagebreak()


// Acknowledgement
#align(bottom)[
= Poděkování
\
#lorem(30)
]
#counter(page).update(0)
#set page(numbering: "1")
#pagebreak()


#show heading: set text(font: "Calibri", weight: "bold", size: 28pt, spacing: 160%)
// Contents
\
#show outline.entry.where(
  page: [0]
): it => {
  //strong(it)
  hide(it)
}
#show outline.entry.where(
  page: [1]
): it => {
  //strong(it)
  hide(it)
}
#show outline.entry.where(
  page: [3]
): it => {
  //strong(it)
  hide(it)
}
#show outline.entry.where(
  page: [4]
): it => {
  //strong(it)
  hide(it)
}
#outline()
#pagebreak()


// List of symbols and abbreviations (using "terms" from reference)
= Seznam použitých zkratek a symbolů
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
  title: [Seznam obrázků],
  target: figure.where(kind: image)
)\
#pagebreak()


// List of Tables
#outline(
  title: [Seznam tabulek],
  target: figure.where(kind: table)
)\
#pagebreak()


// Chapters
#show heading: set text(font: "Calibri", weight: "bold", size: 20pt, spacing: 160%)
=  Kapitola 1
#show heading: set text(font: "Calibri", weight: "bold", size: 28pt, spacing: 160%)
= Úvod // Introduction
\
#lorem(450)
#pagebreak()


#show heading: set text(font: "Calibri", weight: "bold", size: 20pt, spacing: 160%)
=  Kapitola 2
#show heading: set text(font: "Calibri", weight: "bold", size: 28pt, spacing: 160%)
= Analýza problému // Introduction
\
#lorem(400)
#pagebreak()


#show heading: set text(font: "Calibri", weight: "bold", size: 20pt, spacing: 160%)
=  Kapitola 3
#show heading: set text(font: "Calibri", weight: "bold", size: 28pt, spacing: 160%)
= Technické detaily // Technical details
\
#lorem(400)
#pagebreak()


#show heading: set text(font: "Calibri", weight: "bold", size: 20pt, spacing: 160%)
=  Kapitola 4
#show heading: set text(font: "Calibri", weight: "bold", size: 28pt, spacing: 160%)
= Závěr // Conclusion
\
#lorem(400)
#pagebreak()


// Literature
#show heading: set text(font: "Calibri", weight: "bold", size: 28pt, spacing: 160%)
=  Literatura
\
#pagebreak()


// Apendix
#show heading: set text(font: "Calibri", weight: "bold", size: 20pt, spacing: 160%)
=  Příloha A
#show heading: set text(font: "Calibri", weight: "bold", size: 28pt, spacing: 160%)
= Něco něco // Conclusion
#linebreak()
#lorem(400)
#pagebreak()


#show heading: set text(font: "Calibri", weight: "bold", size: 20pt, spacing: 160%)
=  Příloha B
#show heading: set text(font: "Calibri", weight: "bold", size: 28pt, spacing: 160%)
= Velké obrázky a tabulky // Large images and tables
\
#lorem(400)
#pagebreak()


#show heading: set text(font: "Calibri", weight: "bold", size: 20pt, spacing: 160%)
=  Příloha C
#show heading: set text(font: "Calibri", weight: "bold", size: 28pt, spacing: 160%)
= Dlouhý zdrojový kód // Long source code
\
#lorem(400)


// TESTING:
