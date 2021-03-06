context("lists")

# some helpers
test <- import("tftools.test")

test_that("R named lists become Python dictionaries", {
  l <- list(a = 1, b = 2, c = 3)
  reflected <- test$reflect(l)
  expect_equal(l$a, reflected$a)
  expect_equal(l$b, reflected$b)
  expect_equal(l$c, reflected$c)
})

test_that("R dictionaries become R named lists", {
  l <- list(a = 1, b = 2, c = 3)
  dict <- test$makeDict()
  expect_equal(length(dict), length(l))
  expect_equal(dict$a, l$a)
  expect_equal(dict$b, l$b)
  expect_equal(dict$c, l$c)
})

test_that("R unnamed lists become Python tuples", {
  l <- list(1L, 2L, 3L)
  expect_equal(test$asString(l), "(1, 2, 3)")
})

test_that("R tuples become R unnamed lists", {
  tuple <- test$makeTuple()
  expect_equal(tuple, list(1, 2, 3))
})
