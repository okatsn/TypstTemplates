#import "diagbox.typ"

#let subtitle(x) = text(
  size: 14pt,
  //   weight: "bold",
  stroke: 0.2pt, // Very slight stroke to simulate "boldness"
  x,
)

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
    margin: (top: 1.75cm, bottom: 2.54cm, left: 1.9cm, right: 1.9cm),
    numbering: "1", // numbering the page
    header: align(right)[
      // 交通部中央氣象署委託研究計畫申請書
    ], // small title on top of every page
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


// Common functions

#let sz10(x) = text(size: 10pt, x)
#let sz10c(x) = align(center)[#text(size: 10pt, x)]
#let sz11t(x) = align(top)[#text(size: 11pt, x)]

// Sections:

#let section_abstract(abs_zh, abs_en) = {
  table(
    columns: 1fr, // or simply `3`
    gutter: 0pt, // Default space between cells
    inset: 10pt,
    align: horizon,
    [#subtitle[一、中文計畫摘要：] #sz10[(請就全部計畫要點作一概述，以300字為限)]],
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
    [#subtitle[一、背景分析：] #sz10[(簡述本研究計畫之目的、重要性以及國內外有關本計畫之研究情況。)]],

    background,

    [#subtitle[二、研究方法及進行步驟：] #sz10[(其中研究方法請詳細說明(1)採用之方法(2)採用本方法之原因(3)預計可能遭遇之困難及解決途徑(4)重要儀器之配合使用情形。)]],

    method_steps
  )
}

// Gantt chart

#let gantt_row(work_name, months, note: "") = {
  let cells = ([#work_name],)

  // Create 12 month cells with ■ if the month is in the months array
  for month in range(1, 13) {
    if month in months {
      cells.push([■])
    } else {
      cells.push([])
    }
  }

  // Add the note cell with the provided content
  cells.push([#note])

  return cells
}


// Functions specifically for Typst

#let r90(q) = rotate(90deg, reflow: false, origin: center + horizon)[#q]
#let qr90(x) = [
  #v(-10pt) // Make "(" closer to "第"
  #r90[(]
  #v(-7pt) // Make "(" closer to "期"
  #text(top-edge: 4pt)[#x] // top-edge makes "期" "末" closer to each other.
  #v(-7pt) // Make ")" closer to "末"
  #r90[)]
  #v(-10pt) // Make ")" closer to "月"
]
#let sz9qr90(x) = text(size: 7pt)[#qr90(x)]



#let section_ganttchart(tasks) = {
  // Header row
  let rows = (
    (
      table.cell(colspan: 14)[#subtitle[三、預定進度甘梯圖（Gantt Chart）]],
    ),
    (
      diagbox.bdiagbox(inset: 10pt, height: 2cm, right_outer_sep: 2pt)[工作項目][年月],
      ..(
        [第#linebreak()1#linebreak()月],
        [第#linebreak()2#linebreak()月],
        [第#linebreak()3#linebreak()月],
        [第#linebreak()4#linebreak()月],
        [第#linebreak()5#linebreak()月],
        [第#linebreak()6#linebreak()月],
        [第#linebreak()7#linebreak()月],
        [第#linebreak()8#linebreak()月],
        [第#linebreak()9#linebreak()月],
        [第#linebreak()10#linebreak()月],
        [第#linebreak()11#linebreak()月],
        [第 #sz9qr90[期 #linebreak() 末] 月],
      ).map(v => sz10c(v)),
      [備註],
    ),
  )

  // Add task rows
  for task in tasks {
    if task.len() == 2 {
      let (name, months) = task
      rows.push(gantt_row(name, months))
    } else if task.len() == 3 {
      let (name, months, note) = task
      rows.push(gantt_row(name, months, note: note))
    }
  }

  table(
    columns: (
      4.0cm, // First column for work items (was 4cm)
      0.93cm, // Month columns with equal sizing
      0.93cm,
      0.93cm,
      0.93cm,
      0.93cm,
      0.93cm,
      0.93cm,
      0.93cm,
      0.93cm,
      0.93cm,
      0.93cm,
      0.93cm,
      1fr, // Last column for notes. Set with `*fr` to fit the table to page width.
    ),
    gutter: 0pt,
    inset: 10pt,
    align: horizon,
    ..rows.flatten(),
    // last rows
    sz10c[工作進度估計百分比（累積數）],
    ..([8%], [17%], [25%], [33%], [50%], [54%], [58%], [64%], [75%], [83%], [91%], [100%]).map(v => sz10c(v)), [],
    [預 定 查 核 點],
    table.cell(colspan: 7, stroke: none)[
      第1季:#linebreak()
      第2季:#linebreak()
      第3季:#linebreak()
      第4季:
    ],
    table.cell(colspan: 6, stroke: none)[
      第5季:#linebreak()
      第6季:#linebreak()
      第7季:#linebreak()
      第8季:#linebreak()
    ],
    table.vline(),
    table.cell(colspan: 14)[
      #table(
        columns: (1fr, 0.5fr, 10fr),
        stroke: none,
        inset: 5pt,
        sz11t[說明：], sz11t[(1)], sz11t[工作項目請視計畫性質及需要自行訂定。預定進度以粗線表示其起訖日期。],
        [],
        sz11t[(2)],
        sz11t[
          「工作進度百分比」欄係為配合管考作業所需，累積百分比請視工作性質就以下因素擇一估計訂定：
          #linebreak()
          1.工作天數2.經費之分配3.工作量之比重4.擬達成目標之具體數字。
        ],

        [],
        sz11t[(3)],
        sz11t[
          每季之「預定查核點」，請在條形圖上標明※號，並在「預定查核點」欄具體註明關鍵性工作要項。
        ],
      )
    ]
  )
}


// Final section

#let section_resultrefs(expectedResults, references) = {
  table(
    columns: 1fr, // or simply `3`
    gutter: 0pt, // Default space between cells
    inset: 10pt,
    align: horizon,
    [#subtitle[四、預期成果、效益及其應用] #sz10[(請先列述在執行期限內預期完成之工作項目及具體成果，若分年進行，得分年列述。並請按計畫性質在研究成果方面酌加說明：(1)對於有關之交通建設，預期可獲得何項效益？(2)對於學術理論系統之建立有何貢獻？)]],
    expectedResults,
    [#subtitle[五、重要有關文獻] #sz10[(請依次填寫本計畫所參考之重要文獻：包括參考書名稱、作者、出版社、出版日期、出版地點、或論文發表之作者、雜誌名稱、期別、日期與有關頁次等。)]],
    // This cannot be empty if any of the entry was cited.
    references
  )
}
