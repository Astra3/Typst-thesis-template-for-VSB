// Heading for the assignment
#let assignmentHeading = context (
  heading(
    level: 1,
    outlined: false,
    if text.lang == "cs" [Zadání kvalifikační práce] else [Thesis assignment],
  )
)

#let headerChapters(body, headerHeadingPage: true) = {
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
