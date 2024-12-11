
#import "num.typ": num
#import "state.typ": num-state

#let align-column(
  ..args
) = {
  let state = num-state.get()
  let numbers = args.pos().map(num.with(align: "components", state: state, ..args.named()))
  let widths = numbers.map(components => 
    components.map(x => if x == none { 0pt } else { measure(x).width })
  )
  let max-widths = array.zip(..widths).map(col => calc.max(..col))

  return numbers.map(components => 
    components
      .zip(max-widths, (right, left, left, left))
      .map(((body, width, alignment))=> box(width: width, align(alignment, body)))
      .join()
  )
}