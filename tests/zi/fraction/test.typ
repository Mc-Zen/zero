#set page(width: auto, height: auto, margin: .5em)
#import "/src/zero.typ": set-unit, set-num, zi


#let m-s-N = zi.declare("m/s/N")

#zi.m-s() \
#zi.m-s(fraction: "inline") \
#zi.m-s(fraction: "fraction") \

#m-s-N() \
#m-s-N(fraction: "inline") \
#m-s-N(fraction: "fraction") \


#pagebreak()
#set-num(math: false)

#zi.m-s() \
#zi.m-s(fraction: "inline") \
#zi.m-s(fraction: "fraction") \


#m-s-N() \
#m-s-N(fraction: "inline") \
#m-s-N(fraction: "fraction") \