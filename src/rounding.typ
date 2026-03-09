#import "assertions.typ": *


/// Count the leading zeros in a string of digits
#let count-leading-zeros(
  /// A string of digits
  /// -> str
  string,
) = {
  string.len() - string.trim("0", at: start).len()
}


/// Rounds an integer given as a string of digits to a given digit place.
#let round-integer(
  /// The integer string to round.
  /// -> str
  integer,
  /// The digit place to round to.
  place,
  /// The rounding direction.
  /// -> "nearest" | "towards-infinity" | "towards-negative-infinity" | "towards-zero" | "away-from-zero"
  dir: "nearest",
  /// How to round ties.
  /// -> "away-from-zero" | "towards-zero" | "to-odd" | "to-even" | "towards-infinity" | "towards-negative-infinity"
  ties: "away-from-zero",
  /// The sign of the number.
  /// -> "+" | "-"
  sign: "+",
) = {
  if place == 0 { return "" }
  if dir == "towards-infinity" {
    if sign == "+" { dir = "away-from-zero" } else { dir = "towards-zero" }
  }
  if dir == "towards-negative-infinity" {
    if sign == "-" { dir = "away-from-zero" } else { dir = "towards-zero" }
  }

  if dir == "towards-zero" {
    return integer.slice(0, place)
  } else if dir == "away-from-zero" {
    let x = float(integer.slice(0, place) + "." + integer.slice(place))
    integer = str(int(calc.ceil(x)))
  } else if dir == "nearest" {
    let fractional = integer.slice(place)
    if fractional.trim("0", at: end) == "5" {
      if ties == "away-from-zero" {} else if ties == "towards-zero" {
        fractional = "4"
      } else if ties == "to-even" {
        let ls-integer-digit = integer.slice(place - 1, place)
        if calc.even(int(ls-integer-digit)) {
          fractional = "4"
        }
      } else if ties == "to-odd" {
        let ls-integer-digit = integer.slice(place - 1, place)
        if calc.odd(int(ls-integer-digit)) {
          fractional = "4"
        }
      } else if ties == "towards-infinity" {
        let ls-integer-digit = integer.slice(place - 1, place)
        if sign == "-" {
          fractional = "4"
        }
      } else if ties == "towards-negative-infinity" {
        let ls-integer-digit = integer.slice(place - 1, place)
        if sign == "+" {
          fractional = "4"
        }
      }
    }
    let x = float(integer.slice(0, place) + "." + fractional)
    integer = str(int(calc.round(x)))
  }
  if place > integer.len() {
    integer = "0" * (place - integer.len()) + integer
  }
  return integer
}



#let get-rounding-digit(int, frac, mode, precision) = {
  let round-digit = precision + if mode == "places" {
    int.len()
  } else if mode == "figures" {
    count-leading-zeros(int + frac)
  }

  calc.max(round-digit, 0)
}

#let pad-decimal(int, frac, pad, mode, precision) = {
  let rounding-digit = get-rounding-digit(int, frac, mode, precision)

  rounding-digit = calc.max(0, rounding-digit)
  let number = int + frac

  if rounding-digit > number.len() {
    if type(pad) == std.int {
      let max-pad = rounding-digit - number.len()
      frac += "0" * calc.clamp(pad - precision + max-pad, 0, max-pad)
    } else if pad {
      frac += "0" * (rounding-digit - number.len())
    }
  }
  
  (int, frac)
}


#let round-decimal(

  /// Integer part of a decimal number. 
  /// -> str
  int,

  /// Fractional part of a decimal number. 
  /// -> str
  frac,

  /// The sign of the number. 
  /// -> "+" | "-"
  sign: "+",

  /// -> int
  precision: 2,

  /// -> "nearest" | "towards-infinity" | "towards-negative-infinity"
  dir: "nearest",

  ties: "away-from-zero",

  /// -> "places" | "figures"
  mode: "places",

) = {
  let rounding-digit = get-rounding-digit(int, frac, mode, precision)

  let number = int + frac

  if rounding-digit < number.len() {
    number = round-integer(
      number,
      rounding-digit,
      dir: dir,
      ties: ties,
      sign: sign,
    )
    let new-int-digits = int.len() + number.len() - rounding-digit
    if rounding-digit < int.len() {
      number += "0" * (int.len() - rounding-digit)
    }

    int = number.slice(0, new-int-digits)
    frac = number.slice(new-int-digits).trim("0", at: end)
  }

  (int, frac)
}

