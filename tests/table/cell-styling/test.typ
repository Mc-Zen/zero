#import "/src/zero.typ": *
#set page(width: auto, height: auto, margin: .5em)

// Fill, stroke, inset and breakability of aligned cells must survive the
// second layout pass.

#ztable(
  columns: 2,
  format: (none, auto),
  table.cell(fill: rgb("#eeeeee"))[Text], [12.34],
  [Other], table.cell(fill: rgb("#ffeeee"))[5.6],
  [Third], table.cell(stroke: (bottom: 1pt + blue))[10000],
  [Fourth], table.cell(inset: 1em, breakable: false)[1.234],
)
