#import "parsing.typ": content-to-string

#let phrases = (
  "fallback": (
    "times": "×",
    "power": "^",
    "plus": "+",
    "minus": "−",
    "per": "/",
  ),
  "en": (
    "times": "times",
    "power": "to the power of",
    "plus": "plus",
    "minus": "minus",
    "per": "per",
  ),
  "de": (
    "times": "mal",
    "power": "hoch",
    "plus": "plus",
    "minus": "minus",
    "per": "pro",
  ),
  "fr": (
    "times": "fois",
    "power": "à la puissance",
    "plus": "plus",
    "minus": "moins",
    "per": "par",
  ),
  "es": (
    "times": "veces",
    "power": "elevado a",
    "plus": "más",
    "minus": "menos",
    "per": "por",
  ),
  "it": (
    "times": "per",
    "power": "alla potenza di",
    "plus": "più",
    "minus": "meno",
    "per": "per",
  ),
  "ru": (
    "times": "на",
    "power": "в степени",
    "plus": "плюс",
    "minus": "минус",
    "per": "в",
  ),
  "fi": (
    "times": "kertaa",
    "power": "potenssiin",
    "plus": "plus",
    "minus": "miinus",
    "per": "jaettuna",
  ),
)

#let prefixes = (
  en: (
    a: "atto",
    f: "femto",
    p: "pico",
    n: "nano",
    µ: "micro",
    m: "milli",
    c: "centi",
    d: "deci",
    da: "deca",
    h: "hecto",
    k: "kilo",
    M: "mega",
    G: "giga",
    T: "tera",
    P: "peta",
    E: "exa",
  ),
  // identical prefixes are inherited from English
  de: (
    a: "Atto",
    f: "Femto",
    p: "Piko",
    n: "Nano",
    µ: "Mikro",
    m: "Milli",
    c: "Zenti",
    d: "Dezi",
    da: "Deka",
    h: "Hekto",
    k: "Kilo",
    M: "Mega",
    G: "Giga",
    T: "Tera",
    P: "Peta",
    E: "Exa",
  ),
  fr: (
    d: "déci",
    da: "déca",
    M: "méga",
    T: "téra",
    P: "péta",
  ),
  es: (:),
  ru: (
    a: "атто",
    f: "фемто",
    p: "пико",
    n: "нано",
    µ: "микро",
    m: "милли",
    c: "санти",
    d: "деци",
    da: "дека",
    h: "гекто",
    k: "кило",
    M: "мега",
    G: "гига",
    T: "тера",
    P: "пета",
    E: "экса",
  ),
  it: (
    k: "chilo",
    h: "etto",
  ),
  fi: (
    a: "atto",
    f: "femto",
    p: "piko",
    n: "nano",
    µ: "mikro",
    m: "milli",
    c: "sentti",
    d: "desi",
    da: "deka",
    h: "hehto",
    k: "kilo",
    M: "mega",
    G: "giga",
    T: "tera",
    P: "peta",
    E: "eksa",
  ),
)

