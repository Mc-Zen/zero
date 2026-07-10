#import "/src/zero.typ": *
#set page(width: auto, height: auto, margin: 2pt)


#import "/src/units.typ": parse-unit
#import "/src/accessibility.typ": *
#import "/src/parsing.typ": parse-numeral
#import "/src/state.typ": num-state



#num[2+-0.2]\
#num(uncertainty-mode: "compact")[2+-0001.2]
#num[+1e.5]
#context {
  assert.eq(
    generate-num-alt-description(
      parse-numeral("-1.34+-2e-2") + num-state.get(),
    ),
    "minus 1.34 plus minus 2 times 10 to the power of -2",
  )
  assert.eq(
    generate-num-alt-description(
      parse-numeral("-1.34+0.5-2e-2") + num-state.get() + (base: 2),
    ),
    "minus 1.34 plus 0.5 minus 2 times 2 to the power of -2",
  )

  set text(lang: "de")
  context {
    assert.eq(
      generate-num-alt-description(
        parse-numeral("-1.34+-2e-2") + num-state.get()
      ),
      "minus 1,34 plus minus 2 mal 10 hoch -2",
    )
    assert.eq(
      generate-num-alt-description(
        parse-numeral("-1.34+0.5-2e-2")
          + num-state.get()
          + (base: 2),
      ),
      "minus 1,34 plus 0,5 minus 2 mal 2 hoch -2",
    )
  }
  set text(lang: "fr")
  context {
    assert.eq(
      generate-num-alt-description(
        parse-numeral("-1.34+-2e-2") + num-state.get(),
      ),
      "moins 1,34 plus moins 2 fois 10 à la puissance -2",
    )
    assert.eq(
      generate-num-alt-description(
        parse-numeral("-1.34+0.5-2e-2") + num-state.get() + (base: 2),
      ),
      "moins 1,34 plus 0,5 moins 2 fois 2 à la puissance -2",
    )
  }

  set text(lang: "be")
  context {
    assert.eq(
      generate-num-alt-description(
        parse-numeral("-1.34+-2e-2") + num-state.get(),
      ),
      "− 1.34 + − 2 × 10 ^ -2",
    )
    assert.eq(
      generate-num-alt-description(
        parse-numeral("-1.34+0.5-2e-2") + num-state.get() + (base: 2),
      ),
      "− 1.34 + 0.5 − 2 × 2 ^ -2",
    )
  }

  assert(unit-component-description("mm") == "millimeter")
  assert(unit-component-description("kg") == "kilogram")
  assert(unit-component-description("au") == "astronomical unit")
  assert(unit-component-description("aau") == "attoastronomical unit") // silly but it should work

  assert.eq(
    generate-unit-alt-description(
      ..parse-unit("m").values(),
    ),
    "meter",
  )
  assert.eq(
    generate-unit-alt-description(
      ..parse-unit("m^2/s^3").values(),
    ),
    "meter squared per second cubed",
  )

  // plural
  assert.eq(
    generate-unit-alt-description(..parse-unit("lx").values(), value: 2),
    "lux",
  )
  assert.eq(
    generate-unit-alt-description(..parse-unit("°C").values(), value: 2),
    "degrees Celsius",
  )
  assert.eq(
    generate-unit-alt-description(..parse-unit("m").values(), value: 2),
    "meters",
  )
  assert.eq(
    generate-unit-alt-description(..parse-unit("1/m").values(), value: 2),
    " per meter",
  )
  assert.eq(
    generate-unit-alt-description(..parse-unit("N s/m").values(), value: 2),
    "newton seconds per meter",
  )

  set text(lang: "de")
  context {
    assert.eq(
      generate-unit-alt-description(
        ..parse-unit("m^2/µs^3").values(),
      ),
      "Quadratmeter pro Kubikmikrosekunde",
    )
    assert.eq(
      generate-unit-alt-description(
        ..parse-unit("m^4/s/K").values(),
      ),
      "Meter hoch 4 pro Sekunde pro Kelvin",
    )
    assert.eq(
      generate-unit-alt-description(
        ..parse-unit("mN m").values(),
      ),
      "Millinewton Meter",
    )

    // Plural

    assert.eq(
      generate-unit-alt-description(..parse-unit("h").values(), value: 2),
      "Stunden",
    )
    assert.eq(
      generate-unit-alt-description(..parse-unit("d").values(), value: 2),
      "Tage",
    )
    assert.eq(
      generate-unit-alt-description(..parse-unit("T").values(), value: 2),
      "Tesla",
    )
    assert.eq(
      generate-unit-alt-description(..parse-unit("au").values(), value: 2),
      "astronomische Einheiten",
    )
  }

  set text(lang: "fr")
  context {
    assert.eq(
      generate-unit-alt-description(
        ..parse-unit("m^2/s^3/l^4").values(),
      ),
      "mètre carré par seconde cube par litre à la puissance 4",
    )
    assert.eq(
      generate-unit-alt-description(
        ..parse-unit("MN m").values(),
      ),
      "méganewton mètre",
    )

    assert.eq(
      generate-unit-alt-description(..parse-unit("h").values(), value: 2),
      "heures",
    )
    assert.eq(
      generate-unit-alt-description(..parse-unit("h").values(), value: 1.5),
      "heure",
    )
    assert.eq(
      generate-unit-alt-description(..parse-unit("h").values(), value: -0.5),
      "heure",
    )
    assert.eq(
      generate-unit-alt-description(..parse-unit("°C").values(), value: 2),
      "degrés Celsius",
    )
  }

  set text(lang: "sl")
  context {
    // [1/2] Tests the `phrases` the same way as English
    // No special rules apply, hence the copied tests
    assert.eq(
      generate-num-alt-description(
        parse-numeral("-1.34+-2e-2") + num-state.get(),
      ),
      "minus 1,34 plus minus 2 krat 10 na stopnjo -2",
    )
    assert.eq(
      generate-num-alt-description(
        parse-numeral("-1.34+0.5-2e-2") + num-state.get() + (base: 2),
      ),
      "minus 1,34 plus 0,5 minus 2 krat 2 na stopnjo -2",
    )

    // [2/3] Tests the `prefixes` in a single test
    // Use the `\u{00b5}` micro sign, not `\u{03bc}`
    assert.eq(
      unit-component-description("µA"),
      "mikroamper",
    )

    // [3/3] Tests the `units` in its own way

    let nums = (-5.5, -5, -3, -2, -1.0, -1, 0, 1, 1.0, 2, 3, 5, 5.5, "1/")

    // Slovenian units, not all but the first which are unique
    // The entries are `unit: (0, 1, 1.0, 2, 3, 5, 5.5, denominator's)`
    // A `3` and `4` are always the same, and made inseparable in the code, so only `3` is tested for
    // Since the negatives are supposed to be a complete mirror of the positives, the first half of the array is taken from the second
    // Rules which only apply at higher counts are tested for lower as well anyway
    let units-sl = (
      // Feminine, regular
      cd: ("kandel", "kandela", "kandele", "kandeli", "kandele", "kandel", "kandele", "kandelo"),

      // Masculine, regular
      A: ("amperov", "amper", "ampera", "ampera", "amperi", "amperov", "ampera", "amper"),

      // Masculine, special hardcoded
      d: ("dni", "dan", "dneva", "dneva", "dnevi", "dni", "dneva", "dan"),
      H: ("henrijev", "henri", "henrija", "henrija", "henriji", "henrijev", "henrija", "henri"),
      lm: ("lumnov", "lumen", "lumna", "lumna", "lumni", "lumnov", "lumna", "lumen"),
      T: ("tesel", "tesla", "tesle", "tesli", "tesle", "tesel", "tesle", "teslo"),

      // Masculine, special rule for `*ber/*ter`
      L: ("litrov", "liter", "litra", "litra", "litri", "litrov", "litra", "liter"),

      // Masculine, special rule for `*c/*j`
      Gy: ("grejev", "grej", "greja", "greja", "greji", "grejev", "greja", "grej"),

      // Combined words
      au: ("astronomskih enot", "astronomska enota", "astronomske enote", "astronomski enoti", "astronomske enote", "astronomskih enot", "astronomske enote", "astronomsko enoto"),
    sym.degree + "C": ("stopinj Celzija", "stopinja Celzija", "stopinje Celzija", "stopinji Celzija", "stopinje Celzija", "stopinj Celzija", "stopinje Celzija", "stopinjo Celzija"),
    )

    for (key, words) in units-sl {
      words = words.slice(1, -1).rev() + words
      if nums.len() != words.len() {
        panic("The `nums` and `words` arrays for `" + key + "` need to be of same length")
      }

      let pairs = nums.zip(words)
      let (denom, denom-unit) = pairs.pop()

      let guad(u, n) = generate-unit-alt-description(
        ..parse-unit(u).values(), value: n,
      )

      // All integer and float numbers
      for (count, unit) in pairs {
        assert.eq(guad(key, count), unit)
      }
      // When the unit is in a denominator; a hardcoded count here should be sufficient
      assert.eq(guad(denom + key, 99), " na " + denom-unit)
    }
  }
}




// #set document(title: "title")
// // Custom description
// #num(alt: "asd")[1.34]

// hELLO
// // Auto description
// #num[-1.34+-2]
// #num[-8.34(3)]
// #num[1.34+-2e-2]

// #set text(lang: "fr")
// #num[-1.34+-2]
// #num[-8.34(3)]
// #num[1.34+-2e-2]
#zi.m-s2[2]

// #set text(lang: "CA")
// #num[-1.34+-2]
// #num[-8.34(3)]
// #num[1.34+-2e-2]



// // Custom translation
// #num(alt: (
//   "times": "mul",
//   "power": "pow",
//   "plus": "plu",
//   "minus": "min",
// ))[1.34+-3e-7]
// #math.equation(alt: "high", $a+b$)
