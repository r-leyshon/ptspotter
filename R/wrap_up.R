#' Wrap up file execution.
#'
#' Used to interrupt sequential script execution while testing or debugging.
#' Prints the elapsed time since execution of `start_time`. Assign `start_time`
#' at the start of the first sequential script. Updates the pipeline message.
#' Outputs an auditory signal and breaks sequential script execution,
#' identifying the script at which execution was interrupted.
#'
#' @param start_time A POSIXct object created by executing Sys.time()'.Ensure
#' this object is assigned prior to calling wrap_up().
#'
#' @param pipeline_message A character vector object used to convey information
#' about the current status of the pipeline. Ensure this object is assigned
#' prior to calling wrap_up().
#'
#' @return Interrupts sequential script execution with an auditory signal. Logs
#' the elapsed time and outputs the script location.
#' @export
wrap_up <- function(start_time, pipeline_message) {
  # calculate elapsed time
  elapsed <- Sys.time() - start_time
  # print execution duration
  print("Script executed. Duration: ")
  print(utils::capture.output(round(elapsed, digits = 3)))

  # update pipeline message.
  pip_msg <- "Pipeline halted."
  assign("pipeline_message", pip_msg, envir = .GlobalEnv)

  # sound alert when script completes
  beepr::beep("coin")

  # stop execution
  stop(paste("wrap_up at", current_file()))
}
