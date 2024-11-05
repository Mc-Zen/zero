#import "num.typ": num


/// [internal function]
/// Parse a text-based unit specification. 
/// - Consecutive units can be separated by a space. 
///   (Why is this necessary? in "kg m" the "kg" needs to be close 
///    but distinguishable from the "m")
/// - Exponents are allowed as in "m^2"
/// - A unit in the denominator can be specified either with a negative
///   exponent "s^-1" or by adding a slash before "/s"
/// - Prefixes are allowed and should be preprended to the base unit without
///   a space in between. Example: `"/mm^2"`. Occurences of "mu" will be replaced
///   by the greek mu symbol. 
/// Returns: a dictionary with the keys "numerator" and "denominator",
/// both containing a list where each entry is a tuple with the unit symbol 
/// as the first element and the exponent as the second element. The exponent
/// is always positive. 
#let parse-unit-str(str) = {
  str += " "
  str = str.replace("mu", math.mu)
  let numerator = ()
  let denominator = ()
  let unit = ""
  let per = false
  let get-symbol-and-exponent(str, per) = {
      let pow-index = str.position("^")
      if pow-index == none { return (str, "1") }
      
      let exponent = str.slice(pow-index + 1)
      assert(exponent.len() > 0, message: "Invalid unit: missing exponent after \"^\"")
      exponent = exponent.trim("(").trim(")")
      let symbol = str.slice(0, pow-index)
      assert(symbol.len() != 0, message: "Invalid unit: an exponent needs to be preceeded by a unit")
      return (symbol, exponent)
  }
  for c in str {
    if c in "/ " { // both "/" and " " terminate the current unit
      if unit.len() == 0 { 
        if c == "/" { per = true } 
        continue 
      }
      
      let (symbol, exponent) = get-symbol-and-exponent(unit, per)
      if exponent.starts-with("-") {
        per = not per
        exponent = exponent.slice(1)
      }
      exponent = [#exponent]
      if unit != "1" { // make calls like "1/s" possible in addition to "/s"
        if per { denominator.push((symbol, exponent)) } 
        else { numerator.push((symbol, exponent)) }
      }
      per = false
      unit = ""
      
      if c == "/" { per = true } 
    } else {
      unit += c
    }
  }
  return (numerator: numerator, denominator: denominator)
}


/// [internal function]
/// Show a unit that has been parsed with @@parse-unit-str.
/// - per-mode (string): Mode for displaying the units in the denominator.
///         Options are "power", "fraction" and "symbol" like in siunitx
/// - interunit (content): Symbol to use between base units. 
#let show-unit(
  unit-spec,
  per-mode: "power",
  interunit: sym.space.thin
) = {
  let fold-units(arr, exp-multiplier) = {
    math.upright(arr.map(x => {
      let exponent = x.at(1)//
      if type(exponent) == "integer" { exponent*= exp-multiplier }
      else if exp-multiplier == -1 { exponent = sym.minus + exponent }
      if exponent in (1, [1]) { $#x.at(0)$ }
      else { $#x.at(0)^#exponent$ }
    }).join(interunit))
  }

  let numerator = fold-units(unit-spec.numerator, 1)
  if unit-spec.denominator.len() == 0  { return numerator }
  
  let denom-exp-multiplier = if per-mode == "power" { -1 } else { 1 }
  let denominator = fold-units(unit-spec.denominator, denom-exp-multiplier)
  
  if per-mode == "power" {
    // numerator may be empty!
    if unit-spec.numerator.len() == 0 { return denominator }
    return numerator + interunit + denominator
  }
  // for the two fractional modes the numerator cannot be empty
  if unit-spec.numerator.len() == 0 { numerator = $1$ }
  if per-mode == "fraction" {
    return $#numerator / #denominator $
  } else if per-mode == "symbol" {
    if unit-spec.denominator.len() > 1 {
      denominator = $(#denominator)$
    }
    // return numerator + h(0pt) + $\/$ + h(0pt) + denominator
    return $#numerator#h(0pt)\/#h(0pt)#denominator$
  } else {
    panic("Invalid per-mode: " + per-mode)
  }
}



#let qty(
  value, 
  unit,
  breakable: true
) = {
  num(value) // force parens around numbers with uncertainty
  sym.space.thin
  show-unit(parse-unit-str(unit))
}


#let define(unit) = (
  value => qty(value, unit)
)

#qty("1232+-2", "m/s")