#let units = (
  en: (
    A: "ampere",
    au: "astronomical unit",
    B: "bel",
    Bq: "becquerel",
    C: "coulomb",
    cd: "candela",
    d: "day",
    Da: "dalton",
    dB: "decibel",
    sym.degree: "degree",
    sym.degree + "C": "degree Celsius",
    eV: "electronvolt",
    F: "farad",
    g: "gram",
    Gy: "gray",
    H: "henry",
    h: "hour",
    ha: "hectare",
    Hz: "hertz",
    J: "joule",
    K: "kelvin",
    kat: "katal",
    kg: "kilogram",
    L: "liter",
    lm: "lumen",
    lx: "lux",
    m: "meter",
    sym.prime: "arc minute",
    min: "minute",
    mol: "mole",
    sym.prime.double: "arc second",
    N: "newton",
    Np: "neper",
    sym.Omega: "ohm",
    Pa: "pascal",
    rad: "radian",
    s: "second",
    S: "siemens",
    sr: "steradian",
    Sv: "sievert",
    t: "tonne",
    T: "tesla",
    V: "volt",
    W: "watt",
    Wb: "weber",
  ),
  de: (
    // identical/similar units are inherited from English
    ha: "Hektar",
    sym.degree: "Grad",
    sym.degree + "C": "Grad Celsius",
    h: "Stunde",
    min: "Minute",
    s: "Sekunde",
    d: "Tag",
    kg: "Kilogramm",
    g: "Gramm",
    dB: "Dezibel",
    eV: "Elektronvolt",
    au: "astronomische Einheit",
    sym.prime.double: "Bogensekunde",
    sym.prime: "Bogenminute",
    mol: "Mol",
    A: "Ampère",
    B: "Bel",
    Bq: "Becquerel",
    C: "Coulomb",
    cd: "Candela",
    Da: "Dalton",
    F: "Farad",
    Gy: "Gray",
    H: "Henry",
    Hz: "Hertz",
    J: "Joule",
    K: "Kelvin",
    kat: "Katal",
    L: "Liter",
    lm: "Lumen",
    lx: "Lux",
    m: "Meter",
    N: "Newton",
    Np: "Neper",
    sym.Omega: "Ohm",
    Pa: "Pascal",
    rad: "Radian",
    S: "Siemens",
    sr: "Steradian",
    Sv: "Sievert",
    t: "Tonne",
    T: "Tesla",
    V: "Volt",
    W: "Watt",
    Wb: "Weber",
  ),
  fr: (
    A: "ampère",
    sym.degree: "degré",
    sym.degree + "C": "degré Celsius",
    h: "heure",
    m: "mètre",
    min: "minute",
    s: "seconde",
    d: "jour",
    au: "unité astronomique",
    sym.prime.double: "seconde d'arc",
    sym.prime: "minute d'arc",
    decibel: "décibel",
    eV: "électronvolt",
    g: "gramme",
    kg: "kilogramme",
    l: "litre",
    Np: "néper",
    sr: "stéradian",
  ),
  es: (
    A: "amperio",
    C: "culombio",
    sym.degree: "grado sexagesimal",
    sym.degree + "C": "grado Celsius",
    eV: "electronvoltio",
    F: "faradio",
    g: "gramo",
    kg: "kilogramo",
    l: "litro",
    m: "metro",
    ha: "hectárea",
    J: "julio",
    H: "henrio",
    Hz: "hercio",
    mol: "mol",
    sym.Omega: "ohmio",
    rad: "radián",
    sr: "esterorradián",
    t: "tonelada",
    V: "voltio",
    W: "vatio",
    h: "hora",
    min: "minuto",
    s: "segundo",
    d: "día",
    au: "unidad astronómica",
    sym.prime.double: "segundo de arco",
    sym.prime: "minuto de arco",
  ),
  it: (
    m: "metro",
    kg: "kilogrammo",
    g: "grammo",
    eV: "elettronvolt",
    sym.degree: "grado",
    sym.degree + "C": "grado Celsius",
    h: "ora",
    min: "minuto",
    s: "secondo",
    d: "giorno",
    rad: "radiante",
    sr: "steradiante",
    au: "unità astronomica",
    sym.prime.double: "secondo d'arco",
    sym.prime: "minuto d'arco",
  ),
  fi: (
    A: "ampeeria",
    au: "astronomista yksikköä",
    B: "beliä",
    Bq: "becquereliä",
    C: "coulombia",
    cd: "kandelaa",
    d: "päivää",
    Da: "daltonia",
    dB: "desibeliä",
    sym.degree: "astetta",
    sym.degree + "C": "Celsiusastetta",
    eV: "elektronivolttia",
    F: "faradia",
    g: "grammaa",
    Gy: "graytä",
    H: "henryä",
    h: "tuntia",
    ha: "hehtaaria",
    Hz: "hertsiä",
    J: "joulea",
    K: "kelviniä",
    kat: "katalia",
    kg: "kilogrammaa",
    L: "litraa",
    lm: "luumenia",
    lx: "luksia",
    m: "metriä",
    sym.prime: "kaariminuuttia",
    min: "minuuttia",
    mol: "moolia",
    sym.prime.double: "kaarisekuntia",
    N: "newtonia",
    Np: "neperiä",
    sym.Omega: "ohmia",
    Pa: "pascalia",
    rad: "radiaania",
    s: "sekuntia",
    S: "siemensiä",
    sr: "steradiaania",
    Sv: "sieverttiä",
    t: "tonnia",
    T: "teslaa",
    V: "volttia",
    W: "wattia",
    Wb: "weberiä",
  ),
)

