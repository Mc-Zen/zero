#set page(height: auto, width: auto, margin: 5pt)

#let num(input) = {
  if "e" in input {
    let (value, e) = input.split("e")
    let sign = none
    if e.starts-with("-") {
      e = e.slice(1)
      sign = sym.minus
    }
    $value×10^(sign #e)$
  } else {
    $input$
  }
}

#num("0.300") #num("0.30") #num("0.3") #num("0") 

#num("0.3") #num("0.3") #num("0.3") #num("0")
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



#let p = grid(columns: (4cm,4.5cm, 4.6cm, 5.4cm), column-gutter: 1em)[
  == Auto exponent
][
  == Sci
][
  == Eng
][
  == Fixed: 2
]


= `trim-zeros: false`
#let ref-tab(values) = table(
  columns: 2,
  ..array.zip(
    examples.map(e => (raw(repr(e), lang: "typc"))),
    values.map(num)
  ).join()
)
#let refs(autoexp: (), sci: (), eng: (), fixed2: ()) = grid(
  columns: (4cm,4.5cm, 4.6cm, 5.4cm), 
  column-gutter: 1em)[
  == Auto exponent
  #ref-tab(autoexp)
][
  == Sci
  #ref-tab(sci)
][
  == Eng
  #ref-tab(eng)
][
  == Fixed: 2
  #ref-tab(fixed2)
]

#refs(
  autoexp: ("2.10e4", "21000", "299.9", "0.030", "299.9", "0.0003", "0.2999", "21000"),
  sci: ("2.10e4", "2.1000e4", "2.999e2", "3.0e-2", "2.999e2", "3e-4", "2.999e-1", "2.1000e4"),
  eng: ("21.0e3", "21.000e3", "299.9e0", "30e-3", "299.9e0", "300e-6", "299.9e-3", "21.000e3"),
  fixed2: ("210e2", "210.00e2", "2.999e2", "0.00030e2", "2.999e2", "0.000003e2", "0.002999e2", "210.00e2"),
)
= `trim-zeros: true`

#refs(
  autoexp: ("2.1e4", "21000", "299.9", "0.03", "299.9", "0.0003", "0.2999", "21000"),
  sci: ("2.1e4", "2.1e4", "2.999e2", "3e-2", "2.999e2", "3e-4", "2.999e-1", "2.1e4"),
  eng: ("21e3", "21e3", "299.9e0", "30e-3", "299.9e0", "300e-6", "299.9e-3", "21e3"),
  fixed2: ("210e2", "210e2", "2.999e2", "0.0003e2", "2.999e2", "0.000003e2", "0.002999e2", "210e2"),
)
= `trim-zeros: true` and round to 3 figures (with padding)


#refs(
  autoexp: ("2.10e4", "21000", "300", "0.0300", "300", "0.000300", "0.300", "21000"),
  sci: ("2.10e4", "2.10e4", "3.00e2", "3.00e-2", "3.00e2", "3.00e-4", "3.00e-1", "2.10e4"),
  eng: ("21.0e3", "21.0e3", "300e0", "30.0e-3", "300e0", "300e-6", "300e-3", "21.0e3"),
  fixed2: ("210e2", "210e2", "3.00e2", "0.000300e2", "3.00e2", "0.00000300e2", "0.00300e2", "210e2"),
)

= `trim-zeros: true` and round to 3 figures (without padding)


#refs(
  autoexp: ("2.1e4", "21000", "300", "0.03", "300", "0.0003", "0.3", "21000"),
  sci: ("2.1e4", "2.1e4", "3e2", "3e-2", "3e2", "3e-4", "3e-1", "2.1e4"),
  eng: ("21e3", "21e3", "300e0", "30e-3", "300e0", "300e-6", "300e-3", "21e3"),
  fixed2: ("210e2", "210e2", "3e2", "0.0003e2", "3e2", "0.000003e2", "0.003e2", "210e2"),
)