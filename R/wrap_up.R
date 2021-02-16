#' Wrap up file execution.
#'
#' Used to interrupt sequential script execution while testing or debugging.
#' Logs the elapsed time since execution of `start_time`. Assign `start_time` at
#' the start of the first sequential script. Writes all logged lines to the
#' logfile. Updates the pipeline message. Outputs an auditory signal and breaks
#' sequential script execution, identifying the script at which execution was
#' interrupted.
#'
#' @param pipeline_message A character vector object used to convey information
#' about the current status of the pipeline.
#'
#' @return Interrupts sequential script execution with an auditory signal. Logs
#' the elapsed time and outputs the script location.
#' @export
wrap_up <- function(start_time, pipeline_message) {
  # calculate elapsed time
  elapsed <- Sys.time() - start_time
  # # add to logfile
  log4r::info(my_logger, "Script executed. Duration: ")
  log4r::info(my_logger, capture.output(round(elapsed, digits = 3)))

  # write all lines to logs/logfile
  readLines(my_logfile)

  # update pipeline message. '<<-' searches for `pipeline_message` in global scope
  pipeline_message <<- "Pipeline halted."

  # sound alert when script completes
  beepr::beep("coin")

  # stop execution
  stop(paste("wrap_up at", current_file()))
}
