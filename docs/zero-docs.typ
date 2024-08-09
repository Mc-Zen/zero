#import "/src/zero.typ": *
#import "@preview/cetz:0.2.2"


// #align(center, text(2em, weight: "bold")[Zero])
#align(center, text(2em, weight: "bold")[$Z dot e^(r o)$])
// #align(center, image("logo.svg", height: 5em))



_Advanced scientific number formatting._

= Introduction

Proper formatting of numbers requires some love for detail to guarantee a readable and clear output. This package provides tools to ensure consistent formatting and follow established practice. Key features are
- *standardized* formatting,
- digit *grouping*, e.g., $299 thin 792thin 458$ instead of $299792458$,
- *plug-and-play number alignment in tables*
- quick scientific notation, e.g., "2e4" #sym.arrow #num[2e4],
- symmetric and asymmetric *uncertainties*,
- rounding,
- some specials for package authors,
- and localization?. 

A number in scientific notation consists of three parts of which the latter two are optional. The first part is the _coefficient_ that may consist of an _integer_ and a _fractional_ part. In many fields, values are not known exactly and the corresponding _uncertainty_ is then given after the coefficient. Lastly, to facilitate reading very large or small numbers, the coefficient may be multiplied with a _power_ of 10 (or another base). 

The anatomy of a formatted number is shown in the following figure.

#import "figures/anatomy.typ": anatomy
#figure(anatomy)

For generating formatted numbers, *Zero* provides the `num` type along with the types `coefficient`, `uncertainty`, and `power` that allow for fine-grained customization with `show` and `set` rules. 

#pad(x: 5%, outline(title: none, depth: 1))

= Quick Demo

#{
  set raw(lang: "typ")

  let examples = (
    "#num[1.2e4]",
    "#num[-5e-4]",
    "#num[9.81+-.01]",
    "#num[9.81+0.02-.01]",
    "#num[9.81+-.01e2]",
    "#num[9.81+0.02-.01e2]",
    "#num(\"9.81+0.02-.01e2\", )",
  )

  let compiled-examples = examples.map(eval.with(scope: (num: num), mode: "markup"))

  figure(table(
    stroke: none,
    table.vline(x: 2, stroke: .5pt),
    align: (left, center) * 2,
    columns: 4,
    ..array.zip(examples.map(raw), compiled-examples).flatten()
  ))
  
}



= Features
== Digit grouping

Digit grouping is important for keeping large figures readable. It is customary to separate thousands with a thin space, a dot, comma or an apostrophe (however, we discourage using a dot or a comma to avoid confusion since both are used for decimal markers in many countries). The separator can be configured via the `group-sep` option. 

#import "figures/grouping.typ": grouping
#figure(grouping)

By default, both the integer and the fractional part are split into groups of three, starting at the decimal marker. The size of the groups can be configured with `group-size`. Four-digit numbers are often not grouped at all since they can still be read easily. The option `group-threshold` controls the _least_ number of digits for digit grouping to kick in. 

Digit grouping can be turned off altogether with `group-digits: false`. 

== Specifying uncertainties

There are two main ways of specifying uncertainties:
- Applying an uncertainty to the last significant digits using parentheses, e.g., `2.3(4)`,
- Denoting an absolute uncertainty, e.g., `2.3+-0.4` #sym.arrow #num[2.3+-0.4]. 

Zero supports both and can convert between these two, so that you can pick the displayed style independently from the input style. 

How do uncertainties interplay with exponents? The uncertainty needs to come first and the exponent applies to both the mantissa and the uncertainty, e.g., `num("1.23+-.04e2")` becomes

#figure(num("1.23+-.04e2"))

Note that the coefficient is now put in parentheses to disambiguate the application of the power. 

In some cases, the uncertainty is asymmetric which can be expressed via `num("1.23+0.02-0.01")`

#figure(num("1.23+0.02-0.01"))

= Table alignment

In scientific publication, presenting large amounts of numbers in a readable fashion is a high discipline. A good starting point is to align numbers in a table at the decimal marker. With _Zero_, this can be accomplished by using the `ztable`. This is a wrapper for the built-in `table` which features an additional argument `format` which takes an array of `none` or `auto` values to turn on number alignment for specific columns. 


```typ

#ztable(
  columns: 3,
  align: center,
  format: (none, auto, auto),
  $n$, $α$, $β$,
  [1],   [3.45],  [-11.1],
  ..
)
```

Non-number entries (e.g., in the header) are automatically recognized in some cases and will not be aligned. In ambiguous cases, adding a leading or trailing space tells _Zero_ not to align this cell, for example `[Angle ]` instead of `[Angle]`. 

#figure(ztable(
  columns: 3,
  align: center,
  format: (none, auto, auto),
  $n$, $α$, $β$,
  [1],   [3.45],  [-11.1],
  [2],   [4.568], [-0.1],
  [3],   [12.2],  [-.02],
  [...], [24.1],  [-1.1],
  [10],  [234],   [-0.00234],
))



The numbers are not only aligned at the decimal point but also at the uncertainty and exponent part. 

#figure(ztable(
  columns: 3,
  align: center,
  format: (none, auto, auto),
  $n$, $α$, $β$,
  [1],   [3.45e2],  [-11.1+-3],
  [2],   [4.568e1], [-0.1+-1e4],
  [3],   [12.2e4],  [-.02+-.02],
  [...], [24.1e6],  [-1.1+-5],
  [10],  [234e200],   [-0.00234+-.3e3],
))



= Zero for packages
