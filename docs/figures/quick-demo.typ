#import "/src/zero.typ": *
#import "@preview/cetz:0.4.0"

#set page(width: auto, height: auto, margin: 1em, fill: none)

#let clr = if "dark" in sys.inputs { white } else { black }
#set page(fill: white) if clr == black
#set text(1.4em, fill: clr)

#set raw(lang: "typc")
#set table.cell(inset: .6em)
#set table(
  fill: (x, y) => if calc.rem(y, 2) == 0 { gray.transparentize(80%) },
  stroke: none
)

#let examples = (
  `num("1.2e4")`       ,`num[1.2e4]`,
  `num("-5e-4")`       ,`num(fixed: -2)[0.02]`,
  `num("9.81+-.01")`   ,`num("9.81+0.02-.01")`,
  `num("9.81+-.01e2")` ,`num(base: 2)[3e4]`,
)


#table(
  columns: 4,
  [Code], [Output], table.vline(), [Code], [Output],
  table.hline(),
  ..examples.map(c => (c, eval(c.text, scope: (num: num)))).join()
)