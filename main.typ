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

#set document(
  title: title,
  author: (author),
  // set keywords according to your language
  keywords: englishKeywords,
)

// SET YOUR LANGUAGE HERE CORRECTLY
// use "cs" or "en", "sk" is not supported by typst
#set text(lang: "en")

// Imports template
// MAKE SURE YOU HAVE CALIBRI FONTS INSTALLED (or imported, if using the online version of typst)
#import "thesis_template/template.typ" as temp

// Comment above and uncomment below to use paragraph spacing instead of first line indent
#show: temp.template
//#show: temp.template.with(firstLineIndent: true)

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
  acknowledgment: [Thank you],
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

#quote(attribution: [I made it up], block: true)[#lorem(30)]

#lorem(50) And some inline math $5 + 10 = 15$.

$ sum_(k=0)^n k
  &= 1 + ... n \ 
  &= (n(n + 1)) / 2 $

Odkaz na @random_table[Tabulku]

- list example
- second item #footnote("is it really second?")
  - indented item

+ numbered
+ numbered a inline `source code`

#figure([
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


= Automatic page break with heading

some text here

#figure(
  image("images/bacteria.jpg", height: 5cm),
  caption: [Image of _Treponema pallidum_]
)

= Conclusion

/ Term: hello @house
/ Secon term: #lorem(30) @wwdc-network
/ Halting: it is something @halting

#bibliography("main_bibliography.yml")

// Start appendix
#show: temp.appendix

= First thing
#lorem(50)

= Second thing
#lorem(50)
