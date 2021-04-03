
# fileOps -----------------------------------------------------------------
sequence_file_ops(n = 5, target_dir = "n_is_5")




# tests -------------------------------------------------------------------
# -------------------------------------------------------------------------

# expect message ----------------------------------------------------------
test_that("func produces message on success",
          expect_message(
            sequence_file_ops(1, target_dir = "test_seq"), "New files created:"
          )
)


# n -----------------------------------------------------------------------
# test single digit and different vector types


# target_dir --------------------------------------------------------------


# filetype ----------------------------------------------------------------


# force -------------------------------------------------------------------
# force on and off in a mixed dir
# warning when force is TRUE
# message when force is false

# creates target_dir ------------------------------------------------------


# leading 0s --------------------------------------------------------------


