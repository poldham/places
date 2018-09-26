context("test-places_download.R")

 test_that("use of country code in country returns error", {
   expect_error(places_download(country = "UK"))
 })

  test_that("three letter country code returns error", {
    expect_error(places_download(code = "USA"))
 })
# runs the function
# test_that("lowercase lookup works", {
#    lower <- places_download(country = "great britain")
#    expect_identical("http://download.geonames.org/export/dump/GB.zip")
#  })

# test that country and country code combination fails fast
test_that("use of country code and country name returns error", {
  expect_error(places_download(code = "USA", country = "United Kingdom"))
})


# Test that UK converts to GB

# x(code = "UK") # expect identical
# "http://download.geonames.org/export/dump/GB.zip"

# Expect that Namibia entering NA works correctly
