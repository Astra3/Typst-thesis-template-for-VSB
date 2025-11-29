#import "lang.typ" as lang

/// Generate chapter outline.
///
/// -> content
#let listChapters(
  /// Max depth of outline entries. Keep the default.
  /// -> int
  max_depth: 3,
) = {
  show outline.entry.where(level: 1): it => {
    set text(size: 1.25em, weight: "bold")
    set block(above: 1.8em)
    it
  }

  set outline.entry(fill: repeat[#h(.6em).])
  // Contents
  outline(indent: 1.2em, depth: max_depth)
}

/// Generate figure outline.
///
/// -> content
#let listImages = {
  show outline: set heading(outlined: true)
  outline(
    title: lang.ling.linguify("outlineImages", from: lang.database),
    target: figure.where(kind: image),
  )
}

/// Generate table outline.
///
/// -> content
#let listTables = {
  show outline: set heading(outlined: true)
  outline(
    title: lang.ling.linguify("outlineTables", from: lang.database),
    target: figure.where(kind: table),
  )
}

/// Generate raw block outline.
///
/// -> content
#let listSourceCodes = {
  show outline: set heading(outlined: true)
  outline(
    title: lang.ling.linguify("outlineRaw", from: lang.database),
    target: figure.where(kind: raw),
  )
}

/// Get localized heading text for "Symbols and abbreviations" page.
///
/// -> content
#let listSymbolsTitle = {
  lang.ling.linguify("outlineAbbr", from: lang.database)
}

/// Generate "Symbols and abbreviations" page with specified symbols.
///
/// All symbols are automatically alphabetically sorted by their abbreviation. This is required by the guidelines.
///
/// -> content
#let listSymbols(
  /// Array of arrays with two items, first one being the abbreviations and second one its expansion. If `none`, only the heading is written.
  /// -> none | array
  symbols: none,
) = {
  heading(level: 1)[#listSymbolsTitle]
  if symbols != none {
    symbols = symbols.sorted(key: it => it.at(0))
    grid(
      columns: (25%, auto, auto),
      gutter: 15pt,
      ..for item in symbols {
        (
          item.at(0),
          [---],
          item.at(1),
        )
      },
    )
  }
}
