#import "lang.typ" as lang

#let titlePage(
  /// Title of the thesis
  thesisTitle,
  /// Thesis description
  thesisDescription,
  fullName,
  supervisor,
  thesisType: "bachelor",
  year: auto,
  logo: auto,
) = {
  // Overwrite some global rules
  set par(
    first-line-indent: 0cm,
    justify: false,
  )
  if logo == auto {
    move(
      // safe zone offset
      dx: -8mm,
      context (
        image(
          if text.lang == "en" { "logos/FEI EN.svg" } else { "logos/FEI CZ.svg" },
          height: 3cm,
        )
      ),
    )
  } else if type(logo) == content {
    logo
  }

  set text(spacing: .3em, font: "Calibri")
  [
    #v(3em)

    #text(size: 24pt, weight: "bold")[#thesisTitle]

    #text(size: 14pt)[#thesisDescription]

    #v(2em)
    #text(size: 24pt, weight: "bold")[#fullName]
  ]

  if year == auto {
    year = datetime.today().year()
  }

  v(1fr)
  [
    #set text(size: 14pt)
    #if thesisType == "bachelor" {
      lang.ling.linguify("bachelorThesis", from: lang.database)
    } else if thesisType == "bachelor-practice" {
      lang.ling.linguify("bachelorPractice", from: lang.database)
    } else if thesisType == "master" {
      lang.ling.linguify("masterThesis", from: lang.database)
    } else if thesisType == "phd" {
      lang.ling.linguify("phdThesis", from: lang.database)
    } else if thesisType == "semestral" {
      lang.ling.linguify("semestralProject", from: lang.database)
    }

    #lang.ling.linguify("supervisor", from: lang.database)
    #supervisor


    Ostrava, #year
  ]
}



// Pages before Contents
#let abstracts(
  czechAbstract,
  englishAbstract,
  czechKeywords,
  englishKeywords,
  slovakAbstract: none,
  slovakKeywords: none,
  quote: none,
  acknowledgment: none,
  abstractSpacing: 2.5cm,
) = {
  //show heading: set block(spacing: 1em)
  // Abstract
  grid(
    rows: (auto, auto, auto),
    row-gutter: abstractSpacing,
    {
      text(
        {
          heading(outlined: false, level: 2)[Abstrakt]
          czechAbstract

          heading(outlined: false, level: 2)[Klíčová slova]
          czechKeywords.join(", ")
        },
        lang: "cs",
      )
    },
    {
      text(
        {
          heading(outlined: false, level: 2)[Abstract]
          englishAbstract

          heading(outlined: false, level: 2)[Keywords]
          englishKeywords.join(", ")
        },
        lang: "en",
      )
    },
    if slovakAbstract != none and slovakKeywords != none {
      text(
        {
          heading(outlined: false, level: 2)[Abstrakt]
          slovakAbstract

          heading(outlined: false, level: 2)[Kľúčové slová]
          slovakKeywords.join(", ")
        },
        lang: "sk",
      )
    },
  )

  // Acknowledgement
  if acknowledgment != none {
    pagebreak()
    if quote != none {
      quote
    }

    v(1fr)

    heading(outlined: false, level: 2)[
      #lang.ling.linguify("acknowledgment", from: lang.database)
    ]
    acknowledgment
  }
}
