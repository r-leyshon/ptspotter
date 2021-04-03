
# fileOps -----------------------------------------------------------------
sequence_file_ops(n = 5, target_dir = "n_is_5")
sequence_file_ops(n = c(1:5), target_dir = "n_is_1_to_5")
sequence_file_ops(n = 100, target_dir = "n_is_100")
sequence_file_ops(n = c(1:100), target_dir = "n_is_1_to_100")
sequence_file_ops(n = c(1, 3, 5, 7, 9), target_dir = "n_is_odd_nums")
sequence_file_ops(n = c(1, 3:8, 10), target_dir = "n_is_mixed_vec")
sequence_file_ops(n = 5, target_dir = "testing_filetype", filetype = "txt")


# tests -------------------------------------------------------------------
# -------------------------------------------------------------------------

# expect message ----------------------------------------------------------
test_that("func produces expected messages", {
  expect_message(sequence_file_ops(1, target_dir = "test_seq"),
                 "New files created:")

  expect_message(sequence_file_ops(1, target_dir = "test_new_dir"),
                 "created test_new_dir/ as it was not found.")
})

# n -----------------------------------------------------------------------
test_that("different n formats are supported", {
  expect_identical(length(list.files("n_is_5")),
                   length(list.files("n_is_1_to_5")))

  expect_identical(length(list.files("n_is_100")),
                   length(list.files("n_is_1_to_100")))

  expect_identical(as.integer(5), length(list.files("n_is_odd_nums")))

  expect_identical(as.integer(8), length(list.files("n_is_mixed_vec")))

})


# target_dir --------------------------------------------------------------
test_that("target_dir has been created", {
  expect_true(dir.exists("n_is_5"))
  expect_true(dir.exists("n_is_1_to_5"))
  expect_true(dir.exists("n_is_100"))
  expect_true(dir.exists("n_is_1_to_100"))
  expect_true(dir.exists("n_is_odd_nums"))
  expect_true(dir.exists("n_is_mixed_vec"))
          })

# filetype ----------------------------------------------------------------
test_that("specified filetype is found", {
  expect_true(all(str_extract(list.files("testing_filetype"),
                              pattern = "[^\\.]*$") == "txt"))

  expect_true(all(str_extract(list.files("n_is_5"),
                              pattern = "[^\\.]*$") == "R"))

  })



# force -------------------------------------------------------------------
# force on and off in a mixed dir
# warning when force is TRUE
# message when force is false


# leading 0s --------------------------------------------------------------


