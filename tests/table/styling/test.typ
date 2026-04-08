#import "/src/zero.typ": *
#set page(width: auto, height: auto, margin: .5em)



#show table: format-table(none, auto)

#let strong_rows = (0,) // 0 is the header row
#show selector.or(
  ..strong_rows.map(r => table.cell.where(y: r))
): strong

#table(
  columns: 2,
  ["Version A"], [13.43e3],
  ["Version B"], [2.89043e3],
)
