#import "/src/zero.typ": *

// #set box(fill: red)
#set page(width: auto, height: auto, margin: .5em)

#let test-clause(..args) = [
  #[The length is] #(zi.m-s("1+-2e2", ..args)). \
  // #hide[The length is] #(zi.meter("1+2-2e2", ..args)).
]

== Math mode
// Non-breakable
#block(stroke: gray, width: 15em, test-clause())
#block(stroke: gray, width: 10em, test-clause())
// Single break points
#block(stroke: gray, width: 13em, test-clause(breakable: (unit: true)))
#block(stroke: gray, width: 12em, test-clause(breakable: (power: true)))
#block(stroke: gray, width: 10em, test-clause(breakable: (uncertainty: true)))

#pagebreak()


== Text mode
#set-num(math: false)
#block(stroke: gray, width: 13em, test-clause())
#block(stroke: gray, width: 10em, test-clause())
// Single break points
#block(stroke: gray, width: 11em, test-clause(breakable: (unit: true)))
#block(stroke: gray, width: 10.5em, test-clause(breakable: (power: true)))
#block(stroke: gray, width: 10em, test-clause(breakable: (uncertainty: true)))

#pagebreak()


== Tight mode
#set-num(tight: true, math: true)
#block(stroke: gray, width: 14em, test-clause())
#block(stroke: gray, width: 10em, test-clause())
// Single break points
#block(stroke: gray, width: 11em, test-clause(breakable: (unit: true)))
#block(stroke: gray, width: 10.5em, test-clause(breakable: (power: true)))
#block(stroke: gray, width: 10em, test-clause(breakable: (uncertainty: true)))


#pagebreak()


== Tight text mode
#set-num(tight: true, math: false)
#block(stroke: gray, width: 13em, test-clause())
#block(stroke: gray, width: 10em, test-clause())
// Single break points
#block(stroke: gray, width: 11em, test-clause(breakable: (unit: true)))
#block(stroke: gray, width: 10.5em, test-clause(breakable: (power: true)))
#block(stroke: gray, width: 10em, test-clause(breakable: (uncertainty: true)))


#pagebreak()

== Don't break asym. uncertainties
#set-num(tight: false, math: true)
#block(stroke: gray, width: 10em)[
  The length is #(zi.meter("1+2-2e2", breakable: (uncertainty: true))).
]
#set-num(tight: false, math: false)
#block(stroke: gray, width: 10em)[
  The length is #(zi.meter("1+2-2e2", breakable: (uncertainty: true))).
]

#pagebreak()



#set page(width: 9em, height: auto, margin: .5em)

#set-num(tight: false, math: true)


#let long-unit = zi.declare("kg m/s^2/mol/N stel A A")


#set-num(breakable: false)
Unit of force is #long-unit(). 

#set-num(math: false)
Unit of force is #long-unit(). 
