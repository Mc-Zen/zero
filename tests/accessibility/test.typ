#import "/src/zero.typ": *
#set page(width: auto, height: auto, margin: 2pt)


#import "/src/units.typ": parse-unit
#import "/src/accessibility.typ": *
#import "/src/parsing.typ": parse-numeral
#import "/src/state.typ": num-state


#context {
  assert.eq(
    generate-num-alt-description(
      parse-numeral("-1.34+-2e-2") + num-state.get(),
    ),
    "-1.34 plus minus 2 times 10 to the power of -2",
  )
  assert.eq(
    generate-num-alt-description(
      parse-numeral("-1.34+0.5-2e-2") + num-state.get() + (base: 2),
    ),
    "-1.34 plus 0.5 minus 2 times 2 to the power of -2",
  )

  set text(lang: "de")
  context {
    assert.eq(
      generate-num-alt-description(
        parse-numeral("-1.34+-2e-2") + num-state.get() + (decimal-separator: ","),
      ),
      "-1,34 plus minus 2 mal 10 hoch -2",
    )
    assert.eq(
      generate-num-alt-description(
        parse-numeral("-1.34+0.5-2e-2") + num-state.get() + (base: 2,decimal-separator: ","),
      ),
      "-1,34 plus 0,5 minus 2 mal 2 hoch -2",
    )
  }
  set text(lang: "fr")
  context {
    assert.eq(
      generate-num-alt-description(
        parse-numeral("-1.34+-2e-2") + num-state.get(),
      ),
      "-1.34 plus moins 2 fois 10 à la puissance -2",
    )
    assert.eq(
      generate-num-alt-description(
        parse-numeral("-1.34+0.5-2e-2") + num-state.get() + (base: 2),
      ),
      "-1.34 plus 0.5 moins 2 fois 2 à la puissance -2",
    )
  }
  
  set text(lang: "be")
  context {
    assert.eq(
      generate-num-alt-description(
        parse-numeral("-1.34+-2e-2") + num-state.get(),
      ),
      "-1.34 + − 2 × 10 ^ -2",
    )
    assert.eq(
      generate-num-alt-description(
        parse-numeral("-1.34+0.5-2e-2") + num-state.get() + (base: 2),
      ),
      "-1.34 + 0.5 − 2 × 2 ^ -2",
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
  }

  set text(lang: "fr")
  context {
    assert.eq(
      generate-unit-alt-description(
        ..parse-unit("m^2/s^3/l^4").values(),
      ),
      "mètre carré par seconde cubique par litre à la puissance 4",
    )
    assert.eq(
      generate-unit-alt-description(
        ..parse-unit("MN m").values(),
      ),
      "méganewton mètre",
    )
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
// #zi.m-s2()

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
