#set document(
  title: [Bachelors thesis funcon],
  author: (
    "Dr00g",
    "Darin"
  ),
  keywords: (
    "Dr00g",
    "Dr00gy",
    "Darin",
    "Bachelor thesis",
    "Bachelors thesis",
    "astra3"
  )
)



//******************************************************************************
// Funcon author: Dr00g on Discord / Dr00gy on GitHub

// Sources / references for the template:
// 1. https://www.cs.vsb.cz/dvorsky/Download/LaTeX/Czech/BachelorThesis.pdf (LaTeX)
// 2. https://vizual.vsb.cz/cs/sablony-a-loga/psani-dokumentu/
// 3. https://homel.vsb.cz/~luk76/students/Urban_Bc.pdf (OUTDATED)

// Special thanks to astra3 on Discord for helping me figure out more intricate markup

// Typst documentation can be found in "Help" or at:
// https://typst.app/docs/reference/
//******************************************************************************



#let language = "en"

#let template(doc) = {
  set page(
    //width: 50cm,
    //height: 50cm,
    margin: (x: 2.5cm),
    paper: "a4"
  )

  // Styling of headers and normal text
  show heading.where(level: 2): set text(
    font: "Calibri",
    weight: "bold",
    size: 20pt,
    lang:
    language,
    spacing: 160%
  )

  show heading.where(level: 1): set text(
    font: "Calibri",
    weight: "bold",
    size: 28pt,
    lang:
    language,
    spacing: 160%)

  set text(
    font: "Calibri",
    size: 11pt,
    lang: language
  ) 

  set par(
    leading: 12.65pt, // Can be of value between x1.15 to x1.5
  )

  set list(indent: 20pt)
  set enum(indent: 20pt)
  doc
}



#let generateFirstPage(thesisLang1, thesisLang2, fullName, supervisor, year, language) = {
  if language == "cs" {
    move(dx: -21pt,
      dy: 0pt,
      image("CZ-visuals/FEI-ochranna-zona-CZ.png",
        width: 60%
      )
    )
  } else {
        move(dx: -18pt,
      dy: 0pt,
      image("EN-visuals/FEI-ochranna-zona-EN.png",
        width: 60%
      )
    )
  }
  
  heading(outlined: false, level: 2)[#thesisLang1]
  linebreak()

  [#set text(size: 14pt, spacing: 160%)
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
    #if language == "cs" [Bakalářská práce] else [Bachelor thesis]

    #if language == "cs" [Vedoucí práce:] else [Supervisor:] #supervisor

    Ostrava, #year
  ]
  pagebreak()
}



// Pages before Contents
#let generateBeforeContents(czechAbstract, englishAbstract, czechKeywords, englishKeywords, language, ackText) = {
  // Abstract
  heading(outlined: false, level: 2)[Abstrakt]
  linebreak()
  [#czechAbstract]

  heading(outlined: false, level: 2)[Klíčová slova]
  linebreak()
  for i in range(czechKeywords.len()) {
    [#czechKeywords.at(i)\; ]
  }

  for i in range(5) {
    linebreak()
  }

  heading(outlined: false, level: 2)[Abstract]
  linebreak()
  [#englishAbstract]

  heading(outlined: false, level: 2)[Keywords]
  linebreak()
  for i in range(czechKeywords.len()) {
    [#englishKeywords.at(i)\; ]
  }

  pagebreak()


  // Acknowledgement
  align(bottom)[
    #heading(outlined: false, level: 2)[
    #if language == "cs" [Poděkování] else [Acknowledgement]
  ]
  \
  #ackText
  ]
  set page(numbering: "1")
}



// Pages after Contents (headings corresp. to language)
#let assignmentTitle = ""
#let abbSymbTitle = ""
#let figuresListTitle = ""
#let tablesListTitle = ""

#if language == "cs" {
  assignmentTitle = "Zadání kvalifikační práce"
} else {
  assignmentTitle = "Thesis assignment"
}
    
#if language == "cs" {
  abbSymbTitle = "Seznam použitých zkratek a symbolů"
} else {
  abbSymbTitle = "List of symbols and abbreviations"
}
  
#if language == "cs" {
  figuresListTitle = "Seznam obrázků"
} else {
  figuresListTitle = "List of Figures"
}
  
#if language == "cs" {
  tablesListTitle = "Seznam tabulek"
} else {
  tablesListTitle = "List of Tables"
}

