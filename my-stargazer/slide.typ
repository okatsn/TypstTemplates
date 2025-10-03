#import "src/slide.typ": *
// TODO: Incorporate [20250903預設點位勘點報告_hjc.docx](https://docs.google.com/document/d/1azFPgwpDXMdzwSRguYvwUHGxoMTcQdjd/edit?usp=drive_link&ouid=105275981073763649718&rtpof=true&sd=true) into the slide

#import "config.typ"
// KEYNOTE: For using touying
// - https://github.com/OrangeX4/typst-talk?tab=readme-ov-file
// - [Touying Gallery](https://github.com/touying-typ/touying/wiki)
//
// Useful packages
// - [showybox](https://typst.app/universe/package/showybox/)
//
// Themes:
// - https://touying-typ.github.io/docs/themes/stargazer/
// - https://touying-typ.github.io/docs/themes/dewdrop/#initialization





#let self-info = config-info(
  // KEYNOTE: This is `self.info` in the `...theme.with()` that you can refer.
  title: [#config.common-info.title_zh],
  subtitle: [#config.common-info.title_en],
  authors: config.common-info.authors,
  author: [#config.common-info.authors.join(" ")],
  short-title: [#config.common-info.short-title_zh], // if there is no "short-title", "title" will be presented at the bottom-left footer (`footer-c`) of the stargaze slide.
  // date: datetime.today(),
  date: if config.slide-info.presenting-date == none { datetime.today() } else { config.slide-info.presenting-date },
  institution: [#config.common-info.department],
  hello: [world], // You can define arbitrary information (in this example, use with `self.common-info.hello`)
)

// Show stargazer

#show: stargazer-theme.with(
  // Needs to be set in the final script (the typst file for rendering the document).
  aspect-ratio: "16-9",
  footer-columns: (25%, 10%, 1fr, 5em),
  self-info,
  footer-a: none, // by default it takes `info.author`
  // Explicitly list all configuration available.
  // KEYNOTE:
  // - Click on `stargazer-theme` to open `~/.cache/typst/packages/preview/touying/0.6.1/themes/stargazer.typ`
  // - Also see https://touying-typ.github.io/docs/build-your-own-theme
  config-common(
    // Go to `default-config` in ~/.cache/typst/packages/preview/touying/0.6.1/src/configs.typ to see the full list of what you can set.
    slide-fn: slide,
    show-strong-with-alert: false, // strong (`*xxx*`) will set to primary color when `true`.
    new-section-slide-fn: new-section-slide.with(
      numbered: false,
    ), // This is the official example. This won't take effect if you use `SECTION`.
  ),
  config-methods(
    cover: utils.semi-transparent-cover.with(alpha: 50%), // Set the transparency for the `uncover`ed object.
    init: (self: none, body) => {
      set text(size: 24pt, font: ("Tinos", "Source Serif 4", "Noto Serif CJK TC"))
      set list(marker: components.knob-marker(primary: self.colors.primary))
      show figure.caption: set text(size: 0.654em)
      show footnote.entry: set text(size: 0.654em)
      set footnote.entry(
        clearance: 0.2em, // A narrow gap between content and footnote.
        gap: 0.2em, // A narrower gap between entries.
        indent: 0em, // No indent
      )
      show math.equation: set text(
        size: 1em,
      ) // 1em is the same size as text. This is just the default value for showing how to set equation's attributes

      show heading: set text(fill: self.colors.primary)
      // Set heading numbering:
      // set heading(numbering: numbly("{1}.", default: "1.1"))
      show heading.where(level: 1): it => [
        // Set top-level headers.
        #text(
          size: 1.5em, // Larger size for emphasis
          stroke: 0pt, // You may assign slight stroke to simulate "boldness"
        )[#it]
      ]
      show heading.where(level: 2): it => [
        #text(
          size: 1.2em, // Larger size for emphasis
          stroke: 0.3pt, // Very slight stroke to simulate "boldness"
        )[#it]
      ]
      show link: it => if type(it.dest) == str {
        set text(fill: self.colors.primary)
        it
      } else {
        it
      }
      show figure.where(kind: table): set figure.caption(position: top)

      body
    },
    alert: utils.alert-with-primary-color,
    tblock: _tblock,
  ),
  theme-color-configuration,
)

#set figure(numbering: none)


#include "chapters/slide.typ"
