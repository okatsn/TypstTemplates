#import "src/apply.typ" as src
#import "chapters/apply.typ" as chapters
#show: src.template

= 壹、綜合資料

#colbreak()

= 貳、概括說明

#src.section_abstract(chapters.abstract_zh, chapters.abstract_en)

= 參、計畫內容

#src.section_content(chapters.background, chapters.method_steps)

#colbreak()

#chapters.gantt_chart

#colbreak()

#src.section_resultrefs(chapters.expected_results, chapters.references)
