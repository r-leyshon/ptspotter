
# create infrastructure for testing ---------------------------------------
sequence_file_ops(n = 5)
start_count <- length(list.files("munge"))
# munge_files <- list.files("munge")
munge_nums <- as.numeric(stringr::str_extract(list.files("munge"), "^[0-9]."))
adj_file_nos(target = 1)
end_count <- length(list.files("munge"))

# create mixed folder -----------------------------------------------------
dir.create("mixed_folder")
sequence_file_ops(n = 5, target_dir = "mixed_folder")
# mixed_files <- list.files("mixed_folder")
mixed_nums <- as.numeric(stringr::str_extract(list.files("mixed_folder"),
                                              "^[0-9]."))
file.create("mixed_folder/non_numbered.R")
mixed_start_count <- length(list.files("mixed_folder"))
adj_file_nos(target = 1, directory = "mixed_folder")
mixed_end_count <- length(list.files("mixed_folder"))

# down --------------------------------------------------------------------
dir.create("action_down")
sequence_file_ops(c(5:10), target_dir = "action_down")
# down_files <- list.files("action_down")
down_nums <- as.numeric(stringr::str_extract(list.files("action_down"),
                                             "^[0-9]."))
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
                list.files("action_down"), "^[0-9].")) < down_nums)
            )
          )

# step --------------------------------------------------------------------
test_that("step argument works", {
          expect_true(
            all(as.numeric(stringr::str_extract(
              list.files("munge"), "^[0-9].")) - munge_nums == 1)
          )
          expect_true(
            all(as.numeric(stringr::str_extract(
              list.files(
                "mixed_folder", pattern = "^[0-9]."),
              "^[0-9].")) - mixed_nums == 1)
          )
          expect_true(
            all(as.numeric(stringr::str_extract(
              list.files("action_down"), "^[0-9].")) - down_nums == -1)
            )
          })

# target ------------------------------------------------------------------


# directory ---------------------------------------------------------------


# 0 in front --------------------------------------------------------------


