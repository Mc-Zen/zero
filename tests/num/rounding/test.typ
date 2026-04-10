#import "/src/rounding.typ": *
#import "/src/zero.typ": num, set-round




#assert.eq(round-integer("15", 1, dir: "nearest", ties: "away-from-zero"), "2")
#assert.eq(round-integer("25", 1, dir: "nearest", ties: "away-from-zero"), "3")
#assert.eq(
  round-integer("15", 1, dir: "nearest", ties: "away-from-zero", sign: "-"),
  "2",
)
#assert.eq(
  round-integer("25", 1, dir: "nearest", ties: "away-from-zero", sign: "-"),
  "3",
)

#assert.eq(round-integer("15", 1, dir: "nearest", ties: "towards-zero"), "1")
#assert.eq(
  round-integer("1235", 3, dir: "nearest", ties: "towards-zero"),
  "123",
)
#assert.eq(
  round-integer("1235", 3, dir: "nearest", ties: "towards-zero", sign: "-"),
  "123",
)

#assert.eq(round-integer("1135", 3, dir: "nearest", ties: "to-even"), "114")
#assert.eq(round-integer("1145", 3, dir: "nearest", ties: "to-even"), "114")
#assert.eq(
  round-integer("1135", 3, dir: "nearest", ties: "to-even", sign: "-"),
  "114",
)
#assert.eq(
  round-integer("1145", 3, dir: "nearest", ties: "to-even", sign: "-"),
  "114",
)

#assert.eq(round-integer("1135", 3, dir: "nearest", ties: "to-odd"), "113")
#assert.eq(round-integer("1145", 3, dir: "nearest", ties: "to-odd"), "115")
#assert.eq(
  round-integer("1135", 3, dir: "nearest", ties: "to-odd", sign: "-"),
  "113",
)
#assert.eq(
  round-integer("1145", 3, dir: "nearest", ties: "to-odd", sign: "-"),
  "115",
)


#assert.eq(
  round-integer("1145", 3, dir: "nearest", ties: "towards-infinity"),
  "115",
)
#assert.eq(
  round-integer("1145", 3, dir: "nearest", ties: "towards-infinity", sign: "-"),
  "114",
)

#assert.eq(
  round-integer("1145", 3, dir: "nearest", ties: "towards-negative-infinity"),
  "114",
)
#assert.eq(
  round-integer(
    "1145",
    3,
    dir: "nearest",
    ties: "towards-negative-infinity",
    sign: "-",
  ),
  "115",
)



#assert.eq(round-integer("123", 2, dir: "towards-zero"), "12")
#assert.eq(round-integer("123", 1, dir: "towards-zero"), "1")
#assert.eq(round-integer("9989823", 7, dir: "towards-zero"), "9989823")
#assert.eq(round-integer("12", 1, dir: "towards-zero", sign: "-"), "1")

#assert.eq(round-integer("120", 2, dir: "away-from-zero"), "12")
#assert.eq(round-integer("123", 2, dir: "away-from-zero"), "13")
#assert.eq(round-integer("1200000000002", 2, dir: "away-from-zero"), "13")
#assert.eq(round-integer("999000003", 3, dir: "away-from-zero"), "1000")
#assert.eq(round-integer("12", 1, dir: "away-from-zero", sign: "-"), "2")


#assert.eq(round-integer("123", 2, dir: "towards-negative-infinity"), "12")
#assert.eq(round-integer("123", 1, dir: "towards-negative-infinity"), "1")
#assert.eq(
  round-integer("9989823", 7, dir: "towards-negative-infinity"),
  "9989823",
)
#assert.eq(
  round-integer("12", 1, dir: "towards-negative-infinity", sign: "-"),
  "2",
)


#assert.eq(round-integer("120", 2, dir: "towards-infinity"), "12")
#assert.eq(round-integer("123", 2, dir: "towards-infinity"), "13")
#assert.eq(round-integer("1200000000002", 2, dir: "towards-infinity"), "13")
#assert.eq(round-integer("999000003", 3, dir: "towards-infinity"), "1000")
#assert.eq(round-integer("12", 1, dir: "towards-infinity", sign: "-"), "1")


#assert.eq(round-integer("2234", 1, dir: "nearest"), "2")
#assert.eq(round-integer("0022", 3, dir: "nearest"), "002")
#assert.eq(round-integer("0395", 3, dir: "nearest"), "040")
#assert.eq(round-integer("999", 2, dir: "nearest"), "100")


