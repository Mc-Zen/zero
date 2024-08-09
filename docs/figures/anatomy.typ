#import "/src/zero.typ": *
#import "@preview/cetz:0.2.2"
#set page(width: auto, height: auto, margin: 2pt, fill: white)

#let anatomy = cetz.canvas({
  import cetz.draw: *
  rect((0,-.15), (2.26,.37), fill: blue.transparentize(70%), stroke: blue + .5pt)
  rect((1.2,-.15), (2.125,.37), fill: red.transparentize(70%), stroke: red + .5pt)
  rect((2.3,-.15), (3.32,.37), fill: green.transparentize(70%), stroke: green + .5pt)
  content((0, 0), num[-10.4+-0.2e3], anchor: "south-west")

  content((.6, .8), text(blue)[coefficient])
  content((1.4, -.5), text(red)[uncertainty])
  content((3.1, -.5), text(green)[power])

  set-style(stroke: .3pt)
  line((-.3,.25), (.22,.16), name: "line1")
  content((-.7, .35), text(.8em)[sign])

  line((-.0,-.4), (.8,-.1), name: "line1")
  content((-.6, -.55), text(.8em)[#set par(leading: 2pt);decimal \ marker])
  
  line((2.4,.6), (2.5,.3), name: "line1")
  content((2.3,.8), text(.8em)[times])
  
  line((3.1,.6), (2.97,.32), name: "line1")
  content((3.2,.8), text(.8em)[base])
  
  line((3.7,.36), (3.3,.27), name: "line1")
  content((4.4,.42), text(.8em)[exponent])
})


#anatomy