#import "/src/zero.typ": *
#set page(height: auto, width: auto, margin: 5pt)


#set-num(group: (threshold: calc.inf))
// #set-round(mode: "figures", precision: 3, pad: false)
#num(0.2999, round: (precision: 3, pad: true))
#num(0.2999, round: (precision: 2, pad: true))
#num(0.2999, round: (precision: 1, pad: true)) 
#num(0.2999, round: (precision: 0, pad: true)) 

#num(0.2999, round: (precision: 3, pad: false))
#num(0.2999, round: (precision: 2, pad: false))
#num(0.2999, round: (precision: 1, pad: false)) 
#num(0.2999, round: (precision: 0, pad: false)) 
#pagebreak()

#let examples = (
  "2.10e4",
  "21000",
  "299.9",
  "0.030",
  299.9,
  // "0.000",
  .0003,
  0.2999,
  2.1e4,
)

#let tab = table(
//   stroke: none,
  columns: 2,
//   table.vline(x: 1),
//   table.vline(x: 0),
  ..examples.map(e => (raw(repr(e), lang: "typc"), num(e))).join()
)



#let p = grid(columns: (4cm,4.5cm, 4.6cm, 5.4cm), column-gutter: 1em)[
  == Auto exponent
  #set-num(exponent: auto)
  #tab
][
  == Sci
  #set-num(exponent: "sci")
  #tab
][
  == Eng
  #set-num(exponent: "eng")
  #tab
][
  == Fixed: 2
  #set-num(exponent: (fixed: 2))
  #tab
]


= `trim-zeros: false`
#p
= `trim-zeros: true`
#set-num(trim-zeros: true)
#p

= `trim-zeros: true` and round to 3 figures (with padding)
#set-round(precision: 3, mode: "figures", pad: true)
#p
= `trim-zeros: true` and round to 3 figures (without padding)
#set-round(pad: false)
#p


