
# create infrastructure for testing ---------------------------------------
sequence_file_ops(n = 5)
start_count <- length(list.files("munge"))
adj_file_nos(target = 1)
end_count <- length(list.files("munge"))

# tests -------------------------------------------------------------------
test_that("Compare input to output", {
  # count files
  expect_identical(start_count,
                   end_count)
})

