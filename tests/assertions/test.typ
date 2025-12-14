#import "/src/assertions.typ": *

#assert-option("hey", "my-param", ("hey",))

#assert.eq(
  catch(assert-option.with("hey", "my-param", ("ho",))),
  "assertion failed: Expected , or \"ho\" for `my-param`, got \"hey\"",
)



#assert-settable-args(arguments(), (:))
#assert-settable-args(arguments(hey: 2), "hey")
#assert-settable-args(arguments(hey: 2), (hey: none))

#assert.eq(
  catch(assert-settable-args.with(arguments(2), (:))),
  "assertion failed: Unexpected positional argument: 2",
)


#assert.eq(
  catch(assert-settable-args.with(arguments(hey: 2), (:))),
  "assertion failed: Unexpected named argument: \"hey\"",
)

