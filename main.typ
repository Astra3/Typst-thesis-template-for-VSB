// If you wish to add a title, authors or keywords, do so here!
#let title = "Bachelors thesis example"
#let author = "Your name"
#let czechKeywords = (
  "klíčové slovo 1",
  "klíčové slovo 2",
)
#let englishKeywords = (
  "keyword 1",
  "keyword 2",
)

// Edit this variable if you're in more nested folders, i.e. when using the template as a git submodule
#let templFolder = "thesis_template/"

#set document(
  title: title,
  author: (author),
  // set keywords according to your language
  keywords: englishKeywords,
)

// Imports template
// MAKE SURE YOU HAVE CALIBRI FONTS INSTALLED (or imported, if using the online version of typst)
#import templFolder + "template.typ" as temp

// Comment above and uncomment below to use (increase) paragraph spacing instead of first line indent
#show: temp.template
// #show: temp.template.with(firstLineIndent: false)

#set text(
  // SET YOUR LANGUAGE HERE CORRECTLY
  // use "cs" or "en", "sk" is not fully supported by typst
  lang: "en",
  // Template uses Calibri by default, if you want to overwrite that (guideline allows for more fonts, see links in template.typ), do it here
  //font: "Palatino Linotype",
)

// If you want to set custom monospace font, do it here
//#show raw: set text(font: "Source Code Pro")

/*
The very first page:
Params:
1. Thesis title in Czech or English
2. Title again in the other language
3. Your full name
4. Supervisor
Optional params:
5. Type of your thesis - bachelor, bachelor-practice, master or phd, defaults to bachelor
6. Year of the thesis, defaults to current year
*/

#temp.titlePage(
  title,
  "Tool for something ig",
  author,
  "Ing. Alena Nováková, PhD.",
)



// Thesis assignment page

#temp.assignmentHeading

#lorem(50)

#lorem(50)


#pagebreak()
/*
All of the abstracts. Abstract should take about 10 lines.
1. Czech abstract
2. English abstract
3. Czech keywords
4. English keywords
5. Acknowledgment, if any
*/
#temp.abstracts(
  [není to zadarmo],
  [it's not free],
  czechKeywords,
  englishKeywords,
  // If writing in Slovak, you can optionally provide keywords and abstracts in Slovak
  //slovakAbstract: [nie je to zadarmo],
  //slovakKeywords: ("kľúčové slovo 1", "kľúčové slovo 2"),
  // You can also add a quote, if you feel like it
  // and get insanely creative with it
  quote: quote(
    [
      #text(lang: "he")[
        ויאמר משה אל יהוה בי אדני לא איש דברים אנכי גם מתמול גם משלשם גם מאז דברך אל עבדך כי כבד פה וכבד לשון אנכי׃
      ]
    ],
    attribution: [
      _The Bible_, Exodus 4:10 #footnote([But Moses replied to the LORD, "Please, Lord, I have never been eloquent--either in the past or recently or since You have been speaking to Your servant--because I am slow and hesitant in speech." @bible]) @hebrew-bible
    ],
    block: true,
  ),
  acknowledgment: [Thank you],
  // In case you need to set custom abstract spacing
  //abstractSpacing: 2.5cm,
)


// Page numbering starts with outline
#set page(numbering: "1")


// Uncomment this if you don't want chapter title in headers
// headerHeadingPage sets if a header should be shown on a page starting with header
#show: temp.headerChapters.with(headerHeadingPage: false)
#temp.listChapters


// List of symbols and abbreviations, automatically alphabetically sorted
#temp.listSymbols((
  ("html", "Hyper Text Modeling Language"),
  ("HTML", "language"),
  ("glibc", "GNU C library"),
))

// List of Figures
#temp.listImages


// List of Tables
#temp.listTables


// Start heading numbering
#set heading(numbering: "1.1.1")

// Start of your text

= Introduction

#lorem(20)

= Massive Heading

== Some Text Header

#lorem(50)

=== Third Heading

#lorem(50)

#lorem(50)

#quote(lorem(50), attribution: [I made it up], block: true)

#lorem(50) And some inline math $5 + 10 = 15$.

$
  sum_(k=0)^n k
  &= 1 + ... n \
  &= (n(n + 1)) / 2
$

Odkaz na @random_table[Tabulku]

- list example
- second item #footnote("is it really second?")
  - indented item

+ numbered
+ numbered a inline `source code`

#figure(
  [
    ```python
    print("hello")
    def add(a: int, b: int):
        return a + b
    ```],
  caption: "hello",
)

#lorem(10)

#figure(
  table(
    columns: (auto, auto),
    table.header([*first*], [_second_]),
    [1], [2],
  ),
  caption: "What a table this is",
) <random_table>


// Idealy you'd create a function or a show rule to have your table style a bit more consistent
#let nohline = table.hline(stroke: none)
#figure(
  table(
    columns: (auto, auto, auto, auto, auto, auto),
    align: bottom + left,
    stroke: (top: 1pt, bottom: 1pt, x: none),
    table.header(
      table.cell(rowspan: 2)[Pokus],
      table.cell(rowspan: 2)[A],
      table.cell(colspan: 2)[Algoritmus 1],
      table.cell(colspan: 2)[Algoritmus 2],
      [B],
      [C],
      [D],
      [E],
    ),
    [Hydrochloric acid], [12.0], [92.1], [104], [16.6], [104], nohline,
    ..for i in range(6) { ([106],) }, nohline,
    ..for i in range(6) { ([206],) },
  ),
  caption: "A more customized table, keep your table style consistent tho!",
)


= Automatic page break with heading

some text here

#figure(
  image("images/bacteria.jpg", height: 5cm),
  caption: [Image of _Treponema pallidum_],
)

= Conclusion

/ Term: hello @house[p. 358] @halting
/ Secon term: #lorem(30) @wwdc-network
/ Halting: it is something @halting

#bibliography(
  "main_bibliography.yml",
  // this style is required by the styleguide
  style: templFolder + "iso690-numeric-brackets-cs.csl"
)

// Start appendix
#show: temp.appendix

= First thing
#lorem(50)

= Second thing
#lorem(50)
