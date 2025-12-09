#set page(width: auto, height: auto, margin: .5em)
#import "/src/zero.typ": num, set-unit, zi

// #show math.equation: box.with(fill: red)

// // Unit declaration
// #let kgm-s2 = zi.declare("kg m")
// #kgm-s2() \
// $"kg"th"m"th"s"^(-2)$ \
// $"kg" #h(0.17em) "m"$


#table(
  zi.declare("kg m")(),
  zi.declare("kg^2 m^9")(),
  zi.declare("kg^2 s^-1")(),
  zi.declare("kg^2 s^-2")(fraction: "inline"),
  zi.declare("kg^2 V s^-2")(fraction: "fraction"),
  zi.declare("s^-1")(),
  zi.declare("s^-1")(fraction: "inline"),
  zi.declare("s^-1")(fraction: "fraction"),
)
