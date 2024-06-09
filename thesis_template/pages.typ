#let titlePage(
  thesisTitle,
  thesisDescription,
  fullName,
  supervisor,
  type: "bachelor",  // bachelor, bachelor-practice, master or phd
  year: datetime.today().year(),
) = {
  // Overwrite some global rules
  set par(
    first-line-indent: 0cm,
    justify: false,
  )
  move(
    dx: -8mm,
    context(
      image(
        if text.lang == "en" {"logos/FEI EN.svg"} else {"logos/FEI CZ.svg"},
        height: 3cm,
      )
    )
  )
  
  heading(outlined: false, level: 2)[#thesisTitle]

  v(1.5em)

  set text(spacing: .3em)

  text(size: 14pt)[#thesisDescription]

  v(2em)

  text(size: 20pt)[#fullName]

  align(bottom)[
    #set text(size: 14pt)
    #context([
      #if type == "bachelor" {
        if text.lang == "en" [Bachelor thesis] else [Bakalářská práce]
      } else if type == "bachelor-practice" {
        if text.lang == "en" [Bachelor professional practice] else [Bakalářská praxe]
      } else if type == "master" {
        if text.lang == "en" [Master thesis] else [Diplomová práce]
      } else if type == "phd" {
        if text.lang == "en" [Ph.D. thesis] else [Disertační práce]
      }

      #if text.lang == "en" [Supervisor:] else [Vedoucí práce:]
    ])
    #supervisor


    Ostrava, #year
  ]
}



// Pages before Contents
#let abstracts(czechAbstract, englishAbstract, czechKeywords, englishKeywords, acknowledgment: none) = {
  // Abstract
  heading(outlined: false, level: 2)[Abstrakt]
  czechAbstract

  heading(outlined: false, level: 2)[Klíčová slova]
  czechKeywords.join(", ")

  v(5cm)

  heading(outlined: false, level: 2)[Abstract]
  englishAbstract

  heading(outlined: false, level: 2)[Keywords]
  englishKeywords.join(", ")


  // Acknowledgement
  if acknowledgment != none {
    pagebreak()
    align(bottom)[
      #heading(outlined: false, level: 2)[
        #context(if text.lang == "en" [Acknowledgment] else [Poděkování])
      ]
      #acknowledgment
    ]
  }
}
