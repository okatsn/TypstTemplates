#let common-info = (
  title: [
    Title
  ],
  shorttitle: [Short Title],
  subtitle: [Sub Title],
  authors: (
    [CCC],
    [HSI],
  ),
  department: [NCUES],
)


#let slide-info = (
  // SETME
  presenting-date: "xxxx-xx-xx", // Set `none` to show datetime.today(). See self-info in typst-src/slide.typ
)

// Define the header here if you need heading-mapping (see `my-header-map` in the main `slide.typ`)
#let headers = (
  sec1: (full: "Timeline and Milestone", short: "Timeline"),
  appendix: (full: "Appendices"),
)

#let heading-map = (
  // Map from full heading text to short text
  // KEYNOTE: It shows the short version on the top navigation bar.
  headers.sec1.full: headers.sec1.short,
)
