
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

# down --------------------------------------------------------------------
dir.create("action_down")
sequence_file_ops(c(5:10), target_dir = "action_down")
start_files <- list.files("action_down")
start_nums <- as.numeric(stringr::str_extract(start_files, "^[0-9]."))
adj_file_nos(target = 5, directory = "action_down", action = "down")


# tests -------------------------------------------------------------------

# file counts -------------------------------------------------------------

test_that("input count matches output", {
  # count files
  expect_identical(start_count,
                   end_count)
  expect_identical(mixed_start_count,
                   mixed_end_count)
})

# duplicated files --------------------------------------------------------

test_that("filenames are unique",
          expect_false(object = any(duplicated(list.files("munge")))
                      )
          )

# recurring fullstops -----------------------------------------------------

test_that("there are no double dots",
          expect_false(any(grepl(pattern = "\\.{2,}", x = list.files("munge"))))
          )



# action == "down" --------------------------------------------------------
test_that("all file numbers are decreased",
          expect_true(
            all(
              as.numeric(stringr::str_extract(
                list.files("action_down"), "^[0-9].")) < start_nums)
            )
          )

# 0 in front --------------------------------------------------------------


