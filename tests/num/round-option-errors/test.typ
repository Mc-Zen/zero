#import "/src/zero.typ": num


// Typo'd ties on the plain-number path.
#assert.eq(
  catch(num.with("1.5", round: (precision: 0, ties: "to-evne"))),
  "assertion failed: Expected \"away-from-zero\", \"towards-zero\", \"to-odd\", \"to-even\", \"towards-infinity\", or \"towards-negative-infinity\" for `round-ties`, got \"to-evne\"",
)

// Typo'd direction on the uncertainty path.
#assert.eq(
  catch(num.with("12.378+-0.2", round: (direction: "nearst"))),
  "assertion failed: Expected \"nearest\", \"towards-infinity\", \"towards-negative-infinity\", \"away-from-zero\", or \"towards-zero\" for `round-direction`, got \"nearst\"",
)

// Typo'd ties on the uncertainty path.
#assert.eq(
  catch(num.with("12.378+-0.2", round: (ties: "to-evne"))),
  "assertion failed: Expected \"away-from-zero\", \"towards-zero\", \"to-odd\", \"to-even\", \"towards-infinity\", or \"towards-negative-infinity\" for `round-ties`, got \"to-evne\"",
)
