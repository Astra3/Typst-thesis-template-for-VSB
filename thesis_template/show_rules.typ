#let template(body) = {
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
    // TODO spacing is questionable
    spacing: .3em,
    weight: "bold",
  )

  // Styling of headers and normal text
  // TODO font size is questionable
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
    first-line-indent: .5cm,  // Line indenting is on by default
  )

  // If you want spacing instead of line indenting, set it here and uncomment above
  //show par: set block(
  //  spacing: 2em,
  //)

  set list(indent: 1.5em)
  set enum(indent: 1.5em)

  show figure.where(kind: table): set figure.caption(position: top)
  // this will be working in next typst release
  show figure.where(kind: raw): set align(left)
  show raw.where(block: true): set block(
    stroke: (y: 1pt),
    inset: .8em,
    width: 100%
  )

  // If you want to set custom monospace font, do it here
  //show raw: set text(font: "Source Code Pro")
  show raw.where(block: false): set text(weight: "semibold")

  set math.equation(numbering: "(1)")
  body
}

#let appendix(body) = {
  counter(heading).update(0)
  set heading(numbering: "A", supplement: [Appendix])
  body
}
