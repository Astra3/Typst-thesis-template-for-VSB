/// The main show rule for the template to set up typographic requirements from guidelines, linked in README.
///
/// This function sets up the page layout, fonts, heading sizes and spacing (inspied by LaTeX template), paragraph spacing, list indents, equation numbering. If writing in Czech, this function also appends unbreakable space to every single letter conjunction.
///
/// Font sizings in this function are optimized for Calibri font. You might need to overwrite font sizes of text and headings for better look with your font. Guidelines only say that the "default font size should be used;" interpret that however you want.
///
/// -> content
#let template(
  /// `true` if you want to use first line indentation (.5em) for splitting paragraphs. If `false`, the template will use 1.2em space between each paragraph. Guidelines do not specify any requirements for this, feel free to overwrite the spacing size later.
  /// -> bool
  first-line-indent: true,
  /// If `true`, the template will match code blocks from LaTeX template. You can disable this if you are styling the blocks yourself or are using the codly package.
  /// -> bool
  modify-raw: true,
  body,
) = {
  set page(
    margin: 2.5cm,
    // Default size from the official styleguide is "a4"
    // Funnily enough, the official latex template uses "us-letter"
    paper: "a4",
  )

  // Font text and size
  set text(
    // There are more fonts allowed, specified in template example
    font: "Calibri",
    size: 11pt,
  )

  show heading: set text(
    spacing: .3em,
    weight: "bold",
  )

  // Styling of headers and normal text
  show heading: set par(justify: false)
  show heading.where(level: 1): set block(spacing: 1.5cm)
  show heading.where(level: 1): set text(size: 25pt)
  show heading.where(level: 1): it => [
    #pagebreak()
    #it
  ]

  show heading.where(level: 2): set text(size: 18pt)
  show heading.where(level: 2): set block(spacing: .8cm)

  show heading.where(level: 3): set text(size: 14pt)

  set par(
    leading: 1em, // It was the most close to other works, the guidelines only specify spacing for Word
    justify: true,
    // line indenting is on by default, all parameter is kept as default, like in latex template
    first-line-indent: if first-line-indent { .5cm } else { 0pt },
    spacing: if first-line-indent { 1.2em } else { 2em },
  )

  set list(indent: 1.5em)
  set enum(indent: 1.5em)

  show figure: set block(spacing: 1.8em)
  show figure.where(kind: table): set figure.caption(position: top)

  if modify-raw {
    show raw.where(block: true): set block(
      stroke: (y: 1pt),
      inset: .8em,
      width: 100%,
    )

    show raw.where(block: false): set text(weight: "semibold")
  }

  // appends line break to all possible czech conjunctions
  show text.where(lang: "cs"): it => {
    let conjunctions = ("a", "A", "k", "K", "i", "I", "u", "U", "s", "S", "o", "O", "v", "V")
    show regex(" [" + conjunctions.join() + "] "): it => [ #it.text.trim()~]
    it
  }

  set math.equation(numbering: "(1)")
  body
}

/// Start thesis appendix.
///
/// Use as a show rule. Resets heading numbering and set it to alphabetical.
/// -> content
#let appendix(body) = {
  counter(heading).update(0)
  set heading(numbering: "A", supplement: [Appendix])
  body
}

/// Start heading numbering in thesis text.
///
/// Use as a show rule after outlines.
///
/// -> content
#let start-heading-numbering(
  body,
  /// Up to which depth headings should be numbered.
  /// -> int
  max-depth: 3,
  /// Typst adds some space even for headings that have no numbering if a numbering function is used (which is the case here). This offset is removed from headings that exceed `max_depth` to remove that space. Modify it if your font sizes and types are different.
  /// -> content
  no-number-offset: h(-.115cm),
) = {
  set heading(
    numbering: (..nums) => {
      if nums.pos().len() <= max-depth {
        numbering("1.1", ..nums)
      } else {
        no-number-offset
      }
    },
  )
  body
}
