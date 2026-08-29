#set page(width: auto, height: auto, margin: .5em)
#import "/src/zero.typ": set-num, set-unit, zi, num

#set-num(exponent: "eng")

#zi.m[2] \
#zi.m[2e3] \
#zi.m[2e4] \

#pagebreak()

#zi.s[2e-2] \
#zi.s[2e-7] \

#pagebreak()

#zi.m-s[12e2] \
#zi.declare("V m")([12e2]) \
#zi.declare("V m/N")([12e2]) \
#zi.declare("1/s")([12e2]) \

#pagebreak()

// first numerator unit has an exponent
#zi.m2[2e5] \
#zi.m2[2e6] \
#zi.m3[2e8] \
#zi.m3[2e9] \
#zi.m3[2e-9] \

#pagebreak()

// exponent that exceeds the valid prefixes
#zi.m[2e22] \
#zi.m[2e-22] \
