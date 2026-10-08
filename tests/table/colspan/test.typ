#import "/src/zero.typ": *
#set page(width: auto, height: auto, margin: .5em)

// Spanned aligned cells must keep their span in the second layout pass.

#ztable(
  columns: 3,
  format: (auto, auto, auto),
  table.cell(colspan: 2)[12.34], [5.6],
  [1.1], [2.2], [3.3],
)

#pagebreak()

#ztable(
  columns: 2,
  format: (auto, auto),
  table.cell(rowspan: 2)[12.34], [5.6],
  [2.2],
)

#pagebreak()

#ztable(
  columns: 3,
  format: (auto, none, auto),
  table.cell(colspan: 2, align: right)[1234], [5.6],
  [1.1], [2.2], [3.3],
)
