#import "num.typ": num, number-to-string


// #let ptable-counter = counter("__pillar-table__")

#let is-normal-cell(it, format) = {
  format.at(it.x, default: none) == none or number-to-string(it.body) == none 
}
    
#let call-num(cell, format, col-widths: auto) = {
  let args = if type(format.at(cell.x)) == dictionary { format.at(cell.x) } else { () }
  num(cell.body, align: (col-widths: col-widths, col: cell.x)) 
}



#let ztable(..children, format: none) = {
  if format == none { return table(..children) }
  if format == auto { format = (auto,) }
  assert.eq(type(format), array)
  
  // ptable-counter.step()
  
  let table = context {
    
    let table-end = query(selector(<__pillar-table__>).after(here())).first().location()
    
    let number-infos = query(selector(<__pillar-num__>)
      .after(here())
      .before(table-end))
      .map(x => x.value)

    
    // let debug-info = (counter: ptable-counter.get(), d: number-infos)


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
}
