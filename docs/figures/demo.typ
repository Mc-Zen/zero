#import "/src/zero.typ": *
#import "@preview/cetz:0.4.0"

#set page(width: auto, height: auto, margin: 1em, fill: none)

#let clr = if "dark" in sys.inputs { white } else { black }
#set page(fill: white) if clr == black
#set text(fill: clr)
#set table(stroke: clr + .5pt)


Physicists estimate a number of #num[1e80] particles in the observable universe. 

#figure({
  show: format-table(none, auto)
  table(
    columns: 2, 
    [1], [1.2], 
    [2], [2], 
    [3], [300]
  )
})

#let Js = zi.declare("J s")
Plancks constant is roughly #Js[6.626e-34]. 
