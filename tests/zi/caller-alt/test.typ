#import "/src/zero.typ": zi

// A caller-supplied alt must win over the declaration's alt.
#let kg = zi.declare("kg", alt: "declaration alt")
#let m = zi.declare("m", alt: "unit alt")

#kg(5) \
#kg(5, alt: "caller alt") \
#kg() \
#kg(alt: "caller unit alt") \
#zi.m(5)

#context {
  let qty-alts = query(selector(metadata).and(<zero-qty>)).map(q => q.value.args.named().alt)
  assert.eq(qty-alts, ("declaration alt", "caller alt", auto))

  let unit-alts = query(selector(metadata).and(<zero-unit>)).map(u => u.value.args.named().alt)
  assert.eq(unit-alts, ("unit alt", "caller unit alt"))
}
