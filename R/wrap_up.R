#' Wrap up file execution.
#'
#' Used to interrupt sequential script execution while testing or debugging.
#' messages the elapsed time since execution of `start_time`. Assign `start_time`
#' at the start of the first sequential script. Updates the pipeline message.
#' Outputs an auditory signal and breaks sequential script execution,
#' identifying the script at which execution was interrupted.
#'
#' @param start_time A POSIXct object created by executing Sys.time()'.Ensure
#' this object is assigned prior to calling wrap_up().
#'
#' @param pos The environment which to assign pipeline_message. Defaults to 1,
#' equivalent to the .GlobalEnv.
#'
#' @return Interrupts sequential script execution with an auditory signal. Logs
#' the elapsed time and outputs the script location.
#'
#' @import this.path
#' @import beepr
#'
#' @export
wrap_up <- function(start_time, pos = 1) {
  # calculate elapsed time
  elapsed <- Sys.time() - start_time
  # message execution duration
  message(paste(
    "Script executed. Duration:",
    utils::capture.output(round(elapsed, digits = 3))))

  # sound alert when script completes
  beep("coin")

  # stop execution
  stop(paste("wrap_up at", basename(this.path())))

}
