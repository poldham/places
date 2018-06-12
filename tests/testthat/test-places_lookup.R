context("test-places_lookup.R")

test_that("single name works", {
  one <- places_lookup("UK", type = "country")
  expect_equal(one[[1]], "GB")
})

test_that("two names works", {
  two <- places_lookup(c("United States", "UK"), type = "country")
  expect_equal(two[[1]], "US")
  expect_equal(two[[2]], "GB")

})

# add warning message
# test_that("warning if not found", {
# })

# These tests suffer from the problem of not being able to load the data

# test_that("region works", {
#   # The problem here is that the fun calls data but the tests cant find it.
#   #system.file(lookup, package = "places")
#   region <- places_lookup("Africa", type = "region")
#   expect_length(region, 60)
# })
#
# test_that("subregion works", {
#   subregion <- places_lookup("Australia and New Zealand", type = "subregion")
#   expect_length(subregion, 6)
# })
#
# test_that("intermediate works", {
#   intermediate <- places_lookup("Caribbean", type = "intermediate")
#   expect_length(subregion, 6)
# })
