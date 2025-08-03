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

#zi.declare("1/s")(fraction: "fraction")
#zi.declare("1/s")(fraction: "inline")


#pagebreak()

#set page(width: 4cm)

// Unit declaration
#let kgm-s2 = zi.declare("kg m/s^2")
#let kgm-s2 = zi.declare("kg m")
#kgm-s2() \
$"kg" thin "m"$ \
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
  Vm-s(fraction: "fraction", unit-separator: "·"),
  Vm-s(fraction: "fraction", unit-separator: "·")[1.2],
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
#set-unit(unit-separator: sym.space.thin, fraction: "power")



#set page(width: 2cm)
Hello #zi.m-s[2.2]

Hello #zi.m-s(breakable: true)[2.2]

A #kgm-s2()
A #kgm-s2(breakable: true)


#pagebreak()

#set page(width: auto)
#table(
  zi.m-s("2+-2"),
  zi.m-s("2+-2e3"),
  zi.m-s(uncertainty-mode: "compact", "2+-1"),
  zi.m-s(uncertainty-mode: "compact-separator", "2+-1"),
  zi.m-s(fixed: 1, "2+-1.1"),
)

#pagebreak()

// Non-math mode

#let m-s-V = zi.declare("m/s/V^2")

#table(
  zi.m(fraction: "power", math: false)[2],
  zi.m-s(fraction: "power", math: false)[2],
  zi.m-s(fraction: "inline", math: false)[2],
  m-s-V(fraction: "power", math: false)[2],
  m-s-V(fraction: "inline", math: false)[2],
)

#pagebreak()

#set-unit(use-sqrt: true, fraction: "inline")
#zi.m-s()
#table(
  zi.declare("m^3 b^0.5/c^0.5")(fraction: "power"),
  zi.declare("m^3 b^0.5/c^0.5")(fraction: "fraction"),
  zi.declare("m^3 b^0.5/c^0.5")(fraction: "inline"),
)
