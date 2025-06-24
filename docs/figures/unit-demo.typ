
#set page(width: auto, height: auto, margin: 1em)

#let clr = if "dark" in sys.inputs { white } else { black }
#set page(fill: white) if clr == black
#set page(fill: none) if clr != black

#set text(fill: clr)
#set text(1.2em)

#import "/src/zero.typ": zi


#let kgm-s2 = zi.declare("kg m/s^2")

- The current world record for the 100 metres is #zi.s[9.58], held by Usain Bolt. 
- The velocity of light is #zi.m-s[299792458].
- A Newton is defined as #kgm-s2[1]. 
- The unit of a frequency is #zi.Hz(). 
