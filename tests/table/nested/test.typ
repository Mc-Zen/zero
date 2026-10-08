#import "/src/zero.typ": *
#set page(width: auto, height: auto, margin: .5em)

#set table(stroke: none)

// The outer column must be sized from its own cells only, including the one
// after the nested table, and the inner table keeps its own format.
#ztable(
  columns: 2,
  format: (none, auto),
  [before], "1.2",
  [nested], ztable(
    columns: 2,
    format: (auto, auto),
    "3.14", "2.0",
    "1000", "-1.5",
  ),
  [after], "12345.6",
)

#pagebreak()

// Nested table with surrounding outer numbers in several cells.
#ztable(
  columns: 3,
  format: (auto,) * 3,
  "1", "2.5", "300",
  "4000", ztable(
    columns: 1,
    format: (auto,),
    "12.34",
    "-0.5",
  ), "-6.7",
)
