#import "/src/zero.typ": num

#set page(width: auto, height: auto, margin: .5em)


#num(exponent: "sci")[123] \
#num(exponent: "sci")[12e10] \

#pagebreak()

#num(exponent: (sci: 3))[120] \
#num(exponent: (sci: 3))[1200] \
#num(exponent: (sci: 3))[.01] \
#num(exponent: (sci: 3))[.001] \

#pagebreak()

#num(exponent: (sci: (-4, 3)))[120] \
#num(exponent: (sci: (-4, 3)))[1200] \
#num(exponent: (sci: (-4, 3)))[.001] \
#num(exponent: (sci: (-4, 3)))[.0001] \
