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
    title: context (
      if text.lang == "en" [List of Figures] else [Seznam obrázků]
    ),
    target: figure.where(kind: image),
  )
}

#let listTables = {
  show outline: set heading(outlined: true)
  outline(
    title: context (
      if text.lang == "en" [List of Tables] else [Seznam tabulek]
    ),
    target: figure.where(kind: table),
  )
}

#let listSourceCodes = {
  show outline: set heading(outlined: true)
  outline(
    title: context (
      if text.lang == "en" [List of Source Code Listings] else [Seznam výpisů zdrojového kódu]
    ),
    target: figure.where(kind: raw),
  )
}

#let listSymbols(symbols) = {
  symbols = symbols.sorted(key: it => it.at(0))
  heading(level: 1)[#context (
      if text.lang == "en" [List of symbols and abbreviations] else [Seznam použitých zkratek a symbolů]
    )]
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
