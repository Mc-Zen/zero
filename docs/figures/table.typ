#import "/src/zero.typ": *
#set page(width: auto, height: auto, margin: 4pt)


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

#let table1 = ztable(
  columns: 3,
  align: center,
  format: (none, auto, auto),
  $n$, $α$, $β$,
  [1],   [3.45],  [-11.1],
  [2],   [4.568], [-0.1],
  [3],   [12.2],  [-.02],
  [...], [24.1],  [-1.1],
  [10],  [234],   [-0.00234],
)



#let table2 = ztable(
  columns: 4,
  align: center,
  format: (none, auto, auto, (digits: 1)),
  $n$, $α$, $β$, $γ$,
  [1],   [3.45e2],  [-11.1+-3],       [0],
  [2],   [4.568e1], [-0.1+-1e4],      [1.23],
  [3],   [12.2e4],  [-.02+-.02],      [1],
  [...], [24.1e6],  [-1.1+-5],        [9.1],
  [10],  [234e200], [-0.00234+-.3e3], [1.1]
)

#table1

#pagebreak()

#table2
