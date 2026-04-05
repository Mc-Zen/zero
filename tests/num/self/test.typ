#import "/src/zero.typ": *
#set page(width: auto, height: auto, margin: .5em)

#table(
  columns: 6,
  [`num`], num[12.0], num[-2e3], num[0,222], num("2.2+-0.2"), num("2.2+-0.2e1"),
  [Ref],
  $12.0$,
  $-2 times 10^3$,
  $0.222$,
  $2.2 plus.minus 0.2$,
  $(2.2 plus.minus 0.2) times 10^1$,
)




#pagebreak()

// querbeet

#num("0") \
#num("-0") \
#num("45") \
#num(".23") \
#num("1.0") \
#num(".00002") \
#num("2e4") \
#num("-3.1e-1") \
#num("-3.1+-1.1") \
#num("2+-1e1") \




#pagebreak()

// rounding

#num("1.234") \
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

#set-round(mode: "figures", precision: 2)
#num("1.27") \
#num("0.00001227") \
#num("9876") \
#num("9976") \

#set-round(mode: "uncertainty", precision: 1)
#num("1.234(34)") \
#num("8.8+-2") \

#set-round(mode: "places")
#num(round: (precision: none), "1.234")
#set-round(precision: none)

#num(round: (precision: 0, ties: "to-odd"))[.5]




#pagebreak()

// combine positive-sign and omit-unity-mantissa
#num("1e3", positive-sign: true, omit-unity-mantissa: true) \
#num("-1e3", positive-sign: true, omit-unity-mantissa: true) \

// combine "compact" and exponential
#num("2.1+-.2e1", uncertainty-mode: "compact") \
#num("2.1+.2-.2e1", uncertainty-mode: "separate")




#pagebreak()

// Mode math: false

#[
  #show math.equation: set text(2pt)
  #num(math: false)[2,3+-23e2]\
  #num(math: false, product: sym.dot)[2,3+.3-.4e2]
]

#pagebreak()

// num with manual state

#[
  #let state = impl.default-state
  #{ state.decimal-separator = "," }
  #let num = num.with(state: state)
  #num[2.34]
]

#pagebreak()

// num with array input

#context {
  num(("1", "2")).join(" ")
}

#pagebreak()

// num with state input

#context {
  let state = impl.num-state.get()
  num("1", state: state)
  [ ]
  num("2", state: state)
}

#pagebreak()

#num(
  group: (threshold: (fractional: 3, integer: calc.inf)),
  [23232.2323],
) \
#num(
  group: (threshold: (integer: 3, fractional: calc.inf)),
  [23232.2323],
)
