
#import "../contents/brief_summary.typ"

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

#let expected_results = [
  預期結果@exampleArticle。
]

#let references = bibliography(
  "../main.bib",
  title: none,
  style: "council-of-science-editors",
) // ../ieee-withnote.csl
