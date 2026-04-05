#import "/src/zero.typ": *
#set page(width: auto, height: auto, margin: 2pt)




// uncertainty mode

#let examples = (
  "1.7+-.2",
  "1.7+-.02",
  "1.7+-.28",
  "1.7+-2.8",
  "1.7(2)",
  "1.7(.2)",
  "1.7(28)",
  "2.2+.2-.5",
  "2.2+2-5",
  "2.2+2-.5",
  "9.99+2-.5",
)

#table(
  columns: 3,
  align: center,
  stroke: none,
  [`separate`], [`compact`], [`compact-separator`],
  ..array
    .zip(
      examples.map(num.with(uncertainty-mode: "separate")),
      examples.map(num.with(uncertainty-mode: "compact")),
      examples.map(num.with(uncertainty-mode: "compact-separator")),
    )
    .flatten(),
)


#pagebreak()


#set-num(math: false)


#table(
  columns: 3,
  align: center,
  stroke: none,
  [`separate`], [`compact`], [`compact-separator`],
  ..array
    .zip(
      examples.map(num.with(uncertainty-mode: "separate")),
      examples.map(num.with(uncertainty-mode: "compact")),
      examples.map(num.with(uncertainty-mode: "compact-separator")),
    )
    .flatten(),
)
