#import "/src/zero.typ": *
#set page(width: auto, height: auto, margin: 2pt)



#num("10.10") \
#num("123.321") \
#num("1234.4321") \
#num("12345.54321") \
#num("1234567") \
#set-group(threshold: calc.inf)
#num("1234567") \
#set-group(threshold: 3)
#num("1234.4321") \
#set-group(separator: "'", size: 2)
#num("12345.54321") \
#set-group(separator: sym.space.thin, size: 3, threshold: 5)