#round-decimal("123", "28", precision: -4)




/// Rounds (and/or pads) a number given by an integer part and a fractional part.
/// Different modes are supported.
#let round(
  /// Integer part. -> str
  int,
  /// Fractional part. -> str
  frac,
  sign: "+",
  /// Rounding mode.
  /// - `"places"`: The number is rounded to the number of places after the
  ///   decimal point given by the `precision` parameter.
  /// - `"figures"`: The number is rounded to a number of significant figures.
  /// - `"uncertainty"`: Requires giving the uncertainty. The uncertainty is rounded
  ///   to significant figures given by the `precision` argument and then the number
  ///   is rounded to the same number of places as the uncertainty.
  mode: none,
  /// The precision to round to. See parameter `mode` for the different modes.
  /// -> int
  precision: 2,
  /// Rounding direction.
  /// -> str
  direction: "nearest",
  ties: "away-from-zero",
  /// Determines whether the number should be padded with zeros if the number has less
  /// digits than the rounding precision. If an integer is given, determines the minimum
  /// number of decimal digits (`mode: "places"`) or significant figures (`mode: "figures"`)
  /// to display. The parameter `pad` has no effect in `mode: "uncertainty"`.
  /// -> bool | int
  pad: true,
  /// Uncertainty
  pm: none,
) = {
  if mode == none { return (int, frac, pm) }
  if mode == "uncertainty" and pm == none { return (int, frac, pm) }


  assert-option(mode, "round-mode", ("places", "figures", "uncertainty"))

  // Removal hint
  if direction == "down" {
    assert(
      false,
      message: "In zero:0.5.0, the rounding direction \"down\" has been renamed to \"towards-negative-infinity\"",
    )
  } else if direction == "up" {
    assert(
      false,
      message: "In zero:0.5.0, the rounding direction \"up\" has been renamed to \"towards-infinity\"",
    )
  }
  assert-option(direction, "round-direction", (
    "nearest",
    "towards-infinity",
    "towards-negative-infinity",
    "away-from-zero",
    "towards-zero",
  ))

  let round-digit
  if mode == "places" {
    round-digit = precision + int.len()
  } else if mode == "figures" {
    round-digit = precision + count-leading-zeros(int + frac)
  } else if mode == "uncertainty" {

    let is-symmetric = type(pm.first()) != array
    if is-symmetric {
      let places = count-leading-zeros(pm.join()) + precision - pm.first().len()

      pm = round-decimal(
        ..pm,
        dir: direction,
        precision: places, 
        mode: "places"
      )
      pm = pad-decimal(
        ..pm,
        pad, "places",
        places 
      )

      
      mode = "places"
      precision = places
    } else {

      let places = calc.max(
        ..pm.map(((i, f)) => count-leading-zeros(i + f) + precision - i.len())
      )
      mode = "places"
      precision = places
      pm = pm
        .map(((i, f)) => round-decimal(
          i, f,
          dir: direction,
          precision: places, mode: "places"
        ))
        .map(((i, f)) => pad-decimal(
          i, f,
          pad, "places",
          places 
        ))
    }
    
  }

  return (
    ..pad-decimal(
      ..round-decimal(
        int, frac, 
        precision: precision,
        mode: mode,
        dir: direction,
        sign: sign,
        ties: ties,
      ),
      pad, mode, precision
    ),
    pm
  )
}


#assert.eq(
  round(
    "1",
    "23",
    pm: (("0", "04"), ("0", "3")),
    precision: 1,
    mode: "uncertainty",
  ),
  ("1", "23", (("0", "04"), ("0", "30"))),
)

// #assert.eq(
//   round(
//     "1",
//     "234",
//     pm: (("0", "034")),
//     precision: 1,
//     mode: "uncertainty",
//   ),
//   ("1", "23", (("0", "04"))),
// )
