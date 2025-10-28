#import "../information/config.typ" as info

#let template(doc) = [
  #set text(
    // Set main text: https://typst.app/docs/reference/text/text/
    // font: "Noto Serif CJK TC",
    font: "AR PL UKai TW",
    size: 12pt,
  )

  // Set page: https://typst.app/docs/reference/layout/page/
  #set page(
    paper: "a4",
    margin: (top: 3cm, bottom: 2.5cm, left: 3cm, right: 3cm),
    numbering: "1", // numbering the page
    header: align(right)[
      // 交通部中央氣象署委託研究計畫申請書
    ], // small title on top of every page
  )

  #set par(
    // Set paragraph: https://typst.app/docs/reference/layout/par/
    justify: true, // Hyphenation will be enabled for justified paragraphs
    leading: 0.52em, // The spacing between lines
    first-line-indent: 2em,
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

  #show heading.where(level: 2): it => [
    // Set top-level headers.
    #text(
      size: 14pt, // Larger size for emphasis
      fill: rgb(0, 0, 0), // Pure black for stronger appearance
      stroke: 0.2pt, // Very slight stroke to simulate "boldness"
      // This is a hack since no available weight variant for `font: "AR PL UKai TW",`.
    )[#it]
  ]


  // Configure heading styles to match the document with custom numbering
  // Explain:
  // - `(..nums) => {...}` is a function where `..num` takes any number of arguments.
  // - `.pos()` extracts the actual numbers as an array. For example,
  //   - for `= L1 Heading` `values` will be `(1, )`
  //   - for `== L2 Heading` `values` will be `(1, 2)`
  //   - for `=== L3 Heading` `values` will be `(1, 2, 3)`
  #set heading(numbering: (..nums) => {
    let values = nums.pos()
    if values.len() == 1 {
      // Level 1: Chinese numerals with 、:
      // - If there are 1 numbers => Level 1 heading
      numbering("一、", ..values)
    } else if values.len() == 2 {
      // Level 2: Show as 3.1 (Arabic numerals):
      // - If there are 2 numbers => Level 2 heading
      numbering("1.1", ..values)
    } else {
      // Level 3 and beyond: Show full numbering:
      // - If there are 3 or more numbers => Level 3 + headings
      // - Example: `values = (3, 1, 2)` means Section 3, subsection 1 and sub-subsection 2
      numbering("1.1.1", ..values)
    }
  })

  // #set heading(numbering: "1.a.") // Numbering heading: https://typst.app/docs/reference/model/heading/

  // https://typst.app/docs/tutorial/advanced-styling/
  // #show: rest => columns(2, rest)

  #doc
]

#let txt18bc(x) = align(
  center,
  text(size: 18pt, stroke: 0.3pt, x),
)

#let abstract(
  content_zh,
  content_en,
  keywords_zh: info.keywords_zh,
  keywords_en: info.keywords_en,
  title_zh: info.title_zh,
) = [

  #txt18bc[#title_zh]

  #align(
    center,
    text(stroke: 0.2pt)[
      #info.authors.join(" ")
      #linebreak()
      #info.department

    ],
  )

  #txt18bc[摘要]

  #content_zh

  關鍵字：#keywords_zh.join("、")

  #txt18bc[Abstract]

  #content_en

  keyword：#keywords_en.join(", ")
]

