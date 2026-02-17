#import "lang.typ" as lang

/// Generate first page of the thesis.
///
/// -> content
#let title-page(
  /// Title of the thesis in Czech or English.
  /// -> content | str
  thesis-title,
  /// Title of the thesis in the other language.
  /// -> content | str
  thesis-description,
  /// Full name of the thesis author.
  /// -> content | str
  full-name,
  /// Full name of the supervisor, including all titles.
  /// -> content | str
  supervisor,
  /// Type of the thesis displayed at the bottom.
  /// -> "bachelor" | "bachelor-practice" | "master" | "phd" | "semestral"
  thesis-type: "bachelor",
  /// Year the thesis was released, `auto` (default) for current year.
  /// -> auto | content | str
  year: auto,
  /// `auto` for VŠB FEI logo (3cm in height, as required), `none` for no logo and any content for custom logo.
  /// -> auto | content | none
  logo: auto,
) = {
  // Overwrite some global rules for the title page
  set par(
    first-line-indent: 0cm,
    justify: false,
  )
  // Displaying logo
  if logo == auto {
    move(
      // safe zone offset
      dx: -8mm,
      context (
        image(
          if text.lang == "en" { "logos/FEI EN.svg" } else { "logos/FEI CZ.svg" },
          // Height is required by guidelines
          height: 3cm,
        )
      ),
    )
  } else if type(logo) == content {
    logo
  }

  // Title and author's name
  set text(spacing: .3em, font: "Calibri")
  [
    #v(3em)

    #text(size: 24pt, weight: "bold")[#thesis-title]

    #text(size: 14pt)[#thesis-description]

    #v(2em)
    #text(size: 24pt, weight: "bold")[#full-name]
  ]

  if year == auto {
    year = datetime.today().year()
  }

  v(1fr)
  // Stuff at page bottom
  [
    #set text(size: 14pt)
    #if thesis-type == "bachelor" {
      lang.ling.linguify("bachelor-thesis", from: lang.database)
    } else if thesis-type == "bachelor-practice" {
      lang.ling.linguify("bachelor-practice", from: lang.database)
    } else if thesis-type == "master" {
      lang.ling.linguify("master-thesis", from: lang.database)
    } else if thesis-type == "phd" {
      lang.ling.linguify("phd-thesis", from: lang.database)
    } else if thesis-type == "semestral" {
      lang.ling.linguify("semestral-project", from: lang.database)
    }

    #lang.ling.linguify("supervisor", from: lang.database)
    #supervisor


    Ostrava, #year
  ]
}



/// Generate all required pages after assignment page and before outlines.
///
/// This includes abstracts and keywords in Czech, English and optionally Slovak (all placed in a grid), acknowledgment and a custom quote.
///
/// -> content
#let abstracts(
  /// Text of the Czech abstract.
  /// -> content | str
  czech-abstract,
  /// Text of the English abstract.
  /// -> content | str
  english-abstract,
  /// Czech keywords in an array.
  /// -> array
  czech-keywords,
  /// English keywords in an array.
  /// -> array
  english-keywords,
  /// Text of the Slovak abstract.
  /// -> content | str | none
  slovak-abstract: none,
  /// Slovak keywords in an array.
  /// -> array
  slovak-keywords: none,
  /// Custom quote, included at the top of the acknowledgment page.
  /// -> content | str | none
  quote: none,
  /// Acknowledgement, at the bottom of a page after abstracts.
  /// -> content | str | none
  acknowledgment: none,
  /// Spacing between each abstract (and keyword) language.
  /// -> array | auto | length | type
  abstract-spacing: 2.5cm,
) = {
  // Abstract
  grid(
    rows: (auto, auto, auto),
    row-gutter: abstract-spacing,
    {
      text(
        {
          heading(outlined: false, level: 2)[Abstrakt]
          czech-abstract

          heading(outlined: false, level: 2)[Klíčová slova]
          czech-keywords.join(", ")
        },
        lang: "cs",
      )
    },
    {
      text(
        {
          heading(outlined: false, level: 2)[Abstract]
          english-abstract

          heading(outlined: false, level: 2)[Keywords]
          english-keywords.join(", ")
        },
        lang: "en",
      )
    },
    if slovak-abstract != none and slovak-keywords != none {
      text(
        {
          heading(outlined: false, level: 2)[Abstrakt]
          slovak-abstract

          heading(outlined: false, level: 2)[Kľúčové slová]
          slovak-keywords.join(", ")
        },
        lang: "sk",
      )
    },
  )

  // Page with acknowledgment and/or quote
  if acknowledgment != none or quote != none {
    pagebreak()
    // Quote
    if quote != none {
      quote
    }

    v(1fr)

    // Acknowledgement
    if acknowledgment != none {
      heading(outlined: false, level: 2)[
        #lang.ling.linguify("acknowledgment", from: lang.database)
      ]
      acknowledgment
    }
  }
}
