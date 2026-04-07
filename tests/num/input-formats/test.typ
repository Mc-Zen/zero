#import "/src/zero.typ": *
#set page(width: auto, height: auto, margin: 2pt)

#num[0] \
#num[-0] \
#num[-2.23] \
#num[-2,23] \
#num(-2.23) \
#num("-2.23") \
#num("-2,23") \
#num((mantissa: "-112.3", e: none, pm: none)) \
#num((mantissa: 23, e: "2", pm: none))

#pagebreak()

#num[.1] \
#num[,1] \
#num[2e-1,2] \



#pagebreak()

// Advanced input



// num with array input
#context {
  num(("1", "2")).join(" ")
}

#pagebreak()

// num with state input
#context {
  let state = impl.num-state.get()
  state.positive-sign = true
  num("1", state: state)
  [ ]
  num("2", state: state)
}
