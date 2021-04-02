# expect message ----------------------------------------------------------
test_that("func produces message on success",
          expect_message(
            sequence_file_ops(1, target_dir = "test_seq")
          )
)
