#let listChapters = {
  show outline.entry.where(level: 1): it => {
    v(1em)
    text(size: 1.25em, weight: "bold")[#it]
  }
  // Contents
  outline(indent: 1.2em, fill: repeat[#h(.6em).])
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
