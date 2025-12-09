#import "utility.typ"

/// Converts a content value into a string if it contains only text nodes. 
/// Otherwise, `none` is returned. 
#let content-to-string(x) = {
  if x.has("text") {
    return x.text
  }

  if (
    x.has("children") 
      and x.children.len() != 0 
      and x.children.all(x => x.has("text"))
  ) {
    x.children.map(x => x.text).join()
  }
}



/// Same as @content-to-string but also extract special prefix and suffix elements. 
/// Returns `none`, if the content does not only contain text nodes and a tuple
/// `(text: str, prefix: content, suffix: content)` otherwise
#let content-to-string-table(x) = {
  if x.has("text") { 
    return (x.text, none, none)
  }

  if x.has("children") and x.children.len() != 0 {
    if x.children.all(x => x.has("text")){
      return (x.children.map(x => x.text).join(), none, none)
    }

    let main = none
    let prefix = none
    let suffix = none
    for child in x.children {
      if child.has("text") { main += child.text }
      else if child.func() == highlight {
        if main == none { prefix = child.body }
        else { suffix = child.body }
      }
      else { return none }
    }
    return (main, prefix, suffix)
  }
}

#let nonum = highlight



/// Converts the input into a string if the input is either
/// - an integer or a float,
/// - a string,
/// - or a content value that contains only text nodes but does not start 
///   or end with a space. 
/// In case of a failure, `none` is returned. 
/// The output is normalized, meaning that both decimals separators "," and 
/// "." are unified to "." and the minus symbol "−" is replaced by the 
/// ASCII "-" character. 
#let number-to-string(number) = {
  let result = if type(number) == str { 
    number 
  } else if type(number) in (int, float) { 
    str(number)
  } else if type(number) == content  { 
    content-to-string(number) 
  }
  
  if result in (none, "") { return none }
  
  result.replace(",", ".").replace("−", "-")
}

#let number-to-string-table(number) = {
  let result = if type(number) == str { 
    number 
  } else if type(number) in (int, float) { 
    str(number) 
  } else if type(number) == content  { 
    content-to-string-table(number) 
  }
  if result == none { return none }

  if type(result) != array { 
    result = (result, none, none)
  }

  if result.at(0) == "" { return none }

  result.at(0) = result.at(0).replace(",", ".").replace("−", "-")

  if result.len() == 0 or result.at(0).at(0) not in "0123456789+-." { 
    return none
  }

  result
}




/// Decomposes a string representing an unsigned floating point into
/// integer and fractional part. If either part is not present, it is
/// returned as an empty string. Returns `(integer, fractional)`.
/// Expects a normalized input string (see @number-to-string).
///
/// *Example:*
/// #example(`decompose-unsigned-float-string("9.81")`
#let decompose-unsigned-float-string(x) = {
  let components = x.split(".")
  if components.len() == 1 { 
    components.push("") 
  } else if components.len() > 2 {
    assert(false, message: "unparsable number `" + x + "`")
  }
  components
}




/// Decomposes a string representing a (possibly signed) floating point 
/// into integer and fractional part. If either part is not present, it 
/// is returned as an empty string. Returns `(sign, integer, fractional)` 
/// where the sign is either `"+"` or `"-"`. 
/// Expects a normalized input string (see @number-to-string).
///
/// *Example:*
/// #example(`decompose-signed-float-string("-9.81")`
#let decompose-signed-float-string(x) = {
  let sign = "+"
  if x.starts-with("-") {
    sign = "-"
    x = x.slice(1)
  } else if x.starts-with("+") { 
    x = x.slice(1)
  }
  
  (sign, ) + decompose-unsigned-float-string(x)
}



/// Decomposes a normalized number string into sign, integer, fractional,
/// uncertainty and exponent. Here, normalized means that the decimal separator
/// is `"."`, and `"+"`, `"-"` is used for all signs (as opposed to 
/// `"−"`). 
///
/// Sign, integer and fractional part are guaranteed to be valid (however, 
/// the latter two may be empty strings) while the uncertainty and the 
/// exponent may be none if not present. 
///
///
/// *Example:*
/// #example(`decompose-normalized-number-string("-10.2+-.3e3")`)
#let decompose-normalized-number-string(x) = {
  let original-number = x
  let e
  let pm
  let sign = "+"
  if "e" in x {
    let components = x.split("e")
    if components.len() > 2 { 
      assert(false, message: "Error while parsing `" + original-number + "`: Asymmetric uncertainties must be specified on both sides")
    }
    (x, e) = components
  }
  if x.starts-with("-") {
    sign = "-"
    x = x.slice(1)
  } else if x.starts-with("+") { x = x.slice(1) }

  let normalize-pm = false
  let pm-count = int("+" in x) + int("-" in x)
  if pm-count == 2 {
    if "+-" in x { (x, pm) = x.split("+-") }
    else {
      let p
      let m
      (x, m) = x.split("-")
      assert("+" in x, message: "Error while parsing `" + original-number + "`: Asymmetric uncertainties must start with the positive component")
      (x, p) = x.split("+")
      pm = (p, m)
    }
  } else if pm-count == 1 {
    assert(false, message: "Error while parsing `" + original-number + "`: Asymmetric uncertainties must be specified on both sides")
  } else if "(" in x {
    (x, pm) = x.split("(")
    assert(pm.ends-with(")"), message: "Error while parsing `" + original-number + "`: Unclosed parenthesized uncertainty")
    pm = pm.trim(")")
    normalize-pm = true
  }
  let (integer, fractional) = decompose-unsigned-float-string(x)
  if pm != none {
    if type(pm) == array {
      pm = pm.map(decompose-unsigned-float-string)
    } else {
      pm = decompose-unsigned-float-string(pm)
    }
    
    if normalize-pm {
      pm = utility.shift-decimal-left(..pm, digits: fractional.len())
    }
  }
  if integer == "" {
    integer = "0"
  }
  
  (int: integer, frac: fractional, sign: sign, pm: pm, e: e)
}




#let parse-numeral(input) = {
  let num-str = number-to-string(input)
  if num-str == none {
    assert(false, message: "Cannot parse the number `" + repr(it.number) + "`")
  }
  decompose-normalized-number-string(num-str)
}


#let compute-sci-digits(num-info) = {
  let integer = num-info.int
  let fractional = num-info.frac
  let e = if num-info.e == none { 0 } else { int(num-info.e) }

  let exponent = 0
  if integer == "0" {
    let leading-zeros = fractional.len() - fractional.trim("0", at: start).len()

    exponent = -leading-zeros - 1
  } else {
    exponent = integer.len() - 1
  } 
  exponent + e
}

#let compute-eng-digits(num-info) = {
  calc.floor(compute-sci-digits(num-info) / 3) * 3
}
