#import "/src/zero.typ": *

#set page(width: auto, height: auto, margin: .5em)


#let Kroot = zi.declare("K^0.5")
#let K-root = zi.declare("s/K^0.5")


#let sample = [
  #Kroot() \
  #Kroot()[42] \
  #K-root() \
  #K-root()[42] \
]
#set-unit(use-sqrt: false)
#set-unit(fraction: "power")
#sample

#set-unit(fraction: "inline")
#sample

#set-unit(fraction: "fraction")
#sample

#pagebreak()


#set-unit(use-sqrt: true)
#set-unit(fraction: "power")
#sample

#set-unit(fraction: "inline")
#sample

#set-unit(fraction: "fraction")
#sample
// $
//   #kg-K1-2(use-sqrt: false) \
//   #kg-K1-2(use-sqrt: false, fraction: "inline") \
//   #kg-K1-2(use-sqrt: false)[42] \
//   #kg-K1-2(use-sqrt: false, fraction: "inline")[42]
// $