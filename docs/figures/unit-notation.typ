
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

#import "/src/zero.typ": si


#let examples(..children) = {
  show raw: box.with(fill: luma(90%), outset: (y: .3em), inset: (x: .3em), radius: .2em)
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
    `let m = si.declare("m")`, si.m[],
    `let kg = si.declare("kg")`, si.kg[],
  ),
  [Unit in\ the denomiator], [Prepend a dash],
  examples(
    `let m-s = si.declare("m/s")`, si.m-s[],
    `let N-mm = si.declare("N/mm")`, (si.declare("N/mm"))[],
    `let _-s = si.declare("1/s")`, (si.declare("1/s"))[]
  ),
  [Exponent], [Append exponent number], 
  examples(
    `let m2 = si.declare("m^2")`, (si.declare("m^2"))[],
    `let kgm-s2 = si.declare("kg m/s^2")`, (si.declare("kg m/s^2"))[],
  ),

)