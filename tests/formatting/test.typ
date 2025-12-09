#import "/src/formatting.typ": *

#assert.eq(equation-from-items((sym.minus, [2])).body, $-2$.body)




#assert.eq(insert-group-separators("123"), "123")
#assert.eq(insert-group-separators("1234"), "1234")
#assert.eq(insert-group-separators("12345", separator: " "), "12 345")
#assert.eq(insert-group-separators("123456", separator: " "), "123 456")
#assert.eq(insert-group-separators("1234567", separator: " "), "1 234 567")
#assert.eq(insert-group-separators("12345678", separator: " "), "12 345 678")
#assert.eq(
  insert-group-separators("12345678", separator: " ", size: 2),
  "12 34 56 78",
)
#assert.eq(
  insert-group-separators("1234", separator: " ", threshold: 3),
  "1 234",
)

#assert.eq(
  insert-group-separators("1234", separator: " ", threshold: 3, invert: true),
  "123 4",
)
#assert.eq(
  insert-group-separators(
    "1234567",
    separator: " ",
    threshold: 3,
    invert: true,
  ),
  "123 456 7",
)
#assert.eq(
  insert-group-separators(
    "1234567",
    separator: " ",
    size: 2,
    threshold: 3,
    invert: true,
  ),
  "12 34 56 7",
)




#assert.eq(pad-or-truncate("345", 3), "345")
#assert.eq(pad-or-truncate("345", 4), "3450")
#assert.eq(pad-or-truncate("345", 2), "34")
