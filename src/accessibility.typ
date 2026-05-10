#let translations = (
  "fallback": (
    "times": "×",
    "power": "^",
    "plus": "+",
    "minus": "−",
  ),
  "en": (
    "times": "times",
    "power": "to the power of",
    "plus": "plus",
    "minus": "minus",
  ),
  "de": (
    "times": "mal",
    "power": "hoch",
    "plus": "plus",
    "minus": "minus",
  ),
  "fr": (
    "times": "fois",
    "power": "à la puissance",
    "plus": "plus",
    "minus": "moins",
  ),
  "es": (
    "times": "veces",
    "power": "elevado a",
    "plus": "más",
    "minus": "menos",
  ),
  "it": (
    "times": "per",
    "power": "alla potenza di",
    "plus": "più",
    "minus": "meno",
  ),
  "ru": (
    "times": "на",
    "power": "в степени",
    "plus": "плюс",
    "minus": "минус",
  ),
)

#let prefixes = (
  "en": (
    "a": "atto",
    "f": "femto",
    "p": "pico",
    "n": "nano",
    "µ": "micro",
    "m": "milli",
    "c": "centi",
    "d": "deci",
    "da": "deca",
    "h": "hecto",
    "k": "kilo",
    "M": "mega",
    "G": "giga",
    "T": "tera",
    "P": "peta",
    "E": "exa",
  ),
  "de": (
    "p": "piko",
    "µ": "mikro",
    "c": "zenti",
    "d": "dezi",
    "da": "deka",
    "h": "hekto",
  ),
  "fr": (
    "d": "déci",
    "da": "déca",
    "M": "méga",
    "T": "téra",
    "P": "péta",
  ),
  "ru": (
    "a": "атто",
    "f": "фемто",
    "p": "пико",
    "n": "нано",
    "µ": "микро",
    "m": "милли",
    "c": "санти",
    "d": "деци",
    "da": "дека",
    "h": "гекто",
    "k": "кило",
    "M": "мега",
    "G": "гига",
    "T": "тера",
    "P": "пета",
    "E": "экса",
  ),
  "es": (:),
  "it": (
    "k": "chilo",
    "h": "etto",
  ),
  "da": (
    "h": "hekto",
    "p": "piko",
    "µ": "mikro",
  ),
  "po": (
    "h": "hekto",
    "k": "quilo",
    "d": "decy",
    "da": "deka",
    "c": "centy",
    "m": "mili",
    "p": "piko",
    "µ": "mikro",
  ),
)
#let generate-alt-description(info, translation: auto) = {
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
        + str(info.base)
        + " "
        + translation.power
        + " "
        + info.e
    )
  }

  description
}
