test_that("Check expected output", {
  expect_identical("test-current_file.R", current_file())
  # contains no "/" or "\"
  expect_false(grepl(pattern = "/", current_file()))
  expect_false(grepl(pattern = "\\\\", current_file()))

})



