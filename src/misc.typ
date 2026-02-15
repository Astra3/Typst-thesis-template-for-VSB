#import "lang.typ" as lang

/// Generate a heading for the assignment page, right after title page.
#let assignment-heading = heading(
  level: 1,
  outlined: false,
  lang.ling.linguify("assignment-heading", from: lang.database),
)

/// Write the current level 1 heading title into the page header in `body`.
///
/// **Should be used as a show rule!**
///
/// -> content
#let header-chapters(
  /// If `false`, the header will not be written into if the current page contains a level 1 heading. If `true`, pages with level 1 headings will have that heading in the header.
  /// -> bool
  header-heading-page: false,
  body,
) = {
  let header-heading(text) = {
    align(center)[
      #block(
        width: 100%,
        stroke: (bottom: 1pt + luma(120)),
        inset: (bottom: 2.5pt),
      )[
        #emph(text)
      ]
    ]
  }

  set page(
    header: context {
      let heading-before = query(selector(heading.where(level: 1)).before(here())).last()

      let heading-after = query(selector(heading.where(level: 1)).after(here())).first()

      // Checks if the heading on the next page is the same as on the current page
      if heading-after.location().page() == here().page() {
        if header-heading-page { header-heading(heading-after.body) }
      } else {
        header-heading(heading-before.body)
      }
    },
  )
  body
}

/// Read file with current bibliography style.
///
/// -> bytes
#let bibliography-style = {
  read("iso690-numeric-brackets-cs.csl", encoding: none)
}
