#import "/src/zero.typ": num

#set page(width: auto, height: auto, margin: .5em)


#num(exponent: (fixed: 2))[123] \
#num(exponent: (fixed: -2))[123] \
#num(exponent: (fixed: -2))[1.234] \
#num(exponent: (fixed: 1))[1.234] \
#num(exponent: (fixed: 1))[1e4] \
#num(exponent: (fixed: -1))[1e-4] \
#num(exponent: (fixed: 1))[2+-1] \
#num(exponent: (fixed: 2))[2+-1e1] \
