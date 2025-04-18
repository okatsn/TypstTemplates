#import "src/apply.typ" as src
#import "chapters/apply.typ" as chapters
#show: src.template

= 壹、綜合資料

#colbreak()

= 貳、概括說明

#src.section_abstract(chapters.abstract_zh, chapters.abstract_en)

= 參、計畫內容

#src.section_content(chapters.background, chapters.method_steps)

#src.section_ganttchart((
  ([work 1 status], (1, 2)),
  ([work 2 status], (2, 3)),
  ([work 3 status], (3, 4)),
  ([work 4 status], (4, 5)),
  ([work 5 status], (5, 6, 7)),
  ([work 6 status], (7, 8, 9)),
  ([work 7 status], (9, 10, 11)),
  ([work 8 status], (11, 12)),
))
