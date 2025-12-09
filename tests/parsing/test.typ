#import "/src/parsing.typ": *


#assert.eq(content-to-string([123]), "123")
#assert.eq(content-to-string([123 231.]), "123 231.")
#assert.eq(content-to-string([123] + [34]), "12334")
#assert.eq(content-to-string([a $a$]), none)




#assert.eq(content-to-string-table[], none)
#assert.eq(content-to-string-table[alpha ], none)
#assert.eq(content-to-string-table[#nonum[€]12], ("12", [€], none))
#assert.eq(content-to-string-table[#nonum[€]12.43#nonum[#footnote[1]]], ("12.43", [€], footnote[1]))




#assert.eq(number-to-string[], none)
#assert.eq(number-to-string("123"), "123")
#assert.eq(number-to-string("-2.0"), "-2.0")
#assert.eq(number-to-string("−" + "2,0"), "-2.0")
#assert.eq(number-to-string[2], "2")
#assert.eq(number-to-string[-2.1], "-2.1")
#assert.eq(number-to-string[-2.], "-2.")
#assert.eq(number-to-string[2.], "2.")
#assert.eq(number-to-string[-.1], "-.1")
#assert.eq(number-to-string(100), "100")
#assert.eq(number-to-string(-101.24), "-101.24")

// unparsable inputs
#assert.eq(number-to-string[], none)
#assert.eq(number-to-string[$a + b$], none)
#assert.eq(number-to-string[2 ], none)
#assert.eq(number-to-string[ 2], none)
#assert.eq(number-to-string[ 2343.23 ], none)
#assert.eq(str(sym.plus), "+")


#assert.eq(number-to-string([#""]), none)
#assert.eq(number-to-string-table([#""]), none)




#assert.eq(decompose-unsigned-float-string("23.2"), ("23", "2"))
#assert.eq(decompose-unsigned-float-string("23."), ("23", ""))
#assert.eq(decompose-unsigned-float-string("23"), ("23", ""))
#assert.eq(decompose-unsigned-float-string(".34"), ("", "34"))



#assert.eq(decompose-signed-float-string("23.2"), ("+", "23", "2"))
#assert.eq(decompose-signed-float-string("+23."), ("+", "23", ""))
#assert.eq(decompose-signed-float-string("-23"), ("-", "23", ""))
#assert.eq(decompose-signed-float-string("-.34"), ("-", "", "34"))
#assert.eq(decompose-signed-float-string(sym.plus + ".34"), ("+", "", "34"))






#assert.eq(
  decompose-normalized-number-string("-10e3"), 
  (sign: "-", int: "10", frac: "", pm: none, e: "3")
)
#assert.eq(
  decompose-normalized-number-string("+2.4+-0.1"), 
  (sign: "+", int: "2", frac: "4", pm: ("0", "1"), e: none)
)
#assert.eq(
  decompose-normalized-number-string("+.4+0.1-0.2e-10"), 
  (sign: "+", int: "0", frac: "4", pm: (("0", "1"), ("0", "2")), e: "-10")
)
#assert.eq(
  decompose-normalized-number-string(".4(2)"), 
  (sign: "+", int: "0", frac: "4", pm: ("0", "2"), e: none)
)
#assert.eq(
  decompose-normalized-number-string(".4333(2)"), 
  (sign: "+", int: "0", frac: "4333", pm: ("0", "0002"), e: none)
)
#assert.eq(
  decompose-normalized-number-string(".4333(200)"), 
  (sign: "+", int: "0", frac: "4333", pm: ("0", "0200"), e: none)
)
#assert.eq(
  decompose-normalized-number-string(".43(200)"), 
  (sign: "+", int: "0", frac: "43", pm: ("2", "00"), e: none)
)
#assert.eq(
  decompose-normalized-number-string("2(2)"), 
  (sign: "+", int: "2", frac: "", pm: ("2", ""), e: none)
)
#assert.eq(
  decompose-normalized-number-string("2.3(2.9)"), 
  (sign: "+", int: "2", frac: "3", pm: ("0", "29"), e: none)
)