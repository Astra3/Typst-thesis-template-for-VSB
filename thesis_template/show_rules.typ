#let template(firstLineIndent: true, body) = {
  set page(
    margin: 2.5cm,
    // Default size from the official styleguide is "a4", however, the official latex template uses "us-letter" if you're a masochist
    paper: "a4",
  )

  // Font text and size
  set text(
    // There are more fonts allowed, visit the links above
    font: "Calibri",
    size: 11pt,
  )

  show heading: set text(
    spacing: .3em,
    weight: "bold",
  )

  // Styling of headers and normal text
  show heading.where(level: 1): set block(spacing: 1.5cm)
  show heading.where(level: 1): set text(size: 28pt)
  show heading.where(level: 1): it => [
    #pagebreak()
    #it
  ]


  show heading.where(level: 2): set text(size: 20pt)
  show heading.where(level: 2): set block(spacing: .8cm)

  show heading.where(level: 3): set text(size: 14pt)

  set par(
    leading: 1.2em, // Basically 120% of the font size
    justify: true,
    // line indenting is on by default, all parameter is kept as default, like in latex template
    first-line-indent: if firstLineIndent { .5cm } else { 0pt },
    spacing: if firstLineIndent { 1.2em } else { 2em },
  )

  set list(indent: 1.5em)
  set enum(indent: 1.5em)

  show figure.where(kind: table): set figure.caption(position: top)

  // TODO remove this once fix in typst gets released
  // PR at https://github.com/typst/typst/pull/6101
  show figure.where(kind: raw): set figure(supplement: "Výpis")
  show raw.where(block: true): set block(
    stroke: (y: 1pt),
    inset: .8em,
    width: 100%,
  )

  show raw.where(block: false): set text(weight: "semibold")

  // appends line break to all possible czech conjunctions
  show text.where(lang: "cs"): it => {
    let conjunctions = ("a", "A", "k", "K", "i", "I", "u", "U", "s", "S", "o", "O", "v", "V")
    show regex(" [" + conjunctions.join() + "] "): it => [ #it.text.trim()~]
    it
  }

  set math.equation(numbering: "(1)")
  body
}

#let appendix(body) = {
  counter(heading).update(0)
  set heading(numbering: "A", supplement: [Appendix])
  body
}

#let start_heading_numbering(body, max_depth: 3) = {
  set heading(
    numbering: (..nums) => {
      if nums.pos().len() <= max_depth {
        numbering("1.1", ..nums)
      }
    },
  )
  body
}
