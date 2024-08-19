#import "/src/zero.typ"
#set page(width: auto, height: auto, margin: .5em)

#set table(stroke: none)

#zero.ztable(
  columns: 3,
  align: center,
  format: (none, auto, auto),
  $n$, $α$, $β$,
  table.hline(),
  [1], "2.3", [10000],
  [2], "2.33", [1.0], 
  [3], "12.3", [1993], 
  [4], ".001", [1.2], 
  [10], "17", [0], 
)

#pagebreak()

#zero.set-num(omit-unity-mantissa: true)

#zero.ztable(
  columns: 4,
  align: center,
  format: (auto,) * 4,
  $n$, $α$, $β$, $γ$,
  table.hline(),
  $Alpha$, "1.2+-2", "2e3", "1+-2e4",
  $Beta$, "12+-23", "66e98", "-17+-2e-4",
  $Gamma$, "0+-.2", "1e7", "-.23(2)e-4",
)

#pagebreak()

#zero.ztable(
  columns: 2,
  format: (auto, (decimal-separator: ",", fixed: 2)),
  "2.3", "3422",
  "10", "101",
)


#pagebreak()

// check that auto alignment works

#{
  set align(right)
    
  zero.ztable(
    columns: 2,
    format: (auto, (decimal-separator: ",", fixed: 2)),
    [ Long title], [ Defg ],
    table.hline(),
    "2.3", "3422",
    "10", "101",
  )

}