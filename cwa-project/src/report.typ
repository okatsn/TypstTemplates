#import "../information/config.typ" as info_project

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
  keywords_zh: info_project.keywords_zh,
  keywords_en: info_project.keywords_en,
) = [

  #txt18bc[主標題—子題]

  #align(
    center,
    text(stroke: 0.2pt)[
      作者1 作者2
      #linebreak()
      國立中央大學地球科學系

    ],
  )

  #txt18bc[摘要]

  #content_zh

  關鍵字：#keywords_zh

  #txt18bc[Abstract]

  #content_en

  keyword：#keywords_en
]
