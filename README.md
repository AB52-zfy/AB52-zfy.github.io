# Apurv Bhushan's Portfolio

Personal portfolio built with [Quarto](https://quarto.org). Whenever changes
are pushed to `main`, `.github/workflows/publish.yml` renders the site and
publishes the generated files to the `gh-pages` branch.

GitHub Pages should be configured to deploy from the `gh-pages` branch and
`/(root)` folder.

## Preview locally

```bash
quarto preview
```

To build the site once without starting a preview server:

```bash
quarto render
```

The generated site is written to `_site/` locally. The workflow publishes it
to `gh-pages`; generated files are not committed to `main`.

## Site content

- `index.qmd`: homepage and profile
- `experience/`: experience pages
- `projects/`: project pages and project logs
- `coursework/`: coursework pages and homework PDFs
- `fun/`: personal side projects and experiments
- `theme/`: shared styles and light/dark palettes

Edit the relevant `.qmd` file to update page content. Replace a PDF at its
existing path to update an embedded document. When adding new assets, reference
them from the page and add them to the `resources` list in `_quarto.yml` when
needed.
