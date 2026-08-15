#set page(width: auto, height: auto, margin: .5em)
#import "/src/zero.typ": *


#zi.m-s[12.3] \
#zi.electronvolt[12.3] \
#(zi.declare("/s"))[12.3] \
#zi.m-s[12.3] \
#zi.electronvolt[12.3] \
#(zi.declare("/s"))[12.3] \

#pagebreak()

#zi.electronvolt[12.3e-2] \
#(zi.declare("EHz"))[12.3e-2] \
#(zi.declare("EHz"))[12.3e-2] \
#zi.electronvolt[12.3e2] \
#(zi.declare("EHz"))[12.3e2] \
#(zi.declare("EHz"))[12.3e2] \
#zi.electronvolt[12.3e2] \
#(zi.declare("EHz"))[12.3e2] \
#(zi.declare("EHz"))[12.3e2] \

#pagebreak()

#(zi.declare("m muN^4/s^2"))[-12+-4e3]

#pagebreak()

#num[12+-23] \
#zi.astronomicalunit() \
#zi.m-s() \
#zi.us() \

#pagebreak()

#num[1.2e1] \
#zi.m-s(fraction: "fraction") \
#zi.m-s(fraction: "fraction")[2e-3] \
