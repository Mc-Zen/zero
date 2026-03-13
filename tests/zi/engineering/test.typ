#set page(width: auto, height: auto, margin: .5em)
#import "/src/zero.typ": set-num, set-unit, zi, num

// #num(round: (precision: 2, pad: true, mode: "places"))[1223+-.2]
// #num(round: (precision: 2, pad: true, mode: "places"))[1223.12+-.3]
#set-num(exponent: "eng")

#zi.m[2] \
#zi.m[2e3] \
#zi.m[2e4] \

#pagebreak()

#zi.s[2e-2] \
#zi.s[2e-7] \

#pagebreak()

#zi.m-s[12e2] \
#zi.declare("V m")([12e2])
