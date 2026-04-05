#import "/src/zero.typ": *
#set page(width: auto, height: auto, margin: 2pt)



#num("1.2+-,1") \
#num("2e1.2")

#set-num(decimal-separator: ",")
#num("1.2+-,1") \
#num("2e1.2") 

#set-num(decimal-separator: ".")

#num("1.234", decimal-separator: ",") \
#num("1.234", decimal-separator: "_") \
