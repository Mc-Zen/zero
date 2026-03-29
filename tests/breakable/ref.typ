#set page(width: auto, height: auto, margin: .5em)

#set super(typographic: false)
#let th = sym.space.thin
#let hair = sym.space.hair


== Math mode
// Non-breakable
#block(stroke: gray, width: 15em)[
  The length is $(1plus.minus 2)×10^2th"m"th"s"^(-1)$.
]
#block(stroke: gray, width: 10em)[
  The length is\ $(1plus.minus 2)×10^2th"m"th"s"^(-1)$.
]
// Single break points
#block(stroke: gray, width: 13em)[
  The length is $(1plus.minus 2)×10^2$\ $"m"th"s"^(-1)$.
]
#block(stroke: gray, width: 12em)[
  The length is $(1plus.minus 2)×$\ $10^2th"m"th"s"^(-1)$.
]
#block(stroke: gray, width: 10em)[
  The length is $(1plus.minus$\ $2)×10^2th"m"th"s"^(-1)$.
]

#pagebreak()


== Text mode
// Non-breakable
#block(stroke: gray, width: 13em)[
  The length is (1#th±#th⁠2) ⁠× ⁠10#super[2]#th;m#th;s#super[−1].
]
#block(stroke: gray, width: 10em)[
  The length is\ (1#th±#th⁠2) ⁠× ⁠10#super[2]#th;m#th;s#super[−1].
]
// Single break points
#block(stroke: gray, width: 11em)[
  The length is (1#th±#th⁠2) ⁠× ⁠10#super[2]#th;\ m#th;s#super[−1].
]
#block(stroke: gray, width: 10.5em)[
  The length is (1#th±#th⁠2) ⁠× \ ⁠10#super[2]#th;m#th;s#super[−1].
]
#block(stroke: gray, width: 10em)[
  The length is (1#th±#th\ 2) ⁠× ⁠10#super[2]#th;m#th;s#super[−1].
]

#pagebreak()


== Tight mode
#block(stroke: gray, width: 14em)[
  The length is $(1#h(0pt)plus.minus 2)#h(0pt)×#h(0pt)10^2th"m"th"s"^(-1)$.
]
#block(stroke: gray, width: 10em)[
  The length is\ $(1#h(0pt)plus.minus 2)#h(0pt)×#h(0pt)10^2th"m"th"s"^(-1)$.
]
// Single break points
#block(stroke: gray, width: 11em)[
  The length is $(1#h(0pt)plus.minus 2)#h(0pt)×#h(0pt)10^2$\ $"m"th"s"^(-1)$.
]
#block(stroke: gray, width: 10.5em)[
  The length is $(1#h(0pt)plus.minus 2)×$\ $10^2th"m"th"s"^(-1)$.
]
#block(stroke: gray, width: 10em)[
  The length is $(1plus.minus$\ $2)#h(0pt)×#h(0pt)10^2th"m"th"s"^(-1)$.
]


#pagebreak()


== Tight text mode
#block(stroke: gray, width: 13em)[
  The length is (1#hair±#hair⁠2)#hair;×#hair;⁠10#super[2]#th;m#th;s#super[−1].
]
#block(stroke: gray, width: 10em)[
  The length is\ (1#hair±#hair⁠2)#hair;×#hair;⁠10#super[2]#th;m#th;s#super[−1].
]
// Single break points
#block(stroke: gray, width: 11em)[
  The length is (1#hair±#hair⁠2)#hair;×#hair;⁠10#super[2]#hair;\ m#th;s#super[−1].
]
#block(stroke: gray, width: 10.5em)[
  The length is (1#hair±#hair⁠2)#hair;×#hair;\ ⁠10#super[2]#th;m#th;s#super[−1].
]
#block(stroke: gray, width: 10em)[
  The length is (1#hair±#hair\ 2)#hair;⁠×#hair;⁠10#super[2]#th;m#th;s#super[−1].
]


#pagebreak()

== Don't break asym. uncertainties
#block(stroke: gray, width: 10em)[
  The length is\
  $\(1#none^(+2)_(-2))×10^2th"m"$.
]
#block(stroke: gray, width: 10em)[
  The length is \
  #import "/src/zero.typ": zi
  #zi.meter("1+2-2e2", math: false).
]

#pagebreak()

#set page(width: 9em, height: auto, margin: .5em)


Unit of force is $"kg"th"m"th"stel"th"A"th"A"th"s"^(-2)th"mol"^(-1)$ 

Unit of force is \ #box(width: 10cm)[kg#th;m#th;stel#th;A#th;A#th;s#super[−2]#th;mol#super[−1]] \