
# get_detail()

expect_equal(
  length(unlist(get_detail(NA))),
  0L
  )

# get_export()

expect_equal(
  nchar(get_export(NA)),
  0L
)

# get_search()

expect_equal(
  length(unlist(get_search(NA))),
  0L
)

# .check_cas()

expect_false(
  cccapi:::.check_cas(NA)
)

expect_false(
  cccapi:::.check_cas("cas_rn")
)

expect_false(
  cccapi:::.check_cas("50-78-21")
)

expect_false(
  cccapi:::.check_cas("50-78-1")
)

expect_true(
  cccapi:::.check_cas("50-78-2")
)
