#import "/src/zero.typ": *
#set page(width: auto, height: auto, margin: 2pt)


#num("1e3", positive-sign-exponent: false) \
#num("1e3", positive-sign-exponent: true) \
#num("1e-1", positive-sign-exponent: false) \
#num("1e-1", positive-sign-exponent: true) \
#set-num(positive-sign-exponent: true)
#num("1e9") \
#set-num(positive-sign-exponent: false)
#num("1e9")
