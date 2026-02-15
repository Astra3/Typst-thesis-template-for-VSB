#import "lang.typ" as lang

/// Generate a heading for the assignment page, right after title page.
#let assignmentHeading = heading(
  level: 1,
  outlined: false,
  lang.ling.linguify("assignmentHeading", from: lang.database),
)

/// Write the current level 1 heading title into the page header in `body`.
///
/// **Should be used as a show rule!**
///
/// -> content
#let headerChapters(
  /// If `false`, the header will not be written into if the current page contains a level 1 heading. If `true`, pages with level 1 headings will have that heading in the header.
  /// -> bool
  headerHeadingPage: false,
  body,
) = {
  let headerHeading(text) = {
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
      let headingBefore = query(selector(heading.where(level: 1)).before(here())).last()

      let headingAfter = query(selector(heading.where(level: 1)).after(here())).first()

      // Checks if the heading on the next page is the same as on the current page
      if headingAfter.location().page() == here().page() {
        if headerHeadingPage { headerHeading(headingAfter.body) }
      } else {
        headerHeading(headingBefore.body)
      }
    },
  )
  body
}

/// Read file with current bibliography style.
///
/// -> bytes
#let bibliographyStyle = {
  read("iso690-numeric-brackets-cs.csl", encoding: none)
}
