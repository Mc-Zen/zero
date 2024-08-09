#show table.cell.where(y: 0): set text(style: "normal", weight: "bold")

#import "num.typ": *



#let ptable-counter = counter("__pillar-table__")

#let is-normal-cell(it, format) = {
  format.at(it.x, default: none) == none or number-to-string(it.body) == none
  /*or it.body.has("children")*/ 
}
    
#let call-num(cell, format, col-widths: auto) = {
  let args = if type(format.at(cell.x)) == dictionary { format.at(cell.x) } else { () }
  num(cell.body, align: (col-widths: col-widths, col: cell.x)) 
}



#let ztable(..children, format: none) = {
  if format == none { return table(..children) }
  if format == auto { format = (auto,) }
  assert.eq(type(format), array)
  
  ptable-counter.step()
  
  let table = context {
    
    // let table-end = label("__pillar-table__" + str(ptable-counter.get().first()))
    // let table-end = query(selector(heading).after(here())).first().location()
    let table-end = query(selector(<__pillar-table__>).after(here())).first().location()
    // let table-end = query(selector(<__pillar-table__>).after(here())).first().location()
    
    let number-infos = query(selector(<__pillar-num__>)
      .after(here())
      .before(table-end))
      .map(x => x.value)

    
    let debug-info = (counter: ptable-counter.get(), d: number-infos)

    if debug-info.counter == (1,) {
      let first-table-info = debug-info
    }

    if number-infos.len() == 0 { // first layout pass
      return {
        show table.cell: it => {
          if is-normal-cell(it, format) { it }
          else { call-num(it, format) }
        }    
        table(..children)
      }
    }
  
    // second layout pass
    let aligned-columns = range(format.len()).filter(x => format.at(x) != none)
    let col-widths = (none,) * format.len()
    for col in aligned-columns {
      let filtered-cells = number-infos.filter(x => x.at(0) == col)
      col-widths.at(col) = range(1, 5)
        .map(i => calc.max(0pt, ..filtered-cells.map(x => x.at(i))))
    }
      
    show table.cell: it => {
      if is-normal-cell(it, format) { it }
      else {
        let content = block(
          inset: it.inset,
          call-num(it, format, col-widths: col-widths.at(it.x))
        )
        if it.align == auto { content }
        else { align(it.align, content) }
      }
    }
    table(..children)
  }
  table + [#metadata(none)<__pillar-table__>]
  // table + [#box([Table ] + ptable-counter.display())<__pillar-table__>]
  // table + context [#box([Table ] + ptable-counter.display())#label("__pillar-table__" + str(ptable-counter.get().first()))]
}


#set-num(
  decimal-marker: ","
)


#set-num(
  // base: [2]
)



// #set align(right)

#ztable(
  columns: 2, format: (auto, auto),
  [0.1], [11,4],
  [53.1], [299792458],
  [2.000], [.001],
)

#set-num(
  base: [10]
)
// #set num(base: [10])


#ztable(
  align: center, columns: 4, format: (none, auto, auto, (decimal-marker: ".")),
  [Normal column], [Aligned Column ], [0.23+-.01e-300], [Data ],
  [1],             [252324.22+-3.1],  [.4e2],           [.38],
  [2],             [43.25+-9.33],     [22.3+-5e0.1],      [.3],
  [3], table.cell(rowspan: 2)[2,0+-55],   [2e23],           [], 
  [],                                 [A4(2)],               [.3],
)


// #[
//   #set align(right)
    
//   #ztable(
//     columns: 2, format: (auto, auto),
//     [Long Header ], [Header ],
//     [0.1], [11,4],
//     [53.1], [299792458],
//     [2.000], [.001],
//   )
// ]




// #ztable(
//   align: center, columns: 2, format: (auto,),
//   [e12], [12],
//   [0.2],[1145],
//   [100],[],
//   [0],[],
// )

// #ztable(
//   align: center, columns: 3, format: (none, auto, auto),
//   [], [2.3], [],
//   [], [2.111], [1],
// )


// #ztable(
//   align: center, columns: 2, format: (auto,),
//   [e12], [12],
//   [0.2],[1145],
//   [100],[],
//   [0],[],
// )