// #assert-panic(() => round-integer("123", 0))





#let round-places = round.with(mode: "places")
#let round-figures = round.with(mode: "figures")

#assert.eq(round("23", "5", precision: none), ("23", "5", none))

#assert.eq(round-places("1", "234", precision: 3), ("1", "234", none))
#assert.eq(round-places("1", "234", precision: 2), ("1", "23", none))
#assert.eq(round-places("1", "234", precision: 1), ("1", "2", none))
#assert.eq(round-places("1", "234", precision: 0), ("1", "", none))
#assert.eq(round-places("23", "534", precision: -1), ("20", "", none))
#assert.eq(round-places("12345", "534", precision: -3), ("12000", "", none))
#assert.eq(round-places("70", "", precision: -2), ("100", "", none))
#assert.eq(round-places("70", "", precision: -3), ("", "", none))
#assert.eq(round-places("70", "", precision: -4), ("", "", none))
#assert.eq(round-places("", "0022", precision: 3), ("", "002", none))

#assert.eq(round-places("1", "1", precision: 0), ("1", "", none))
#assert.eq(round-places("1", "1", precision: 3), ("1", "100", none))
#assert.eq(round-places("1", "1", precision: 5), ("1", "10000", none))
#assert.eq(round-places("1", "1", precision: 5), ("1", "10000", none))

#assert.eq(round-places("1", "1", precision: 5, pad: false), ("1", "1", none))
#assert.eq(round-places("1", "1", precision: 5, pad: true), ("1", "10000", none))
#assert.eq(round-places("1", "1", precision: 5, pad: -1), ("1", "1", none))
#assert.eq(round-places("1", "1", precision: 5, pad: 0), ("1", "1", none))
#assert.eq(round-places("1", "1", precision: 5, pad: 3), ("1", "100", none))
#assert.eq(round-places("1", "1", precision: 5, pad: 6), ("1", "10000", none))

#assert.eq(round-figures("1", "234", precision: 4), ("1", "234", none))
#assert.eq(round-figures("1", "234", precision: 3), ("1", "23", none))
#assert.eq(round-figures("1", "234", precision: 2), ("1", "2", none))
#assert.eq(round-figures("1", "234", precision: 1), ("1", "", none))
#assert.eq(round-figures("1", "234", precision: 0), ("", "", none))
#assert.eq(round-figures("1", "234", precision: -1), ("", "", none))
#assert.eq(round-figures("8", "234", precision: 0), ("10", "", none))
#assert.eq(round-figures("8", "234", precision: -1), ("", "", none))
#assert.eq(round-figures("8", "234", precision: -2), ("", "", none))
#assert.eq(round-figures("11", "", precision: -3), ("", "", none))

#assert.eq(round-figures("1", "2", precision: 4), ("1", "200", none))

#assert.eq(round-figures("1", "2", precision: 4, pad: false), ("1", "2", none))
#assert.eq(round-figures("1", "2", precision: 4, pad: true), ("1", "200", none))
#assert.eq(round-figures("1", "2", precision: 4, pad: -1), ("1", "2", none))
#assert.eq(round-figures("1", "2", precision: 4, pad: 0), ("1", "2", none))
#assert.eq(round-figures("1", "2", precision: 4, pad: 3), ("1", "20", none))
#assert.eq(round-figures("1", "2", precision: 4, pad: 6), ("1", "200", none))

#assert.eq(round-figures("0", "00126", precision: 2), ("", "0013", none))
#assert.eq(round-figures("0", "000126", precision: 3), ("", "000126", none))

#assert.eq(round-figures("0", "0016", precision: 4, pad: false), ("", "0016", none))
#assert.eq(round-figures("0", "0016", precision: 4, pad: true), ("", "001600", none))
#assert.eq(round-figures("0", "0016", precision: 4, pad: -1), ("", "0016", none))
#assert.eq(round-figures("0", "0016", precision: 4, pad: 0), ("", "0016", none))
#assert.eq(round-figures("0", "0016", precision: 4, pad: 3), ("", "00160", none))
#assert.eq(round-figures("0", "0016", precision: 4, pad: 6), ("", "001600", none))


#assert.eq(round-places("99", "92", precision: 2), ("99", "92", none))
#assert.eq(round-places("99", "92", precision: 0), ("100", "", none))
#assert.eq(round-places("99", "99", precision: 1), ("100", "0", none))
#assert.eq(round-places("99", "99", precision: -1), ("100", "", none))
#assert.eq(round-places("1", "299995", precision: 5), ("1", "30000", none))
#assert.eq(round-places("1", "299994", precision: 5), ("1", "29999", none))
#assert.eq(round-places("523", "", precision: -2), ("500", "", none))


