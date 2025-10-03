#import "../src/slide.typ": *

#custom-title()

#custom-outline()

// Introduction
#SECTION[= Timeline and Milestone][
  - Timeline
  - Milestone
]


== Timeline

#slide[
  #set text(size: 0.6em)
  #let evtbxwidth = 5cm
  #timeline(
    interval: 1,
    startyear: 2016,
    endyear: 2025,
    events: (
      event(
        title: "MagTIP 演算法",
        year: 2019,
      ),
      event(
        title: "MagTIP 機率預報模式",
        year: 2020,
      ),
      event(
        title: "多變量 MagTIP 演算法",
        year: 2021,
      ),
      event(
        title: "GEMS-MagTIP 系統整合",
        year: 2022,
      ),
      event(
        title: "濾波頻段影響研究",
        year: 2023,
      ),
      event(
        title: "整合資訊理論",
        year: 2024,
      ),
    ),
    eventspans: (
      eventspan(
        title: strong[GEMSTIP 演算法],
        start-point: 2016,
        end-point: 2018,
        color: theme-color-configuration.colors.primary,
        box-width: evtbxwidth,
      ),
      eventspan(
        title: strong[MagTIP 發展期],
        start-point: 2019,
        end-point: 2022,
        color: theme-color-configuration.colors.quaternary-light,
        box-width: evtbxwidth,
      ),
      eventspan(
        title: strong[系統整合與分析期],
        start-point: 2022,
        end-point: 2025,
        color: theme-color-configuration.colors.secondary,
        box-width: evtbxwidth,
      ),
    ),
    length-of-timeline: 23,
    linestroke: 2pt + black,
    spanheight: 0.8,
  )

]


== Milestone


#slide(composer: (2fr, 1.4fr))[
  #set text(size: 0.7em)
  #grid(
    columns: (1fr, 0.8fr),
    gutter: 1em,
    [
      *測站中心導向的限制*
      - 單一測站代表整個 $R_C$ 範圍
      - 空間預報不均
      - 網格搜尋計算瓶頸
      - 測站覆蓋盲區
    ],
    [
      *網格中心導向的優勢*
      - 多站資料整合至單一網格單元
      - 空間上均勻且精細的TIP預報
    ],
  )

  #simple-rect(subtitle: [決策樹演算法：可解釋、易擴充、高效率的最佳化])[
    #set text(weight: "bold", size: 1.1em)
    計畫導入決策樹演算法實現高效率的格點預報
  ]

][
  #set text(size: 0.7em)

  #let items = (
    text()[缺失值與異常值的處理],
    text()[自相關分析：ACF/PACF 分析時間相依結構],
    text()[識別地電磁指標樣態 #right-arrow-c #hlc[特徵工程指引]],
    text(fill: gray)[發展降維技術解決特徵共線性問題],
  )
  #let items_next = (
    text(fill: gray)[特徵重要性分析],
    text(fill: gray, weight: "black")[整合決策樹演算法解決計算瓶頸],
    text(fill: gray)[提升模型穩定性與預測表現],
    text(fill: gray, weight: "black")[精細化高效能TIP預報],
  )

  #roadmap-diagram(
    items,
    highlight-at: items.len() - 2,
    title: [本期工作內容 \ #text(size: 0.7em)[自相關分析：邁向TIPTree的前置處理]
    ],
  )

  #roadmap-diagram(
    items_next,
    line-color: theme-color-configuration.colors.primary-light.lighten(50%),
    title: [未來展望],
  )

]

== Info-box and stacked simple-rect

#slide[
  #set text(size: 0.85em)
  #infobox(
    title: [地磁站的資訊理論指標所揭示的時間相依結構],
    type: "danger",
  )[
    - ACF/PACF 衰減快 #right-arrow-c #hlc[穩態]
    - ACF/PACF 在 lag 27 出現超越95%信賴區間的「丘狀」特徵 #linebreak() #right-arrow-c #hlc[$tilde 27$ 天週期的季節性變化]
  ]

  #set align(center)

  #set text(size: 0.7em, weight: "bold")

  #stack(
    simple-rect(alignment: left)[
      🌔 月球的軌道(公轉)週期 $tilde 27.3$ days
      @guoqing273day136dayAtmospheric2005
    ],
    simple-rect(alignment: left)[
      ☀️ 太陽的自轉週期 $tilde 27$ days
      @bartelsTwentysevenDayRecurrences1934
      @beckComparisonDifferentialRotation2000
    ],
  )

]

== Uncover

#slide(repeat: 3)[

  - item to show

  #uncover("2-")[
    - item to show
  ]

  #uncover("3-")[
    - item to show
  ]
]


== References

#slide()[

  #set page(columns: 2)
  #set text(size: 0.4em)
  #bibliography("../bibtex.bib", style: "springer-basic", title: none)

]




#show: appendix

#SECTION[= 附錄][


]

