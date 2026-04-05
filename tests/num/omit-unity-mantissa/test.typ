#import "/src/zero.typ": *
#set page(width: auto, height: auto, margin: 2pt)


#num("1e9", omit-unity-mantissa: false) \
#num("1e9", omit-unity-mantissa: true) \
#num("2e9", omit-unity-mantissa: true) \
#num("1+-1e9", omit-unity-mantissa: true) \
#num("1", omit-unity-mantissa: true) \
#set-num(omit-unity-mantissa: true)
#num("1e3") \
#set-num(omit-unity-mantissa: false)
#num("1e3") \

#pagebreak()

// not omitted because mantissa is 1.00
#num(omit-unity-mantissa: true, exponent: "sci")[100] \
// but omitted when trailing zeros are trimmed
#num(omit-unity-mantissa: true, exponent: "sci", trim-zeros: true)[100]
