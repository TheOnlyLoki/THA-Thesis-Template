# THA Thesis Template

An attempt to port the official THA LaTeX template to Typst, a more modern alternative that's much easier to author than a 40-year-old markup language.

## Quick Start

1. Install [Typst](https://github.com/typst/typst)
2. Edit `metadata.toml` with your thesis information
3. Write your content in `content/`
4. Compile: `typst compile --font-path=./fonts thesis.typ`

## Configuration

All settings are in `metadata.toml`:

```toml
[author]
name = "Your Name"
email = "your.email@tha.de"

[thesis]
title = "Your Thesis Title"
type = "Bachelorarbeit"
faculty = "Fakultät für\nInformatik"

[settings]
language = "de"  # "de" or "en"
```

## Page numbering and appendix

- Front matter (abstract, table of contents) uses roman page numbers.
- `#show: main-matter` after `#table-of-contents()` switches to arabic numbers starting at 1.
- `#show: appendix` before the first appendix chapter numbers chapters A, B, ... (equations (A.1), figures A.1).

See `thesis.typ` for both.

## Bibliography tips

Typst's IEEE style ignores the `organization` field of `@standard` entries. Use `publisher` (and `address`) instead:

```bibtex
@standard{iso15066,
  title     = {Robots and robotic devices -- Collaborative robots},
  publisher = {{International Organization for Standardization}},
  address   = {Geneva, Switzerland},
  number    = {ISO/TS 15066:2016},
  date      = {2016-02}
}
```

## License

CC0 1.0 Universal - Public Domain

---

Based on the official THA LaTeX template.
