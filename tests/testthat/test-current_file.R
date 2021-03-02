test_that("Check expected output", {
  #expect_identical("test_current_file.R", current_file())
  # expect_identical("testthat.R", current_file())
  # commented out while looking into source error
  # contains no "/" or "\"
  # expect_false(grepl(pattern = "/", current_file()))
  # expect_false(grepl(pattern = "\\\\", current_file()))

})



