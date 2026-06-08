#import "parsing.typ": content-to-string

#let translations = (
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
    p: "piko",
    µ: "mikro",
    c: "zenti",
    d: "dezi",
    da: "deka",
    h: "hekto",
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
  ),
  fr: (
    A: "ampère",
    sym.degree: "degré",
    sym.degree + "C": "degré Celsius",
    h: "heure",
    em: "mètre",
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
    au: "unità astronomica",
    sym.prime.double: "secondo d'arco",
    sym.prime: "minuto d'arco",
  ),
)

#let special-powers = (
  en: (
    "2": "squared",
    "3": "cubed",
  ),
  de: (
    "2": "hoch 2",
    "3": "hoch 3",
  ),
  fr: (
    "2": "carré",
    "3": "cubo",
  ),
  es: (
    "2": "al cuadrado",
    "3": "al cubo",
  ),
  it: (
    "2": "al quadrato",
    "3": "al cubo",
  ),
)


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
    translation = translations.at(lang, default: translations.fallback)
  }
  let format-comma-number(int, frac) = {
    int + if frac != "" { info.decimal-separator + frac }
  }

  let description = ""
  description += if info.sign == "-" { "-" }
  description += format-comma-number(info.int, info.frac)

  if info.uncertainty != none {
    if type(info.uncertainty.first()) == array {
      description += (
        " "
          + translation.plus
          + " "
          + format-comma-number(..info.uncertainty.first())
      )
      description += (
        " "
          + translation.minus
          + " "
          + format-comma-number(..info.uncertainty.last())
      )
    } else {
      description += (
        " "
          + translation.plus
          + " "
          + translation.minus
          + " "
          + format-comma-number(..info.uncertainty)
      )
    }
  }
  if info.e != none {
    description += (
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

  description
}



#let unit-component-description(component) = {
  let units = units.en + units.at(text.lang, default: units.en)
  if component in units {
    return units.at(component)
  }
  if component.len() > 1 {
    let prefixes = prefixes.at(text.lang, default: prefixes.en)

    let prefix = component.at(0)
    let unit = component.slice(1)
    if prefix in prefixes and unit in units {
      return prefixes.at(prefix) + " " + units.at(unit)
    }
  }
  assert(
    false,
    message: "Failed to auto-generate alt description for unit component "
      + component
      + ". Please provide a manual alt text for this unit.",
  )
}

#let generate-unit-alt-description(
  numerator,
  denominator,
  translation: auto,
) = {
  let lang = text.lang
  if translation == auto {
    translation = translations.at(lang, default: translations.fallback)
    assert(
      lang in translations,
      message: "Unsupported language "
        + lang
        + " for alt text generation. Please provide a manual alt text for this unit. Supported languages are: "
        + repr(translations.keys())
        + ". If you want to contribute a translation for your language, please open a pull request.",
    )
  }


  let alt = ""
  let special-powers = special-powers.at(lang, default: (:))
  let power-of-unit-component-description((unit-component, exponent)) = {
    unit-component-description(unit-component)
    if exponent != "1" {
      if exponent in special-powers {
        " " + special-powers.at(exponent)
      } else {
        " " + translation.power + " " + exponent
      }
    }
  }
  alt += numerator
    .map(power-of-unit-component-description)
    .join(" ")
  if denominator.len() > 0 {
    alt += " " + translation.per + " "
    alt += denominator
      .map(power-of-unit-component-description)
      .join(" " + translation.per + " ")
  }
  alt
}
#context {
  // assert(generate-alt-description()
  assert(unit-component-description("mm") == "milli meter")
  assert(unit-component-description("kg") == "kilogram")
  assert(unit-component-description("au") == "astronomical unit")
  assert(unit-component-description("aau") == "atto astronomical unit") // doesn't make sense but it should work
}
