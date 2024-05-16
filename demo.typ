#set document(title: [Bachelors thesis template demo], author: ("Dr00g", "Darin"), keywords: ("Dr00g", "Dr00gy", "Darin", "Bachelor", "Bachelors", "Thesis", "astra3"))


//******************************************************************************
// Template demo author: Dr00g on Discord / Dr00gy on GitHub

// Sources / references for the template:
// 1. https://www.cs.vsb.cz/dvorsky/Download/LaTeX/Czech/BachelorThesis.pdf (LaTeX)
// 2. https://vizual.vsb.cz/cs/sablony-a-loga/psani-dokumentu/
// 3. https://homel.vsb.cz/~luk76/students/Urban_Bc.pdf (OUTDATED)

// Special thanks to astra3 on Discord for helping me figure out more intricate markup

// Typst documentation can be found in "Help" or at:
// https://typst.app/docs/reference/
//******************************************************************************


// Pages styling
#set page(
  //width: 50cm,
  //height: 50cm,
  margin: (x: 2.5cm),
  paper: "a4"
)

// Styling of headers and normal text
#show heading.where(level: 2): set text(font: "Calibri", weight: "bold", size: 20pt, lang: "cs", spacing: 160%)
#show heading.where(level: 1): set text(font: "Calibri", weight: "bold", size: 28pt, lang: "cs", spacing: 160%)

#set text(
  font: "Calibri",
  size: 11pt,
  lang: "cs"
)

#set par(
  leading: 12.65pt, // Can be of value between x1.15 to x1.5
)


// First page generation
/*
fullName - Your full name here
supervisor - Who is leading your thesis
year - The year in which you are creating your thesis
*/

#let generateFirstPage(thesisLang1, thesisLang2, fullName, supervisor, year) = {
  move(dx: -23pt, dy: 0pt, image("CZ-visuals/FEI-ochranna-zona-CZ.png", width: 60%))

  heading(outlined: false, level: 2)[
    #thesisLang1
  ]
  linebreak()

  [ 
    #set text(size: 14pt, spacing: 160%)
    #thesisLang2
  ]
  linebreak()
  linebreak()
  [
    #set text(size: 20pt, spacing: 160%)
    #fullName
  ]
  for i in range(20) { // Single line break with "\", enter or linebreak()
    linebreak()
  }

  [
    #set text(size: 14pt, spacing: 160%)
    Bakalářská práce

    Vedoucí práce: #supervisor

    Ostrava, #year
  ]
  pagebreak()
}

#generateFirstPage("Optical Mapping Technology Sequence Mapping Visualization Tool", "Nástroj pro vizualizaci mapování sekvencí technologie optického mapování", "Darin Pytel", "Ing. Michal Vašinek, Ph.D.", 2024)


// Thesis assignment
#set list(indent: 20pt)
#set enum(indent: 20pt)

#heading(outlined: false, level: 2)[Zadání kvalifikační práce]
\
Optické mapování genomu je technologie, která umožňuje zkoumání rozsáhlých
strukturálních variant zkoumaného genomu. Aby bylo možné sledovat odchylky zkoumaného genomu od referenčního genomu, je zapotřebí sekvence ať už simulovaného nebo skutečného charakteru namapovat na referenční sekvenci. Cílem této práce by mělo být vytvoření aplikace, která by vhodným způsobem vizualizovala různá namapování sekvencí na referenční genom a umožnila vizuální identifikaci oblastí, do kterých může být obtížné sekvence přesně mapovat. Vizualizace bude cílit na dva pohledy, první pohled bude z hlediska jedné zkoumané sekvence a jejích alternativních mapování napříč genomem, druhý pohled bude zaměřen na jednu oblast genomu a k ní budou doplněny různé sekvence. Zásady pro vypracování práce jsou následující:
\
+ Seznámení se s technologií optického mapování.
+ Navrhnout a naimplementovat ve zvolené technologii vizualizace optického mapování.
#pagebreak()


// Abstract
#heading(outlined: false, level: 2)[Abstrakt]
\
#lorem(50)

#heading(outlined: false, level: 2)[Klíčová slova]
\
keyword1; keyword2; keyword3

#for i in range(5) {
  linebreak()
}

#heading(outlined: false, level: 2)[Abstract]
\
#lorem(50)

#heading(outlined: false, level: 2)[Keywords]
\
keyword1; keyword2; keyword3

#pagebreak()


// Acknowledgement
#align(bottom)[
#heading(outlined: false, level: 2)[Poděkování]
\
#lorem(30)
]
#set page(numbering: "1")
#pagebreak()


// Contents
#show outline.entry.where(level: 1): set outline(fill: none)
#outline() // TODO: Add rule for ... for nested chapters / figures
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
==  Kapitola 1
= Úvod // Introduction
\
#lorem(450)
#pagebreak()


