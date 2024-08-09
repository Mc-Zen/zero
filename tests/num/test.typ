#import "/src/zero.typ": *
#set page(width: auto, height: auto, margin: .5em)


#table(
  columns: 6,
  [`num`], num[12.0], num[-2e3], num[0,222], num("2.2+-0.2"), num("2.2+-0.2e1"),
  [Ref], $12.0$, $-2 times 10^3$, $0.222$, $2.2 plus.minus 0.2$, $(2.2 plus.minus 0.2) times 10^1$,
)


#pagebreak()

// input formats

#num[-2.23] \
#num(-2.23) \
#num("-2.23") \



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

// tight

#let tnum = num.with(tight: true)
#let examples = ("12.2", "2+-3", "4e2", "-2+-1e1")
#table(
  columns: 2, stroke: none,
  [`tight: false`], [`tight: true`],
  ..array.zip(examples.map(num),examples.map(tnum)).flatten()
)



#pagebreak()

// decimal marker (in- and output)

#num("1.2+-,1") #num("1,2+-.9") \
#num("2e1.2") #num("2e1,2")

#set-num(decimal-marker: ",")
#num("1.2+-,1") #num("1,2+-.9") \
#num("2e1.2") #num("2e1,2")
#set-num(decimal-marker: ".")

#num("1.234", decimal-marker: ",") \
#num("1.234", decimal-marker: "__") \



#pagebreak()

// multiplication symbol

#num("2e9") \
#num("2e9", times: math.dot) \
#set-num(times: math.dot)
#num("2e9") \
#set-num(times: math.times)
#num("2e9") \



#pagebreak()

// unit mantissa

#num("1e9", omit-unit-mantissa: false) \
#num("1e9", omit-unit-mantissa: true) \
#num("2e9", omit-unit-mantissa: true) \
#num("1+-1e9", omit-unit-mantissa: true) \
#num("1", omit-unit-mantissa: true) \
#set-num(omit-unit-mantissa: true)
#num("1e3") \
#set-num(omit-unit-mantissa: false)
#num("1e3") \



#pagebreak()

// implicit plus

#num("1", implicit-plus: false)
#num("1", implicit-plus: true)
#num("-1", implicit-plus: false)
#num("-1", implicit-plus: true) \
#set-num(implicit-plus: true)
#num("9")
#set-num(implicit-plus: false)
#num("9")



#pagebreak()

// implicit plus exponent

#num("1e3", implicit-plus-exponent: false)
#num("1e3", implicit-plus-exponent: true)
#num("1e-1", implicit-plus-exponent: false)
#num("1e-1", implicit-plus-exponent: true) \
#set-num(implicit-plus-exponent: true)
#num("1e9")
#set-num(implicit-plus-exponent: false)
#num("1e9")



#pagebreak()

// power base

#num("1e2", base: 2) \
#num("1e2", base: [e]) \
#num("1e2", base: [π])
#set-num(base: "4")
#num("1e2") \
#set-num(base: 10)
#num("1e2") 



#pagebreak()

// uncertainty mode

#let examples = (
  "1.7+-.2",
  "1.7+-.02",
  "1.7+-.28",
  "1.7+-2.8",
  "1.7(2)",
  "1.7(.2)",
  "1.7(28)",
  "2.2+.2-.5",
  "2.2+2-5",
  "2.2+2-.5",
  "9.99+2-.5"
)

#table(
  columns: 3, align: center, stroke: none,
  [`separate`], [`compact`], [`compact-marker`],
  ..array.zip(
    examples.map(num.with(uncertainty-mode: "separate")),
    examples.map(num.with(uncertainty-mode: "compact")),
    examples.map(num.with(uncertainty-mode: "compact-marker")),
  ).flatten()
)



#pagebreak()

// digit grouping

#num("10.10") \
#num("123.321") \
#num("1234.4321") \
#num("12345.54321") \
#num("1234567") \
#set-group(threshold: calc.inf)
#num("1234567") \
#set-group(threshold: 3)
#num("1234.4321") \
#set-group(sep: "'", size: 2)
#num("12345.54321") \
#set-group(sep: sym.space.thin, size: 4, threshold: 5)



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
#set-round(direction: "down")
#num("1.199") \
#set-round(direction: "up")
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

#set-round(mode: none)
#num("1.234")



#pagebreak()

// digits

#num("1.234", digits: 2) \
#num("1.2", digits: 2)



#pagebreak()

// fixed exponent

#num("1.234", fixed: -2) \
#num("1.234", fixed: 1) \
#num("1e4", fixed: 1) \
#num("1e-4", fixed: -1) \



#pagebreak()

// combine implicit-plus and omit-unit-mantissa
#num("1e3", implicit-plus: true, omit-unit-mantissa: true) \
#num("-1e3", implicit-plus: true, omit-unit-mantissa: true) \

// combine "compact" and exponential
#num("2.1+-.2e1", uncertainty-mode: "compact") \
#num("2.1+.2-.2e1", uncertainty-mode: "separate")


#pagebreak()

// content input

#num[.1]
#num[,1]
#num[2e-1,2]