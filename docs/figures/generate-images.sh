typst c docs/figures/anatomy.typ --format svg --root .
typst c docs/figures/anatomy.typ docs/figures/anatomy-dark.svg --root . --input dark=true

typst c docs/figures/grouping.typ --format svg --root .
typst c docs/figures/grouping.typ docs/figures/grouping-dark.svg --root . --input dark=true

typst c docs/figures/table.typ docs/figures/table{n}.svg --root .
typst c docs/figures/table.typ docs/figures/table{n}-dark.svg --root . --input dark=true