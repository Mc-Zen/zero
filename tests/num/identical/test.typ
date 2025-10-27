#set page(width: auto, height: auto, margin: .5em)
#import "/src/zero.typ": zi, set-unit, num


#table(
  num[10220001],
  num[1e3],
  num[-1e-3],
  num[1+-2],
  num[1+-2e1],
  num(positive-sign: true)[+2],
  num[1.00+.2-0.1],
  num(uncertainty-mode: "compact")[1+-2],
  num[-2+-1e1]
)
