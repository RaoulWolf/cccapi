
# get_detail()

expect_equal(
  length(unlist(get_detail(NA))),
  1L
  )

expect_equal(
  length(get_detail("50-78-2")),
  15L
)

expect_equal(
  nchar(get_detail("50-78-2", json = TRUE)),
  5830L
)

# get_export()

expect_equal(
  nchar(get_export(NA)),
  28L
)

expect_equal(
  nchar(get_export("50-78-2", attachment = TRUE)),
  1289L
)

# get_search()

expect_equal(
  length(unlist(get_search(NA))),
  1L
)

expect_equal(
  length(get_search("Aspirin")),
  2L
)

expect_equal(
  nchar(get_search("Aspirin", json = TRUE)),
  2782L
)

# .check_cas()

expect_false(
  cccapi:::.check_cas(NA)
)

expect_false(
  cccapi:::.check_cas("cas_rn")
)

expect_false(
  cccapi:::.check_cas("50-78-1.1")
)

expect_false(
  cccapi:::.check_cas("50-78-")
)

expect_false(
  cccapi:::.check_cas("12345650-78-2")
)

expect_false(
  cccapi:::.check_cas("50-78-1")
)

expect_true(
  cccapi:::.check_cas("50-78-2")
)
