#set page(width: auto, height: auto, margin: .5em)
#import "/src/zero.typ": zi, set-unit

#set table(stroke: none)

#zi.N[12] \
#zi.m-s[12] \
#zi.kg[12] \
#zi.candela[23] \
#zi.arcsecond[23] \
#zi.kN[23] \

#zi.kN() // later make them types maybe? Then we can just call #zi.kN, that looks much better


#pagebreak()


// Unit declaration
#let kgm-s2 = zi.declare("kg m/s^2")
#kgm-s2() \
#kgm-s2[2] 



#pagebreak()


// Args
#let Vm-s = zi.declare("V m/s")
#table(
  columns: 2,
  Vm-s(unit-separator: "·"),
  Vm-s(unit-separator: "·")[1.2],
  Vm-s(fraction: "fraction"),
  Vm-s(fraction: "fraction")[1.2],
  Vm-s(fraction: "inline"),
  Vm-s(fraction: "inline")[1.2],
  Vm-s(fraction: "inline", unit-separator: "·"),
  Vm-s(fraction: "inline", unit-separator: "·")[1.2],
)


#pagebreak()

// Set
#set-unit(unit-separator: "·", fraction: "power")
#table(
  columns: 2,
  kgm-s2(),
  kgm-s2[2],
  kgm-s2(fraction: "fraction"),
  kgm-s2(fraction: "fraction")[2],
  kgm-s2(fraction: "inline"),
  kgm-s2(fraction: "inline")[2]
)



#set page(width: 2cm)
Hello #zi.m-s[2.2]

Hello #zi.m-s(breakable: true)[2.2]

A #kgm-s2()
A #kgm-s2(breakable: true)