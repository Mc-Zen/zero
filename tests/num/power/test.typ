#import "/src/zero.typ": *
#set page(width: auto, height: auto, margin: 2pt)


// multiplication symbol
#num("2e9") \
#num("2e9", product: math.dot) \
#set-num(product: math.dot)
#num("2e9") \
#set-num(product: math.times)
#num("2e9") \

#pagebreak()


// base
#num("1e2", base: 2) \
#num("1e2", base: $e$) \
#num("1e2", base: $π$) \
#set-num(base: "4")
#num("1e2") \
#set-num(base: 10)
#num("1e2")
