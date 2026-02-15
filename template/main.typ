// Specify your title, authors and keywords here
#let title = "Bachelors thesis example"
#let author = "Your name"
#let czech-keywords = (
  "klíčové slovo 1",
  "klíčové slovo 2",
)
#let english-keywords = (
  "keyword 1",
  "keyword 2",
)

#set document(
  title: title,
  author: (author),
  // set these keywords according to your language
  keywords: english-keywords,
)

// Imports template
// MAKE SURE YOU HAVE CALIBRI FONTS INSTALLED (or imported, if using the online version of typst)
#import "@preview/ostralka-vsb-fei:0.1.0" as temp
// Every function has a documentation attached to it. View its source to see more details on parameters and usage.

// Uncomment the parameter in parenthesis to disable first line indent and increase paragraph spacing. Guidelines don't mention any *correct* way, but latex template uses first line indent.
#show: temp.template.with(/* first-line-indent: false */ )

#set text(
  // SET YOUR LANGUAGE HERE CORRECTLY
  // use "cs" or "en", "sk" is not fully supported by typst
  // when you're using Czech, all conjunctions get an unbreabakle space appended by the template, to prevent them from displaying as last characters on the line
  lang: "en",
  // Template uses Calibri by default (because it's very available and we optimized font sizes for it), if you want to overwrite that
  // (guideline allows for more fonts, see links in README), do it below
  // I peronally recommend Carlito as sans-serif and Tex Gyre Pangella (based on Palatino)
  // font: "Tex Gyre Pagella",
)

// If you want to set custom monospace font, do so here
// #show raw: set text(font: "Source Code Pro")

/*
The very first page:
Params:
1. thesis-title: Thesis title in Czech or English
2. thesis-description: Title again in the other language
3. full-name: Your full name
4. supervisor: Supervisor
Optional params:
5. thesis-type: Type of your thesis - bachelor, bachelor-practice, master, phd, or semestral, defaults to bachelor
6. year: Year of the thesis, defaults to auto, which is current year
7. logo: auto for VŠB logo, none for no logo or content for any content you want
*/

#temp.title-page(
  title,
  "Tool for something ig",
  author,
  thesis-type: "bachelor",
  "Ing. Alena Nováková, PhD.",
)



// Thesis assignment page

#temp.assignment-heading
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
  czech-keywords,
  english-keywords,
  // If writing in Slovak, you can optionally provide keywords and abstracts in Slovak
  // slovak-abstract: [nie je to zadarmo],
  // slovak-keywords: ("kľúčové slovo 1", "kľúčové slovo 2"),
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


// Uncomment this if you don't want chapter title in page headers
// header-heading-page sets if a header should be shown on a page where the heading is specified
#show: temp.header-chapters.with(header-heading-page: false)

// Chapters outline
// max-depth is 3 by default, it's not specified in guidelines but it's standard practice to keep it like this
#temp.list-chapters(/* max-depth: 3 */ )


// List of symbols and abbreviations, automatically alphabetically sorted
// I recommend using packages libe abbr or acrostatic for this, for automatic handling
// remove symbols parameter or set it to none to get only the heading for abbreviations
#temp.list-symbols(symbols: (
  ("html", "Hyper Text Modeling Language"),
  ("HTML", "language"),
  ("glibc", "GNU C library"),
))
// If using packages, you can use the function below to just get the heading text
// #temp.list-symbols-title

// Remove ANY of the list if you don't have any figures of their type

// List of Figures
#temp.list-images


// List of Tables
#temp.list-tables


// List of Source Code Listings
#temp.list-source-codes


// Start heading numbering
// only headings up to and including max_depth are shown in the outline and are numbered
// all headings are included in PDF's outline
// If you're using custom fonts, you may need to modify the no-number-offset parameter, view function's source for
// documentation
#show: temp.start-heading-numbering/* .with(max-depth: 3) */

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
// the style of the ones here is copied from latex template, guidelines don't specify any style
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


// Ideally you'd create a function or a show rule to have your table style a bit more consistent
// The style of this table is more consistent with the LaTeX template, but no style on tables is enforced
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
  // the manual image here is specified as an example; use files for images please
  image(bytes((0, 0, 0xff, 0, 0xfa, 0)), height: 5cm, format: (encoding: "rgb8", height: 1, width: 2)),
  caption: [Example image],
)

= Conclusion

/ Term: hello @house[p. 358] @halting
/ Second term: #lorem(30) @wwdc-network
/ Halting: it is something @halting

#bibliography(
  "main_bibliography.yml",
  // this style is required by the styleguide
  style: temp.bibliography-style,
)

// Start appendix
#show: temp.appendix

= First thing
#lorem(50)

= Second thing
#lorem(50)
