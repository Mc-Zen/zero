#import "/src/zero.typ": *
#set page(width: auto, height: auto, margin: 4pt)


#let clr = if "dark" in sys.inputs { white } else { black }
#set page(fill: white) if clr == black
#set page(fill: none) if clr != black

#set text(fill: clr)
#set text(1.2em)
#set table(stroke: clr + .5pt)

#ztable(
  format: (auto,),
  [#nonum[€]123.0#nonum(footnote[A special number])],
  [12.111],
)