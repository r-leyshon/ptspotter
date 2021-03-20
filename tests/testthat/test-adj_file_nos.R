
# create infrastructure for testing ---------------------------------------
sequence_file_ops(n = 5)
start_count <- length(list.files("munge"))
adj_file_nos(target = 2)
end_count <- length(list.files("munge"))

# create mixed folder -----------------------------------------------------
dir.create("mixed_folder")
sequence_file_ops(n = 5, target_dir = "mixed_folder")
file.create("mixed_folder/non_numbered.R")
mixed_start_count <- length(list.files("mixed_folder"))
adj_file_nos(target = 2, directory = "mixed_folder")
mixed_end_count <- length(list.files("mixed_folder"))


# tests -------------------------------------------------------------------
test_that("Compare input to output", {
  # count files
  expect_identical(start_count,
                   end_count)
  expect_identical(mixed_start_count,
                   mixed_end_count)
})

test_that("Check output files are unique",
          expect_false(object = any(duplicated(list.files("munge")))
                      )
          )

