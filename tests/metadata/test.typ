#set page(width: auto, height: auto, margin: .5em)
#import "/src/zero.typ": set-num, set-unit, zi, num

#num(digits:4)[#calc.pi]
#set-num(exponent: "eng")
#zi.m[2e3] \
#zi.m-s[12e2] \
#zi.declare("V m")([12e2])

#context{
  let quantities = query(selector(metadata).and(<zero-qty>))
  let numbers = query(selector(metadata).and(<zero-num>))
  [
    #quantities.len() qty
    #quantities.first().value.unit.numerator.first().first()
    #numbers.len() num

    #numbers.first().value.float
    #numbers.first().value.args.named().digits
  ]
}
