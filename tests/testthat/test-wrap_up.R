
# dependencies ------------------------------------------------------------
s_time <- Sys.time()


# tests -------------------------------------------------------------------
# -------------------------------------------------------------------------
test_that("func produces expected error",
          expect_error(
            wrap_up(start_time = s_time),
            "wrap_up at"
            )
          )


