#let titlePage(
  thesisTitle,
  thesisDescription,
  fullName,
  supervisor,
  type: "bachelor", // bachelor, bachelor-practice, master or phd
  year: datetime.today().year(),
) = {
  // Overwrite some global rules
  set par(
    first-line-indent: 0cm,
    justify: false,
  )
  move(
    dx: -8mm,
    context (
      image(
        if text.lang == "en" { "logos/FEI EN.svg" } else { "logos/FEI CZ.svg" },
        height: 3cm,
      )
    ),
  )

  set text(spacing: .3em, font: "Calibri")
  [
    #v(3em)

    #text(size: 24pt, weight: "bold")[#thesisTitle]

    #text(size: 14pt)[#thesisDescription]

    #v(2em)
    #text(size: 24pt, weight: "bold")[#fullName]
  ]

  align(bottom)[
    #set text(size: 14pt)
    #context (
      [
        #if type == "bachelor" {
          if text.lang == "en" [Bachelor thesis] else [Bakalářská práce]
        } else if type == "bachelor-practice" {
          if text.lang == "en" [Bachelor professional practice] else [Bakalářská praxe]
        } else if type == "master" {
          if text.lang == "en" [Master thesis] else [Diplomová práce]
        } else if type == "phd" {
          if text.lang == "en" [PhD thesis] else [Disertační práce]
        }

        #if text.lang == "en" [Supervisor:] else [Vedoucí práce:]
      ]
    )
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

    align(bottom)[
      #heading(outlined: false, level: 2)[
        #context (if text.lang == "en" [Acknowledgment] else [Poděkování])
      ]
      #acknowledgment
    ]
  }
}
