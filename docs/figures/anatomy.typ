#import "/src/zero.typ": *
#import "@preview/cetz:0.4.0"

#let clr = if "dark" in sys.inputs { white } else { black }
#let ctext = text.with(bottom-edge: "baseline", weight: "bold")
#let cgtext = text.with(bottom-edge: "baseline", clr.transparentize(50%), .7em)

#set text(1.4em)
#set page(width: auto, height: auto, margin: 1em)

#set page(fill: white) if clr == black
#set page(fill: none) if clr != black
#set text(fill: clr)

#let anatomy = scale(110%, reflow: true, cetz.canvas({
  import cetz.draw: *
  scale(140%)
  rect((0,-.15), (2.26,.37), fill: blue.transparentize(70%), stroke: blue + .5pt)
  rect((1.2,-.15), (2.125,.37), fill: red.transparentize(70%), stroke: red + .5pt)
  rect((2.3,-.15), (3.31,.37), fill: green.transparentize(70%), stroke: green + .5pt)
  rect((3.35,-.15), (4.32,.37), fill: orange.transparentize(70%), stroke: orange + .5pt)
  content((0, 0), ctext(zi.m-s[-10.4+-0.2e3]), anchor: "south-west")

  content((1.13, .75), ctext(blue)[`mantissa`])
  content((1.3, -.5), ctext(red)[`uncertainty`])
  content((2.8, .75), ctext(green)[`power`])
  content((3.83, .75), ctext(orange)[`unit`])

  set-style(stroke: .5pt + gray)
  line((-.3,.25), (.22,.16), name: "line1")
  content((-.7, .35), cgtext[`sign`])

  line((-.0,-.4), (.8,-.1), name: "line1")
  content((-.6, -.55), align(center, cgtext[#set par(leading: 2pt);`decimal` \ `separator`]))
  
  line((2.4,-.7), (2.5,-.1), name: "line1")
  content((2.7,-.85), cgtext[`product`])
  
  line((2.97,-.34), (2.97,-.1), name: "line1")
  content((2.9,-.45), cgtext[`base`])
  
  line((3.3,-.7), (3.25,.05), name: "line1")
  content((3.8,-.8), cgtext[`exponent`])
}))


#anatomy
