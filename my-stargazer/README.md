# README

Referring: [okatsn/my-stargazer](https://github.com/okatsn/my-stargazer)

## The structure of this template:

```
    .
    ├── README.md
    ├── slide.typ
    ├── config.typ
    ├── dvc.yaml
    ├── dvc.lock
    ├── bibtex.bib
    ├── assets/
    ├── chapters
    │   ├── ...
    │   └── slide.typ
    ├── contents
    │   ├── ...
    │
    └── src
        ├── slide.typ
        ├── ...

```


```bash
pkgver="0.0.3"
target_path=~/.local/share/typst/packages/local/my-stargazer/$pkgver
mkdir -p "$target_path"
git clone --branch $pkgver https://github.com/okatsn/my-stargazer.git "$target_path"
# Create symlink to your development directory
ln -s "$target_path" $(pwd)

```