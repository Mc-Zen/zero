## How to contribute a new language for accessibility
Zero generates accessible output! Numbers, units, and quantities that are formatted with Zero have automatically generated alt descriptions that specify how a screen reader should read them.

This is supported for a selection of languages and you can extend this selection by opening a PR and providing the necessary translations for the new language. When opening a PR, please read this document carefully and answer all questions below.

### Translations for numbers
In order to provide descriptions for numerals, add an entry for the new language in the file [`accessibility.typ`](../src/accessibility.typ) and specify translations for the following keys in the dictionary `phrases`:
- `times` and `power`:
  - These two determine how multiplication and exponentiation is pronounced in the language. This is used for exponent notation; e.g. `num[1e5]` is read as `1 times 10 to the power of 5` when the language is set to English.

- `plus` and `minus`:
  - These two are used to read uncertainties; e.g. `num[10+-2]` is read as `10 plus minus 2` when the language is set to English. The translation of `minus` is also used for the sign, e.g. `num[-5]` becomes `minus 5`.

> [!IMPORTANT]
> Does the translation work for both symmetric and asymmetric uncertainties?
> - `num[10+-2]` → `10 [plus] [minus] 2`
> - `num[10+3-2]` → `10 [plus] 3 [minus] 2`
>
> If not, let us know in the PR discussion.

> [!IMPORTANT]
> Does the translation for `minus` also work for the sign in front of the number?
> 
> If not, let us know in the PR discussion.

- `per`:
  - For every unit component in the denominator of a compound unit, this word is prepended, e.g.  `meter per second`. 

### Translations of prefixes
Please provide translations of all common prefixes like milli, giga etc.
Prefixes that are the same as in English should be left unspecified; they will automatically be inherited from the English translation.

### Translations of units
Please provide translations of all units where they deviate from the English translation. All units should be given as singular words. The `pluralize` dictionary defines how the plural for a given unit symbol is formed. Sometimes this involves just adding or changing a suffix, sometimes the plural version is entirely different.

All languages that are supported so far have the following rules regarding to when and where to use to plural:

1. In the context of a quantity that combines a value with a unit, the plural is only used when the value is not 1 or -1. In French, the rule is more particular and requires the absolute of the value to be greater than or equal to 2. 
2. In a composed unit, only the last unit in the numerator is in plural form; the leading units are singular. 
3. Units in the denominator are always singular.

In order to control the rule for the first point, you can override the function `needs-plural`. If any of the other rules does not apply in your language, please mention this in the PR.

### Power shorthands
> [!IMPORTANT]
> Many languages have dedicated shorthand expressions for certain powers like `newton squared` instead of `newton to the power of two`. If your language has such shorthands, you can define them in `power-shorthands`. 

```typ
#let power-shorthands = (
  en: (
    "2": "squared",
    "3": "cubed",
  ),
  de: (
    "2": unit => "Quadrat" + lower(unit),
    "3": unit => "Kubik" + lower(unit),
  ),
)
```
Each entry defines one shorthand for a specific exponent. If the shorthand is just added as a separate word after the unit as in `newton squared`, it is sufficient to provide a string. If the necessary modification is more complicated, the shorthand can also be given as a function that takes the unit as argument.


### Joining prefixes with units
> [!IMPORTANT]
> How are prefixes (like centi) joined to units?

In most languages, the prefix is just joined with the unit, e.g. `cm` becomes `centimeter`. However, in German for example, it is necessary to transform the unit to lower case. In such an instance, modify the function `join-prefix-unit` to cover the case of the new language accordingly.


### Anything else?
Is there anything else that the new language requires? Mind that the descriptions might necessarily be a bit simplified, it is for example infeasible to adapt units to the grammatical case of surrounding text. Nonetheless, the infrastructure of Zero regarding accessibility can be extended to accommodate needs for languages that were not considered during its conception.
