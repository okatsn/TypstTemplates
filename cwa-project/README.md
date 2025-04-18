# README

Here is the structure of this template:

    .
    ├── README.md
    ├── apply.typ
    ├── report.typ
    ├── combine_apply.sh
    ├── compile_apply.sh
    ├── dvc.yaml
    ├── main.bib
    ├── chapters
    │   ├── apply.typ
    │   └── report.typ
    ├── contents
    │   ├── background_survey.typ
    │   ├── brief_summary.typ
    │   ├── gantt_plot.typ
    │   ├── goals.typ
    │   └── method_steps.typ
    ├── information
    │   └── config.typ
    └── src
        ├── apply.typ
        ├── report.typ
        └── diagbox.typ

Here are some keynotes and the logic behind this template:

- The CWA projects contains two documents, `./apply.typ` is the document for applying the project; `./report.typ` is the product of the project.
- `src` should include neither `contents/*` nor `chapters/*`, but may contain `information/*`.
    - The document layout, format settings and specialized functions that can be applied in `./apply.typ`, resides in `src/apply.typ`.
    - The document layout, format settings and specialized functions that can be applied in `./report.typ`, resides in `src/report.typ`.
    - In practice, you can `dvc import` the entire `src` directory to your project.
- Main document (`./apply.typ` or `./report.typ`) imports `chapters` and `information` materials, but no `contents/*`.
- Chapter documents (`chapters/*`) import `contents/*`, and may import `src/*` only when necessary.
- Contents (`contents/*`) should include no `src/*`, any formatting, layout or custom function. Let contents as pure text contents as possible **EXCEPT** figures, equations and citations.