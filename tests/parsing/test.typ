#import "/src/parsing.typ": *


#assert.eq(content-to-string([123]), "123")
#assert.eq(content-to-string([123 231.]), "123 231.")
#assert.eq(content-to-string([123] + [34]), "12334")
#assert.eq(content-to-string([a $a$]), none)




#assert.eq(content-to-string-table[], none)
#assert.eq(content-to-string-table[alpha ], none)
#assert.eq(content-to-string-table[#nonum[€]12], ("12", [€], none))
#assert.eq(content-to-string-table[#nonum[€]12.43#nonum[#footnote[1]]], ("12.43", [€], footnote[1]))




#assert.eq(to-normalized-numeral[], none)
#assert.eq(to-normalized-numeral("123"), "123")
#assert.eq(to-normalized-numeral("-2.0"), "-2.0")
#assert.eq(to-normalized-numeral("−" + "2,0"), "-2.0")
#assert.eq(to-normalized-numeral[2], "2")
#assert.eq(to-normalized-numeral[-2.1], "-2.1")
#assert.eq(to-normalized-numeral[-2.], "-2.")
#assert.eq(to-normalized-numeral[2.], "2.")
#assert.eq(to-normalized-numeral[-.1], "-.1")
#assert.eq(to-normalized-numeral(100), "100")
#assert.eq(to-normalized-numeral(-101.24), "-101.24")

// unparsable inputs
#assert.eq(to-normalized-numeral[], none)
#assert.eq(to-normalized-numeral[$a + b$], none)
#assert.eq(to-normalized-numeral[2 ], none)
#assert.eq(to-normalized-numeral[ 2], none)
#assert.eq(to-normalized-numeral[ 2343.23 ], none)
#assert.eq(str(sym.plus), "+")


#assert.eq(to-normalized-numeral([#""]), none)
#assert.eq(to-normalized-numeral-table([#""]), none)




#assert.eq(decompose-unsigned-float-numeral("23.2"), ("23", "2"))
#assert.eq(decompose-unsigned-float-numeral("23."), ("23", ""))
#assert.eq(decompose-unsigned-float-numeral("23"), ("23", ""))
#assert.eq(decompose-unsigned-float-numeral(".34"), ("", "34"))



#assert.eq(decompose-signed-float-numeral("23.2"), ("+", "23", "2"))
#assert.eq(decompose-signed-float-numeral("+23."), ("+", "23", ""))
#assert.eq(decompose-signed-float-numeral("-23"), ("-", "23", ""))
#assert.eq(decompose-signed-float-numeral("-.34"), ("-", "", "34"))
#assert.eq(decompose-signed-float-numeral(sym.plus + ".34"), ("+", "", "34"))






#assert.eq(
  parse-normalized-compound-numeral("-10e3"), 
  (sign: "-", int: "10", frac: "", pm: none, e: "3")
)
#assert.eq(
  parse-normalized-compound-numeral("+2.4+-0.1"), 
  (sign: "+", int: "2", frac: "4", pm: ("0", "1"), e: none)
)
#assert.eq(
  parse-normalized-compound-numeral("+.4+0.1-0.2e-10"), 
  (sign: "+", int: "0", frac: "4", pm: (("0", "1"), ("0", "2")), e: "-10")
)
#assert.eq(
  parse-normalized-compound-numeral(".4(2)"), 
  (sign: "+", int: "0", frac: "4", pm: ("0", "2"), e: none)
)
#assert.eq(
  parse-normalized-compound-numeral(".4333(2)"), 
  (sign: "+", int: "0", frac: "4333", pm: ("0", "0002"), e: none)
)
#assert.eq(
  parse-normalized-compound-numeral(".4333(200)"), 
  (sign: "+", int: "0", frac: "4333", pm: ("0", "0200"), e: none)
)
#assert.eq(
  parse-normalized-compound-numeral(".43(200)"), 
  (sign: "+", int: "0", frac: "43", pm: ("2", "00"), e: none)
)
#assert.eq(
  parse-normalized-compound-numeral("2(2)"), 
  (sign: "+", int: "2", frac: "", pm: ("2", ""), e: none)
)
#assert.eq(
  parse-normalized-compound-numeral("2.3(2.9)"), 
  (sign: "+", int: "2", frac: "3", pm: ("0", "29"), e: none)
)