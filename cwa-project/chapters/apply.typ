#import "../src/apply.typ" as src

#import "../contents/brief_summary.typ"
#import "../contents/background_survey.typ"
#import "../contents/method_steps.typ"

#let abstract_zh = [

  中文摘要在這裡。請在這裡寫作，或引用#brief_summary.example_zh。

]

#let abstract_en = [

  Please write your English abstract here, or include#brief_summary.example_en.
]


#let background = [
  背景。
]

#let method_steps = [
  方法及步驟。
]

#let gantt_chart = src.section_ganttchart((
  ([work 1 status], (1, 2)),
  ([work 2 status], (2, 3)),
  ([work 3 status], (3, 4)),
  ([work 4 status], (4, 5)),
  ([work 5 status], (5, 6, 7)),
  ([work 6 status], (7, 8, 9, 10), [這是備註]),
  ([work 7 status], (9, 10, 11)),
  ([work 8 status], (11, 12)),
))

#let expected_results = [
  預期結果@exampleArticle。
]

#let references = bibliography(
  "../main.bib",
  title: none,
  style: "council-of-science-editors",
) // ../ieee-withnote.csl
