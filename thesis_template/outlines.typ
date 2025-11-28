#import "lang.typ" as lang

#let listChapters(max_depth: 3) = {
  show outline.entry.where(level: 1): it => {
    set text(size: 1.25em, weight: "bold")
    set block(above: 1.8em)
    it
  }

  set outline.entry(fill: repeat[#h(.6em).])
  // Contents
  outline(indent: 1.2em, depth: max_depth)
}

#let listImages = {
  show outline: set heading(outlined: true)
  outline(
    title: lang.ling.linguify("outlineImages", from: lang.database),
    target: figure.where(kind: image),
  )
}

#let listTables = {
  show outline: set heading(outlined: true)
  outline(
    title: lang.ling.linguify("outlineTables", from: lang.database),
    target: figure.where(kind: table),
  )
}

#let listSourceCodes = {
  show outline: set heading(outlined: true)
  outline(
    title: lang.ling.linguify("outlineRaw", from: lang.database),
    target: figure.where(kind: raw),
  )
}

#let listSymbolsTitle = {
  lang.ling.linguify("outlineAbbr", from: lang.database)
}

#let listSymbols(symbols: none) = {
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
