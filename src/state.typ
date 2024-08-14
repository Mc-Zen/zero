
#let num-state = state("num-state", (
  digits: auto,
  fixed: none,
  product: sym.times,
  decimal-marker: ".",
  tight: false,
  omit-unit-mantissa: true,
  positive-sign: false,
  positive-sign-exponent: false,
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
//      positive-sign
//      

// num.mantissa: omit-unit-mantissa?
//               digits
// num.uncertainty: mode

// num.exponent: positive-sign
//               base
//               multiplier/times/product


