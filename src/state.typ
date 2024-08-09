
#let num-state = state("num-state", (
  times: sym.times,
  decimal-marker: ".",
  tight: false,
  omit-unit-mantissa: true,
  implicit-plus: false,
  implicit-plus-exponent: false,
  base: 10,
  uncertainty-mode: "separate"
))

#let group-state = state("group-state", (
  size: 3, 
  sep: sym.space.thin,
  threshold: 5
))

#let round-state = state("round-state", (
  mode: none,
  precision: 2,
  pad: true,
  direction: "nearest",
))


// num: decimal-marker
//      group-digits
//      group-size
//      group-sep
//      group-min-digits
//      tight
//      
//      omit-zero-exponent
//      implicit-plus
//      

// num.mantissa: omit-unit-mantissa?
//               digits
// num.uncertainty: mode

// num.exponent: implicit-plus
//               base
//               multiplier/times/product


