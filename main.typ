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

// TODO this will need some edits with template package
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

// Uncomment the parameter in paranthesis to disable first line indent and increase paragraph spacing. Guidelines don't mention any *correct* way, but latex template uses first line indent.
#show: temp.template.with(/* firstLineIndent: false */ )

#set text(
  // SET YOUR LANGUAGE HERE CORRECTLY
  // use "cs" or "en", "sk" is not fully supported by typst
  // when you're using Czech, all conjunctions get an unbreabakle space appended by the template, to prevent them from displaying as last characters on the line
  lang: "en",
  // Template uses Calibri by default (because it's very available and we optimized font sizes for it), if you want to overwrite thesis_template
  // (guideline allows for more fonts, see links at the start of this file), do it below
  // I peronally recommend Carlito as sans-serif and Tex Gyre Pangella (based on Palatino)
  // font: "Tex Gyre Pagella",
)

// If you want to set custom monospace font, do it here
// #show raw: set text(font: "Source Code Pro")

/*
The very first page:
Params:
1. thesisTitle: Thesis title in Czech or English
2. thesisDescription: Title again in the other language
3. fullName: Your full name
4. supervisor: Supervisor
Optional params:
5. thesisType: Type of your thesis - bachelor, bachelor-practice, master, phd, or semestral, defaults to bachelor
6. year: Year of the thesis, defaults to auto, which is current year
7. logo: auto for VŠB logo, none for no logo or content for any content you want
*/

#temp.titlePage(
  title,
  "Tool for something ig",
  author,
  thesisType: "bachelor",
  "Ing. Alena Nováková, PhD.",
)



// Thesis assignment page

#temp.assignmentHeading
// To include a PDF, you can convert each page to svg and then set it as a page background
// you can see an example of this below
// Typst does support importing PDFs, but you cannot use it when exporting to PDF/A

// #pagebreak()
// #set page(background: image("sources/assignment/assignment-1.svg"))
// #pagebreak()
// #set page(background: image("sources/assignment/assignment-2.svg"))
// #pagebreak()
// #set page(background: none)


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
  // slovakAbstract: [nie je to zadarmo],
  // slovakKeywords: ("kľúčové slovo 1", "kľúčové slovo 2"),
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
)


// Page numbering starts with outline, required by guidelines
#set page(numbering: "1")


// Uncomment this if you don't want chapter title in headers
// headerHeadingPage sets if a header should be shown on a page starting with header
#show: temp.headerChapters.with(headerHeadingPage: false)
#temp.listChapters(/* max_depth: 3 */ )


// List of symbols and abbreviations, automatically alphabetically sorted
// I recommend using packages libe abbr or acrostatic for this, for automatic handling
// remove symbols parameter or set it to none to get only the heading for abbreviations
#temp.listSymbols(symbols: (
  ("html", "Hyper Text Modeling Language"),
  ("HTML", "language"),
  ("glibc", "GNU C library"),
))
// If using packages, you can use the function below to just get the heading text
// #temp.listSymbolsTitle

// Remove ANY of the list if you don't have any figures of their type

// List of Figures
#temp.listImages


// List of Tables
#temp.listTables


// List of Source Code Listings
#temp.listSourceCodes


// Start heading numbering
// only headings up to and including max_depth are shown in the outline and are numbered
// all headings are included in PDF's outline
#show: temp.startHeadingNumbering/* .with(max_depth: 3) */

// Start of your text

= Introduction
// Guidelines specify that Introduction and Conclusion sections don't have to be numbered.
// If you don't want numbering, you can disable it like below.
// #heading(level: 1, numbering: none)[Introduction]

#text(lang: "cs")[
  #lorem(12) Zalomení, spojka a bude zalomena na nový řádek.
]

#lorem(20)

= Massive Heading

== Some Text Header

#lorem(50)

=== Third Heading

#lorem(50)

==== Fourth heading

#lorem(50)

#quote(lorem(50), attribution: [I made it up], block: true)

#lorem(50) And some inline math $5 + 10 = 15$.

$
  sum_(k=0)^n k & = 1 + ... n \
                & = (n(n + 1)) / 2
$

Link to @random_table[Tabulku]

- list example
- second item #footnote("is it really second?")
  - indented item

+ numbered
+ numbered a inline `source code`

// If you want more advanced code blocks, look at https://typst.app/universe/package/codly/
// the style of the ones here is copied from latex template
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

// TODO maybe move into a function?
#bibliography(
  "main_bibliography.yml",
  // this style is required by the styleguide
  style: templFolder + "iso690-numeric-brackets-cs.csl",
)

// Start appendix
#show: temp.appendix

= First thing
#lorem(50)

= Second thing
#lorem(50)