// Register of the shorthands for special powers that a language has. This
// can be a string that is appended to the constituent unit (with a space) 
// or a function that takes the translated constituent unit. 
#let power-shorthands = (
  en: (
    "2": "squared",
    "3": "cubed",
  ),
  de: (
    "2": unit => "Quadrat" + lower(unit),
    "3": unit => "Kubik" + lower(unit),
  ),
  fr: (
    "2": "carré",
    "3": "cube",
  ),
  es: (
    "2": "al cuadrado",
    "3": "al cubo",
  ),
  it: (
    "2": "al quadrato",
    "3": "al cubo",
  ),
  fi: (
    "2": "toiseen",
    "3": "kolmanteen",
  ),
)

// How to form the plural of a constituent unit. For each language, this should
// be a function that takes a unit symbol string, e.g. "Hz".
#let pluralize = (
  en: unit => {
    let singular = units.en.at(unit)
    if unit in ("lx", "Hz", "S") {
      return singular
    }
    if unit == sym.degree + "C" {
      return "degrees Celsius"
    }
    if unit == "H" {
      return "henries"
    }
    return singular + "s"
  },
  
  de: unit => {
    let singular = units.de.at(unit)
    if unit in ("h", "min", "s", sym.prime.double, sym.prime, "t") {
      return singular + "n"
    }
    if unit == "au" {
      return singular + "en"
    }
    if unit == "d" {
      return singular + "e"
    }

    return singular
  },

  fr: unit => {
    let singular = units.fr.at(unit, default: units.en.at(unit))
    if unit in ("lx", "Hz", "S") {
      return singular
    }
    if unit == sym.degree + "C" { return "degrés Celsius" }
    if unit == sym.prime.double { return "secondes d'arc" }
    if unit == sym.prime { return "minutes d'arc" }
    if unit == "au" { return "unités astronomique" }
    return singular + "s"
  },
  
  es: unit => {
    let singular = units.es.at(unit, default: units.en.at(unit))
    if unit in ("lx", "Hz", "S") {
      return singular
    }
    if unit == sym.degree + "C" { return "grados Celsius" }
    if unit == "rad" { return "radianes" }
    if unit == "sr" { return "esterorradianes" }
    if (
      singular.endswith("o") or singular.endswith("y") or singular.endswith("a")
    ) {
      return singular + "s"
    } else {
      return singular + "es"
    }
  },
  
  it: unit => {
    let singular = units.it.at(unit, default: units.en.at(unit))
    if unit in ("J", "A", "T") { return singular }
    if unit == sym.degree + "C" { return "gradi Celsius" }
    if unit.endswith("o") or unit.endswith("e") {
      return singular.slice(0, -1) + "i"
    }
    if unit.endswith("a") { return singular.slice(0, -1) + "e" }
    return singular
  },
)


// How to join a prefix to a unit. This can be overridden for individual languages.
#let join-prefix-unit(
  /// The translated prefix, e.g. "milli"
  /// -> str
  prefix, 
  
  /// The translated unit, e.g. "meter".
  /// -> str
  unit, 
  
  /// The language code.
  /// -> str
  lang
) = {
  if lang == "de" {
    prefix + lower(unit)
  } else {
    prefix + unit
  }
}


// Check whether a quantity requires the (composed) unit to be in plural. This
// can be overridden for individual languages.
#let needs-plural(
  /// The value of the quantity, e.g. `1.5`.
  /// -> float
  value, 
  
  /// The language code.
  /// -> str
  lang
) = {
  if lang == "fr" {
    return calc.abs(value) >= 2
  }
  calc.abs(value) != 1
}


