# file ops ----------------------------------------------------------------
log_file_ops(dir_path = "log_enable_test", logfile_nm = "log_enable")


# tests -------------------------------------------------------------------
# -------------------------------------------------------------------------

# logfile_loc -------------------------------------------------------------


# position ----------------------------------------------------------------


# file_app doesnt exist ---------------------------------------------------



# file_app exists ---------------------------------------------------------


# logger doesnt exist -----------------------------------------------------



# logger exists -----------------------------------------------------------


# logfile_loc already exists ----------------------------------------------

# expect message ----------------------------------------------------------
test_that("func produces message on success",
          expect_message(
            log_enable(logfile_loc = "log_enable_test/log_enable.txt"),
            "successfully assigned to"
          )
)