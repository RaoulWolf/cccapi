
# test get_detail()

expect_equal(
  length(unlist(get_detail(NA))),
  1L
  )

expect_equal(
  length(get_detail("50-78-2")),
  15L
)

expect_equal(
  typeof(get_detail("50-78-2", json = TRUE)),
  "character"
)

expect_equal(
  length(get_detail("50-78-2", json = "no")),
  15L
)

# test get_export()

expect_equal(
  nchar(get_export(NA)),
  28L
)

expect_equal(
  nchar(get_export("50-78-2")),
  1289L
)

# test get_search()

expect_equal(
  length(unlist(get_search(NA))),
  1L
)

expect_equal(
  length(unlist(get_search(NULL))),
  1L
)

expect_equal(
  length(get_search("Aspirin")),
  2L
)

expect_equal(
  length(get_search("Aspirin", json = "no")),
  2L
)

expect_equal(
  typeof(get_search("Aspirin", json = TRUE)),
  "character"
)

# test .check_cas()

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
