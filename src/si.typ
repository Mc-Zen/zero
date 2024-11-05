#import "units.typ"

#let define(unit) = (
  value => if value == [] { units.unit(unit)} else { units.qty(value, unit) }
)

// SI base units ..
#let ampere = define("A")
#let candela = define("cd")
#let kelvin = define("K")
#let kilogram = define("kg")
#let metre = define("m")
#let meter = metre
#let mole = define("mol")
#let second = define("s")

// .. and shorthands
#let A = ampere
#let cd = candela
#let K = kelvin
#let kg = kilogram
#let m = metre
#let mol = mole
#let s = second


// Derived units ..
#let becquerel = define("Bq")
#let degreeCelsius = define(sym.degree + "C")
#let coulomb = define("C")
#let farad = define("F")
#let gray = define("Gy")
#let hertz = define("Hz")
#let henry = define("H")
#let joule = define("J")
#let lumen = define("lm")
#let katal = define("kat")
#let lux = define("lx")
#let newton = define("N")
#let ohm = define(sym.ohm)
#let pascal = define("Pa")
#let radian = define("rad")
#let siemens = define("S")
#let sievert = define("Sv")
#let steradian = define("sr")
#let tesla = define("T")
#let volt = define("V")
#let watt = define("W")
#let weber = define("Wb")

// .. and shorthands
#let Bq = becquerel
#let C = coulomb
#let F = farad
#let Gy = gray
#let Hz = hertz
#let H = henry
#let J = joule
#let lm = lumen
#let kat = katal
#let lx = lux
#let N = newton
#let Ω = ohm
#let Pa = pascal
#let rad = radian
#let S = siemens
#let Sv = sievert
#let sr = steradian
#let T = tesla
#let V = volt
#let W = watt
#let Wb = weber


#let astronomicalunit = define("au")
#let bel = define("B")
#let dalton = define("Da")
#let day = define("d")
#let decibel = define("dB")
#let degree = define(sym.degree)
#let electronvolt = define("eV")
#let hectare = define("ha")
#let hour = define("h")
#let litre = define("L")
#let liter = define("L")
#let arcminute = define(sym.prime)
#let minute = define("min")
#let arcsecond = define(sym.prime.double)
#let neper = define("Np")
#let tonne = define("t")
#let gram = define("g")

// Common units with prefixes
#let mm = define("mm")
#let km = define("km")
#let cm = define("cm")
#let µm = define("µm")
#let nm = define("nm")
#let pm = define("pm")
#let ms = define("ms")
#let µs = define("µs")
#let ns = define("ns")
#let ps = define("ps")
#let mK = define("mK")
#let nK = define("nK")
#let mF = define("mF")
#let µF = define("µF")
#let nF = define("nF")
#let pF = define("pF")
#let mH = define("mH")
#let THz = define("THz")
#let GHz = define("GHz")
#let MHz = define("MHz")
#let kHz = define("kHz")
#let MJ = define("MJ")
#let kJ = define("kJ")
#let mJ = define("mJ")
#let GPa = define("GPa")
#let MPa = define("MPa")
#let kPa = define("kPa")
#let kPa = define("kPa")
#let MN = define("MN")
#let kN = define("kN")
#let mN = define("mN")
#let kT = define("kT")
#let mT = define("mT")
#let µT = define("µT")
#let nT = define("nT")
#let GV = define("GV")
#let MV = define("MV")
#let kV = define("kV")
#let mV = define("mV")
#let µV = define("µV")
#let nV = define("nV")
#let kA = define("kA")
#let mA = define("mA")
#let µA = define("µA")
#let nA = define("nA")
#let TW = define("TW")
#let GW = define("GW")
#let kW = define("kW")
#let mW = define("mW")
#let mSv = define("mSv")


// combined units
#let m-s = define("m/s")
#let km-h = define("km/h")