#let base-to-string(base) = {
  if type(base) == str {
    return base
  } else if type(base) in (int, float, symbol) {
    return str(base)
  } else if type(base) == content {
    if base.func() == math.equation {
      let result = content-to-string(base.body)
      if result != none {
        return result
      }
    }
  }

  assert(
    false,
    message: "Failed to convert base to string. Please provide a manual alt text for this numeral.",
  )
}

#let generate-num-alt-description(info, translation: auto) = {
  let lang = text.lang
  if translation == auto {
    translation = phrases.at(lang, default: phrases.fallback)
  }
  let format-comma-number(int, frac) = {
    if int.len() == 0 {
      int = "0"
    }
    int + if frac.len() > 0 { info.decimal-separator + frac }
  }

  let alt = ""
  alt += if info.sign == "-" { translation.minus + " " }
  alt += format-comma-number(info.int, info.frac)

  if info.pm != none {
    if type(info.pm.first()) == array {
      alt += (
        " " + translation.plus + " " + format-comma-number(..info.pm.first())
      )
      alt += (
        " " + translation.minus + " " + format-comma-number(..info.pm.last())
      )
    } else {
      alt += (
        " "
          + translation.plus
          + " "
          + translation.minus
          + " "
          + format-comma-number(..info.pm)
      )
    }
  }
  if info.e != none {
    alt += (
      " "
        + translation.times
        + " "
        + base-to-string(info.base)
        + " "
        + translation.power
        + " "
        + info.e
    )
  }

  alt
}


  

#let unit-component-description(component, plural: false) = {
  let lang = text.lang
  let units = units.en + units.at(lang, default: units.en)
  let get-unit(unit-code) = {
    if plural { (pluralize.at(lang))(unit-code) }
    else { units.at(unit-code) }
  }
  
  if type(component) in (symbol, str) {
    component = str(component)
    if component in units {
      return get-unit(component)
    }
    if component.len() > 1 {
      let prefixes = prefixes.en + prefixes.at(lang, default: prefixes.en)
      let clusters = component.clusters()
      let prefix = clusters.at(0)
      let unit = clusters.slice(1).join()
      if prefix in prefixes and unit in units {
        return join-prefix-unit(prefixes.at(prefix), get-unit(unit), text.lang)
      }
    }
  }
  assert(
    false,
    message: "Failed to auto-generate alt description for unit component "
      + repr(component)
      + ". Please provide a manual alt text for this unit.",
  )
}

#let generate-unit-alt-description(
  numerator,
  denominator,
  translation: auto,
  value: 1
) = {
  let lang = text.lang
  if translation == auto {
    translation = phrases.at(lang, default: phrases.fallback)
    if lang not in phrases {
      return none
    }
    // assert(
    //   lang in phrases,
    //   message: "Unsupported language "
    //     + lang
    //     + " for alt text generation. Please provide a manual alt text for this unit. Supported languages are: "
    //     + repr(phrases.keys())
    //     + ". If you want to contribute a translation for your language, please open a pull request.",
    // )
  }

  let alt = ""
  let power-shorthands = power-shorthands.at(lang, default: (:))

  let power-of-unit-component-description((unit-component, exponent), plural: false) = {
    let unit = unit-component-description(unit-component, plural: plural)
    if exponent == "1" { return unit }
    if exponent in power-shorthands {
      let power-shorthand = power-shorthands.at(exponent)
      if type(power-shorthand) == function {
        unit = power-shorthand(unit)
      } else {
        unit += " " + power-shorthand
      }
    } else {
      unit += " " + translation.power + " " + exponent
    }
    unit
  }


  let plural = needs-plural(value, lang)
  if numerator.len() > 0 {
    alt += (
      numerator.slice(0, -1).map(power-of-unit-component-description)
        + (power-of-unit-component-description(numerator.at(-1), plural: plural),)
    ).join(" ")
  }
  if denominator.len() > 0 {
    alt += " " + translation.per + " "
    alt += denominator
      .map(power-of-unit-component-description)
      .join(" " + translation.per + " ")
  }

  alt
}