#assert.eq(
  round("42", "3734", pm: ("", "0025"), precision: 2, mode: "uncertainty"),
  ("42", "3734", ("", "0025")),
)
#assert.eq(
  round("42", "3734", pm: ("", "0025"), precision: 1, mode: "uncertainty"),
  ("42", "373", ("", "003")),
)
#assert.eq(
  round("42", "3734", pm: ("2", "2"), precision: 1, mode: "uncertainty"),
  ("42", "", ("2", "")),
)
#assert.eq(
  round("42", "3734", pm: ("2", "2"), precision: 2, mode: "uncertainty"),
  ("42", "4", ("2", "2")),
)
#assert.eq(
  round("42", "3734", pm: ("2", "2"), precision: 3, mode: "uncertainty"),
  ("42", "37", ("2", "20")),
)

#assert.eq(
  round("4211", "3734", pm: ("230", "2"), precision: 1, mode: "uncertainty"),
  ("4200", "", ("200", "")),
)

#assert.eq(
  round("1", "23", pm: ("0", "2"), precision: 1, mode: "uncertainty"),
  ("1", "2", ("", "2")),
)
#assert.eq(
  round("123", "9", pm: ("20", ""), precision: 1, mode: "uncertainty"),
  ("120", "", ("20", "")),
)
#assert.eq(
  round(
    "1",
    "23",
    pm: (("0", "2"), ("0", "3")),
    precision: 1,
    mode: "uncertainty",
  ),
  ("1", "2", (("", "2"), ("", "3"))),
)
#assert.eq(
  round(
    "123",
    "9",
    pm: (("020", ""), ("30", "")),
    precision: 1,
    mode: "uncertainty",
  ),
  ("120", "", (("20", ""), ("30", ""))),
)
#assert.eq(
  round(
    "1",
    "23",
    pm: (("0", "24"), ("0", "3")),
    precision: 1,
    mode: "uncertainty",
  ),
  ("1", "2", (("", "2"), ("", "3"))),
)
#assert.eq(
  round(
    "1",
    "23",
    pm: (("0", "04"), ("0", "3")),
    precision: 1,
    mode: "uncertainty",
  ),
  ("1", "23", (("", "04"), ("", "30"))),
)
#assert.eq(
  round(
    "0",
    "",
    precision: 2,
    mode: "places",
  ),
  ("", "00", none),
)

#assert.eq(
  round(
    "0",
    "",
    precision: 2,
    mode: "figures",
  ),
  ("", "", none),
)






#set page(width: auto, height: auto, margin: .5em)

// Places
#set-round(mode: "places", precision: 2)
#num("1.234") \
#num("1.236") \
#set-round(pad: false)
#num("1.1") \
#set-round(pad: true)
#num("1.1") \
#set-round(direction: "towards-negative-infinity")
#num("1.199") \
#set-round(direction: "towards-infinity")
#num("1.192") \
#num("1.190") \
#set-round(direction: "nearest")


#pagebreak()

// Figures
#set-round(mode: "figures", precision: 2)
#num("1.27") \
#num("0.00001227") \
#num("9876") \
#num("9976") \


#pagebreak()


// Uncertainty
#set-round(mode: "uncertainty", precision: 1)
#num("1.234(34)") \
#num("1.23422(34)") \
#num("8.8+-2") \


#pagebreak()


// Turning off rounding
#set-round(mode: "places")
#num(round: (precision: none), "1.234") \


#pagebreak()


// Tie to odd
#set-round(precision: none)
#num(round: (precision: 0, ties: "to-odd"))[.5]



#pagebreak()



// Rounding zero
#num(round: (precision: 3, mode: "places"))[0] \
#num(round: (precision: 3, mode: "places"))[0.0] \
#num(round: (precision: 3, mode: "figures"))[0] \
#num(round: (precision: 3, mode: "places"), exponent: "sci")[0.0]

#pagebreak()

// Rounding affects displayed digits, (after the exponent is applied)
#num(round: (precision: 1), exponent: (fixed: 2))[42.34e3] \
#num(round: (precision: 1), exponent: "sci")[42.34e3] \
#num(round: (precision: 2, mode: "figures"), exponent: "eng")[42.34e3] \


