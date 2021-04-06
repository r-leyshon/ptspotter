#' Wrap up file execution.
#'
#' Used to interrupt sequential script execution while testing or debugging.
#' messages the elapsed time since execution of `start_time`. Assign
#' `start_time` at the start of the first sequential script. Outputs an auditory
#' signal and breaks sequential script execution, identifying the script at
#' which execution was interrupted.
#'
#' @param start_time Optional POSIXct object, created by assigning Sys.time()
#' to an object prior to executing `wrap_up()`.
#'
#' @return Interrupts sequential script execution with an auditory signal. Logs
#' the elapsed time if start_time is used, outputs the script location.
#'
#' @import this.path
#' @import beepr
#'
#' @export
wrap_up <- function(start_time = NULL) {
  if(!is.null(start_time)) {
    # calculate elapsed time
    elapsed <- Sys.time() - start_time
    # message execution duration
    message(paste(
    "Script executed. Duration:",
    utils::capture.output(round(elapsed, digits = 3))))
  }

  # sound alert when script completes
  beep("coin")

  # stop execution
  stop(paste("wrap_up at", basename(this.path())))

}
