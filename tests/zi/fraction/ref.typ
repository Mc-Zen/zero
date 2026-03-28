#set page(width: auto, height: auto, margin: .5em)

#let th = sym.space.thin

$"m"th "s"^(-1)$ \
$"m"\/"s"$ \
$"m"/"s"$ \

$"m"th "s"^(-1) th "N"^(-1)$ \
$"m"\/("s"th"N")$ \
$"m"/("s"th"N")$ \

#pagebreak()

#set super(typographic: false)

m#th;s#super[−1] \
m/s \
m/s \

m#th;s#super[−1]#th;N#super[−1] \
m/(s#th;N) \
m/(s#th;N) \