==  Kapitola 2
= Analýza problému // Introduction
\
#lorem(200)
#figure(
  image("Figures-images/paratko.png", width: 30%),
  numbering: "2.1",
  caption: [
    Vskutku inteligentní jedinec @bebil
  ]
)
#lorem(150)

#show raw.where(block: true): set block(width: 452pt, inset: 8pt, stroke: (left: none, right: none, top: (black), bottom: black)) // TODO: Consider dictionary outside of here + x,y

#figure(
raw(lang: "cpp", block: true,
"// My first program in C++
// Příšerně žluťoučký kůň úpěl ďábelské ódy
#include <iostream>
int main()
{
std::cout << \"Hello World!\";
}"), // Backslashes / escape characters used to prevent syntax errs
  numbering: "2.1",
  caption: [
    Ukázka nejhoršího jazyka
  ]
)
#linebreak()
#linebreak()
#figure(
raw(lang: "py", block: true,
"# Python program Hello, World
my_string = \"Hello, World!\"
print(my_string)
"),
  numbering: "2.1",
  caption: [
    Solidní had
  ]
)
#linebreak()
#linebreak()
// "Combined" tables (into one "block") with individual figues + one overhead figure
#set figure.caption(position: top)
// Actual markup starts here
#figure(
  grid(columns: 2, gutter: 35pt,
    figure(
      table(
        stroke: none,
        columns: 2,
        table.hline(y: 0),
        table.hline(y: 1),
        table.hline(y: 5),
        [*Amount*], [*Ingredient*],
        [360g], [Baking flour],
        [250g], [Butter (room temp.)],
        [150g], [Brown sugar],
        [100g], [Cane sugar]),
        numbering: "(a)", // TODO: Get rid of type in caption
        caption: [
          Jedna tabulka
        ]
    ),
    figure(
      table(
        columns: 2,
        [*Amount*], [*Ingredient*],
        [360g], [Baking flour],
        [250g], [Butter (room temp.)],
        [150g], [Brown sugar],
        [100g], [Cane sugar]),  
        numbering: "(a)",
        caption: [
          Druhá tabulka
        ]
      ),
    ),
    numbering: "2.1",
    caption: [
      Ukázka dvou velice malých tabulek a způsob, jak je sdružit dohromady
    ]
)
#pagebreak()


==  Kapitola 3
= Technické detaily // Technical details
\
#lorem(100)

// Lists
#set enum(numbering: "1 a.") // TODO: Fix letter numbering
+ Different
+ Numbering
  + Nested
  + Items
+ Style
#linebreak()
#linebreak()
#set list(marker: ([•], [--]))
- Top-level
  - Nested
  - Items
- Items
#linebreak()
#linebreak()

$ (sum_(n=1)^infinity a#sub[n] b#sub[n] )^2 lt.equiv sum_(n=1)^infinity a^2_n dot sum_(n=1)^infinity b^2_n $

$ (x+y)^3 &= (x+y)(x+y)^2 \
  &= (x+y)(x+y)^2 \
  &= (x+y)(x^2 + 2 x y + y^2)
$

#linebreak()
#linebreak()
#table(
  stroke: none,
  columns: 6,
  table.hline(y: 0),
  table.hline(y: 1, start: 2),
  table.hline(y: 2),
  table.hline(y: 4),
  table.header(
    [ ],
    [ ],
    table.cell(colspan: 2)[Algoritmus 1],
    table.cell(colspan: 2)[Algoritmus 2],
    [Pokus],
    [A],
    [B],
    [C],
    [D],
    [E]
  ),
  [Hydrochloric Acid],
  [12.0],
  [92.1],
  [104],
  [16.6],
  [104],
  [104],
  [104],
  [104],
  [104],
  [104],
  [104],
)
Check the docs for more details.
#footnote[https://typst.app/docs]
#pagebreak()


==  Kapitola 4
= Závěr // Conclusion
\
#lorem(400)
#pagebreak()


// Literature
=  Literatura
\
#pagebreak()


// Apendix
==  Příloha A
= Něco něco // Conclusion
#linebreak()
#lorem(400) #label("bruh")
#pagebreak()


==  Příloha B
= Velké obrázky a tabulky // Large images and tables
\
#lorem(400)
#set figure.caption(position: bottom)
#link(<bruh>)[
#align(center)[
#rotate(90deg)[
#figure(
  image("Figures-images/paratko.png", width: 80%),
  caption: [
    Po jídle :peepoLove:.
  ],
)]]]
#linebreak()
#linebreak()
#align(center)[
#rotate(90deg)[
#figure(
    table( // TODO: Stylise table borders properly
      columns: 2,
      [*Amount*], [*Ingredient*],
      [360g], [Baking flour],
      [250g], [Butter (room temp.)],
      [150g], [Brown sugar],
      [100g], [Cane sugar]),
  caption: [
    Nějaká tabulka idk
  ],
)]]
#pagebreak()


==  Příloha C
= Dlouhý zdrojový kód // Long source code
\
#lorem(400)


#bibliography("works.bib")