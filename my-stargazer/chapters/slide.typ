#import "../typst-src/slide.typ": *

#custom-title()

#custom-outline()

// Introduction
// A transition page with:
#SECTION[
  // Left: Section title
  = Timeline and Milestone
][
  // Right: listed items (headers of subsections in this section)
  - Timeline
  - Milestone
]


== Timeline

#slide[
  #set text(size: 0.6em)
  #let evtbxwidth = 5cm
  // This is a horizontal timeline diagram where:
  // - x ticks: the timestamps in `year`
  // - an event points to a specific time point, showing a title adhere to a specific `year`.
  // - an event span is a rectangular that spans from `start-point` to `end-point` in `year` with transparent background color. Showing a range of a "phase" or "stage".
  #timeline(
    interval: 1,
    startyear: 2016,
    endyear: 2025,
    events: (
      event(
        title: "Milestone a in Event 2",
        year: 2019,
      ),
      event(
        title: "Milestone a in Event 2",
        year: 2020,
      ),
      event(
        title: "Multivariate MagTIP Algorithm",
        year: 2021,
      ),
      event(
        title: "GEMS-MagTIP System Integration",
        year: 2022,
      ),
      event(
        title: "Study of Filter Band Effects",
        year: 2023,
      ),
      event(
        title: "Integration of Information Theory",
        year: 2024,
      ),
    ),
    eventspans: (
      eventspan(
        title: strong[Span of Major Event 1],
        start-point: 2016,
        end-point: 2018,
        color: theme-color-configuration.colors.primary,
        box-width: evtbxwidth,
      ),
      eventspan(
        title: strong[Span of Major Event 2],
        start-point: 2019,
        end-point: 2022,
        color: theme-color-configuration.colors.quaternary-light,
        box-width: evtbxwidth,
      ),
      eventspan(
        title: strong[Span of Major Event 3],
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

// This is a slide split into two panel, left and right.
// `composer` defines the aspect ratio of left and right panel.
#slide(composer: (2fr, 1.4fr))[
  // left panel:
  #set text(size: 0.7em)
  #grid(
    columns: (1fr, 0.8fr),
    gutter: 1em,
    [
      *Station-centered limitations*
      - A single station representing the whole $R_C$ range
      - Uneven spatial forecasting
      - Computational bottleneck of grid search
      - Station coverage blind spots
    ],
    [
      *Grid-centered advantages*
      - Integration of multiple stations' data into a single grid cell
      - Spatially uniform and fine-grained TIP forecasts
    ],
  )

  #simple-rect(subtitle: [A supplementary description for the small information box])[
    #set text(weight: "bold", size: 1.1em)
    The content of information
  ]

][
  // right panel:
  #set text(size: 0.7em)

  #let items = (
    text()[Handling missing values and outliers],
    text()[ACF/PACF analysis],
    text()[GM indicator #right-arrow-c #hlc[Feature engineering]],
    text(fill: gray)[Dimensionality reduction],
  )
  #let items_next = (
    text(fill: gray)[Feature importance analysis],
    text(fill: gray, weight: "black")[Integrate decision-tree algorithms],
    text(fill: gray)[Improve model stability],
    text(fill: gray, weight: "black")[Refine high-performance TIP forecasting],
  )

  // `roadmap-diagram` is a vertical timeline-like diagram.
  // - takes `items` as an array of `text`.
  // - you can assign a `title` for this diagram
  // - use `highlight-at` to make the text of a specific item `strong`.
  #roadmap-diagram(
    items,
    highlight-at: items.len() - 2,
    title: [Current work \ #text(size: 0.7em)[Autocorrelation analysis: pre-processing towards TIPTree]
    ],
  )

  #roadmap-diagram(
    items_next,
    line-color: theme-color-configuration.colors.primary-light.lighten(50%),
    title: [Future outlooks],
  )

]

== Info-box and stacked simple-rect

#slide[
  #set text(size: 0.85em)
  #infobox(
    title: [The title for the major information box],
    type: "danger",
  )[
    - Key finding 1 #right-arrow-c #hlc[brief comment for this finding]
  ]

  #set align(center)

  #set text(size: 0.7em, weight: "bold")

  #stack(
    simple-rect(alignment: left)[
      🌔 Moon orbital (revolution) period $tilde 27.3$ days
      @guoqing273day136dayAtmospheric2005
    ],
    simple-rect(alignment: left)[
      ☀️ Sun's rotation period $tilde 27$ days
      @bartelsTwentysevenDayRecurrences1934
      @beckComparisonDifferentialRotation2000
    ],
  )

]

== Step workflow

#slide[
  #step-workflow(
    grid-columns: (1fr, 6fr),
    title: [Analysis workflow],
    [Step 1],
    [
      #let txt = [Compute QD/IQD on Taiwan catalog #linebreak() to produce stable trend]
      #only("1")[#hla(txt)]
      #only("2-")[#txt]
    ],
    [Step 2],
    [
      #let txt = [Construct time-lagged features #linebreak() from rainfall & solar flux]
      #only("2")[#hlb(txt)]
      #only("1,3-")[#txt]
    ],
    [Step 3],
    [
      #let txt = [ML validation with CART #linebreak() importance ranking]
      #only("3")[#hlc(txt)]
      #only("1-2,4")[#txt]
    ],
    [Key 4],
    [description 4],
    [Key 5],
    [description 5],
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

#SECTION[= Appendices][


]

