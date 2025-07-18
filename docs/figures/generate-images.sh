typst c docs/figures/anatomy.typ --format svg --root .
typst c docs/figures/anatomy.typ docs/figures/anatomy-dark.svg --root . --input dark=true

typst c docs/figures/quick-demo.typ --format svg --root .
typst c docs/figures/quick-demo.typ docs/figures/quick-demo-dark.svg --root . --input dark=true

typst c docs/figures/uncertainty-modes.typ --format svg --root .
typst c docs/figures/uncertainty-modes.typ docs/figures/uncertainty-modes-dark.svg --root . --input dark=true

typst c docs/figures/grouping.typ --format svg --root .
typst c docs/figures/grouping.typ docs/figures/grouping-dark.svg --root . --input dark=true

typst c docs/figures/table.typ docs/figures/table{n}.svg --root .
typst c docs/figures/table.typ docs/figures/table{n}-dark.svg --root . --input dark=true

typst c docs/figures/nonum.typ --format svg --root .
typst c docs/figures/nonum.typ docs/figures/nonum-dark.svg --root . --input dark=true

typst c docs/figures/unit-notation.typ --format svg --root .
typst c docs/figures/unit-notation.typ docs/figures/unit-notation-dark.svg --root . --input dark=true

typst c docs/figures/unit-demo.typ --format svg --root .
typst c docs/figures/unit-demo.typ docs/figures/unit-demo-dark.svg --root . --input dark=true
