# file ops ----------------------------------------------------------------
log_file_ops(dir_path = "log_enable_test", logfile_nm = "log_enable")


# tests -------------------------------------------------------------------
# -------------------------------------------------------------------------
# expect message ----------------------------------------------------------
test_that("func produces message on success", {
  expect_message(
    with(globalenv(), {
      log_enable(logfile_loc = "log_enable_test/log_enable.txt")}),
    "successfully assigned to")

})

# expect env objects ------------------------------------------------------
test_that("log_enable created logging infrastructure", {
  with(globalenv(), {
    expect_true("my_logger" %in% ls())
    expect_true("file_app" %in% ls())
  })

})

# expect messages ---------------------------------------------------------
test_that("func produces expected warnings for missing infrastructure",{
  expect_warning(log_enable(logfile_loc = "not_found.txt"),
                 "Logfile not found.")
  expect_message(expect_warning(log_enable(logfile_loc = "not_found.txt")),
                 "File appender already exists.")
  expect_message(expect_warning(log_enable(logfile_loc = "not_found.txt")),
                 "Logger already exists.")
})
