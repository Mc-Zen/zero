#import "/src/zero.typ": *
#set page(width: auto, height: auto, margin: .5em)

#ztable(
  format: (auto,),
  [#nonum[€]123.0#nonum(footnote[A special number])],
  [222.23+-2],
  [12],
)

// #num(prefix: $<$)[23]
