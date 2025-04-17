#let subtitle(x) = text(size: 14pt, weight: "bold", x)

#let template(doc) = [
  #set text(
    // Set main text: https://typst.app/docs/reference/text/text/
    font: "Noto Serif CJK TC",
    size: 12pt,
  )

  #set page(
    // Set page: https://typst.app/docs/reference/layout/page/
    paper: "a4",
    margin: (top: 1.75cm, bottom: 2.54cm, left: 1.9cm, right: 1.9cm),
    header: align(right)[
      交通部中央氣象署委託研究計畫申請書
    ],
    numbering: "1", // numbering the page
  )

  #set par(
    // Set paragraph: https://typst.app/docs/reference/layout/par/
    justify: true, // Hyphenation will be enabled for justified paragraphs
    leading: 0.52em, // The spacing between lines
  )

  // #set heading(numbering: "1.a.") // Numbering heading: https://typst.app/docs/reference/model/heading/

  // https://typst.app/docs/tutorial/advanced-styling/
  // #show: rest => columns(2, rest)

  #doc
]

#let abstract_section(abs_zh, abs_en) = {
  table(
    columns: 1fr, // or simply `3`
    gutter: 0pt, // Default space between cells
    inset: 10pt,
    align: horizon,
    [#subtitle[一、中文計畫摘要：] (請就全部計畫要點作一概述，以300字為限)],
    [
      #abs_zh
    ],
    [#subtitle[二、英文計畫摘要Abstract：]],
    [
      #abs_en
    ]
  )
}
