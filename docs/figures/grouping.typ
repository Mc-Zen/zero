#import "/src/zero.typ": *
#import "@preview/cetz:0.2.2"
#set page(width: auto, height: auto, margin: 2pt, fill: white)

#let grouping = cetz.canvas({
  import cetz.draw: *
  content((0, 0), num[10973731.5682], anchor: "south-west")
  set-style(stroke: .3pt)
  line((0.46, -.045), (0.46, -.12), (1.04, -.12), (1.04, -.045))
  content((.4, -.35), text(.8em)[`group.size`])
  
  line((1.83, -.045), (1.83, -.12), (2.59, -.12), (2.59, -.045))
  content((2.9, -.35), text(.8em)[`< group.threshold`])


  line((1.2,.5), (1.1,.3), name: "line1")
  content((1.9, .7), text(.8em)[`group.sep`])
})

#grouping