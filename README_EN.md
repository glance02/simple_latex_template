# English Thesis Template

This is a simplified English thesis template based on the original cumtthesis.cls, retaining core LaTeX document structure elements.

## Features

- Pure English template with Times New Roman font
- Standard academic paper formatting
- Proper page layout and margins
- Automatic table of contents generation
- Support for figures, tables, and mathematical formulas
- Bibliography support

## Compilation

To compile this thesis template, use the following commands with pdfLaTeX:

```bash
pdflatex thesis.tex
bibtex thesis
pdflatex thesis.tex
pdflatex thesis.tex
```

Or if you're using latexmk:

```bash
latexmk -pdf thesis.tex
```

## File Structure

```
.
├── thesis.tex              # Main thesis file
├── classTemplate.cls        # English thesis class file
├── ref.bib                  # Bibliography file
├── Chapter/                 # Chapter files directory
│   ├── abstract.tex         # Abstract
│   ├── introduction.tex     # Introduction chapter
│   ├── chapter1.tex          # Chapter 1
│   ├── test.tex             # Function testing
│   ├── appendix.tex         # Appendix
│   └── acknowledgements.tex # Acknowledgements
└── Assets/                  # Assets directory
    ├── Fonts/               # Font files
    └── Logos/               # Logo files
```

## Customization

You can customize the template by modifying the `classTemplate.cls` file or by adding your own content to the chapter files in the `Chapter/` directory.

## Notes

- This template uses pdfLaTeX for compilation
- Times New Roman font is used as the main font
- The template follows standard academic formatting conventions