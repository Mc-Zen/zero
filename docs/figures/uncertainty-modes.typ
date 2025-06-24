#import "/src/zero.typ": *
#import "@preview/cetz:0.4.0"

#set page(width: auto, height: auto, margin: 1em, fill: none)

#let clr = if "dark" in sys.inputs { white } else { black }
#set page(fill: white) if clr == black
#set text(fill: clr)

#set raw(lang: "typc")
#set table.cell(inset: .6em)
#set table(
  fill: (x, y) => if calc.rem(y, 2) == 0 { gray.transparentize(80%) },
  stroke: none
)

#let examples = (
  "1.7+-.2",
  "6.2+-2.1",
  "1.7+.2-.5",
  "1.7+2-5",
)


#table(
  columns: 4,
  [Input], `"separate"`, `"compact"`, `"compact-separator"`,
  table.hline(),
  ..examples.map(
    c => (
      raw("num(\"" + c + "\")"),
      num(c, uncertainty-mode: "separate"),
      num(c, uncertainty-mode: "compact"),
      num(c, uncertainty-mode: "compact-separator"),
    )
  ).join()
)