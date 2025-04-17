#let subtitle(x) = text(size: 14pt, weight: "bold", x)

#let template(doc) = [
  #set text(
    // Set main text: https://typst.app/docs/reference/text/text/
    // font: "Noto Serif CJK TC",
    font: "AR PL UKai TW",
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

  #show heading.where(level: 1): it => [
    // Set top-level headers.
    #text(
      size: 16pt, // Larger size for emphasis
      fill: rgb(0, 0, 0), // Pure black for stronger appearance
      stroke: 0.3pt, // Very slight stroke to simulate "boldness"
      // This is a hack since no available weight variant for `font: "AR PL UKai TW",`.
    )[#it]
  ]

  // #set heading(numbering: "1.a.") // Numbering heading: https://typst.app/docs/reference/model/heading/

  // https://typst.app/docs/tutorial/advanced-styling/
  // #show: rest => columns(2, rest)

  #doc
]

#let section_abstract(abs_zh, abs_en) = {
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

#let section_content(background, method_steps) = {
  table(
    columns: 1fr, // or simply `3`
    gutter: 0pt, // Default space between cells
    inset: 10pt,
    align: horizon,
    [#subtitle[一、背景分析：] (簡述本研究計畫之目的、重要性以及國內外有關本計畫之研究情況。)],

    background,

    [#subtitle[二、研究方法及進行步驟：] (其中研究方法請詳細說明(1)採用之方法(2)採用本方法之原因(3)預計可能遭遇之困難及解決途徑(4)重要儀器之配合使用情形。)],

    method_steps
  )
}
