#import "lang.typ" as lang

/// Generate first page of the thesis.
///
/// -> content
#let titlePage(
  /// Title of the thesis in Czech or English.
  /// -> content | str
  thesisTitle,
  /// Title of the thesis in the other language.
  /// -> content | str
  thesisDescription,
  /// Full name of the thesis author.
  /// -> content | str
  fullName,
  /// Full name of the supervisor, including all titles.
  /// -> content, str
  supervisor,
  /// Type of the thesis displayed at the bottom.
  /// -> "bachelor" | "bachelor-practice" | "master" | "phd" | "semestral"
  thesisType: "bachelor",
  /// Year the thesis was released, `auto` (default) for current year.
  /// -> auto, content, str
  year: auto,
  /// `auto` for VŠB FEI logo (3cm in height, as required), `none` for no logo and any content for custom logo.
  /// -> auto, content, none
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

    #text(size: 24pt, weight: "bold")[#thesisTitle]

    #text(size: 14pt)[#thesisDescription]

    #v(2em)
    #text(size: 24pt, weight: "bold")[#fullName]
  ]

  if year == auto {
    year = datetime.today().year()
  }

  v(1fr)
  // Stuff at page bottom
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



/// Generate all required pages after assignment page and before outlines.
///
/// This includes abstracts and keywords in Czech, English and optionally Slovak (all placed in a grid), acknowledgment and a custom quote.
///
/// -> content
#let abstracts(
  /// Text of the Czech abstract.
  /// -> content | str
  czechAbstract,
  /// Text of the English abstract.
  /// -> content | str
  englishAbstract,
  /// Czech keywords in an array.
  /// -> array
  czechKeywords,
  /// English keywords in an array.
  /// -> array
  englishKeywords,
  /// Text of the Slovak abstract.
  /// -> content | str | none
  slovakAbstract: none,
  /// Slovak keywords in an array.
  /// -> array
  slovakKeywords: none,
  /// Custom quote, included at the top of the acknowledgment page.
  /// -> content | str | none
  quote: none,
  /// Acknowledgement, at the bottom of a page after abstracts.
  /// -> content | str | none
  acknowledgment: none,
  /// Spacing between each abstract (and keyword) language.
  /// -> array | auto | length | type
  abstractSpacing: 2.5cm,
) = {
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

  // Page with acknowledgment and/or quote
  if acknowledgment != none and quote != none {
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
