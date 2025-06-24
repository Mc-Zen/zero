
#set page(width: auto, height: auto, margin: 1em)

#let clr = if "dark" in sys.inputs { white } else { black }
#set page(fill: white) if clr == black
#set page(fill: none) if clr != black

#set text(fill: clr)
#set text(1.2em)
#set table(stroke: clr + .5pt)
#set table(stroke: (x, y) => {
  if y == 0 { (bottom: clr + .6pt) }
  if x > 0 { (left: clr + .6pt) }
})

#import "/src/zero.typ": zi


#let examples(..children) = {
  show raw: box.with(
    fill: if clr == white { none } else { luma(90%) }, 
    outset: (y: .3em), 
    inset: (x: 0.3em), 
    radius: 0.2em
  )
  set raw(lang: "typc")
  table(
    stroke: (x, y) => if x > 0 { (left: .5pt + clr) },
    columns: 2, 
    ..children.pos()
  )
}


#table(
  columns: 3,
  stroke: none,
  [Case], [Notation], [Examples],
  table.hline(stroke: clr),
  [Unit in\ the numerator], [Use the unit abbreviation], 
  examples(
    `let m = zi.declare("m")`, zi.m(),
    `let kg = zi.declare("kg")`, zi.kg(),
  ),
  [Unit in\ the denomiator], [Prepend a dash],
  examples(
    `let m-s = zi.declare("m/s")`, zi.m-s(),
    `let N-mm = zi.declare("N/mm")`, (zi.declare("N/mm"))(),
    `let _-s = zi.declare("1/s")`, (zi.declare("1/s"))()
  ),
  [Exponent], [Append exponent number], 
  examples(
    `let m2 = zi.declare("m^2")`, (zi.declare("m^2"))(),
    `let kgm-s2 = zi.declare("kg m/s^2")`, (zi.declare("kg m/s^2"))(),
  ),

)