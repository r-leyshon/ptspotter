#' Wrap up file execution.
#'
#' Used to interrupt sequential script execution while testing or debugging.
#' Logs the elapsed time since execution of `start_time`. Assign `start_time` at
#' the start of the first sequential script. Writes all logged lines to the
#' logfile. Updates the pipeline message. Outputs an auditory signal and breaks
#' sequential script execution, identifying the script at which execution was
#' interrupted.
#'
#' @param s_time A POSIXct object created by executing Sys.time()'. Defaults to
#' start_time. Ensure this object is assigned prior to calling wrap_up().
#'
#' @param pipeline_message A character vector object used to convey information
#' about the current status of the pipeline. Ensure this object is assigned
#' prior to calling wrap_up().
#'
#' @param logger Name of the logger object. Defaults to 'my_logger'.
#'
#' @return Interrupts sequential script execution with an auditory signal. Logs
#' the elapsed time and outputs the script location.
#' @export
wrap_up <- function(s_time = start_time,
                    pipeline_message,
                    logger = my_logger,
                    logfile_loc = "logs/logfile.txt") {
  # get all attached packages as character vector
  attached_pkgs <- unlist(lapply(utils::sessionInfo()[["otherPkgs"]],
                                 "[", "Package"))

  # if there are no attached pkgs or log4r is not loaded
  if(is.null(attached_pkgs) |
     !"log4r" %in% attached_pkgs){
    # stop execution and output a warning
    stop("log4r not loaded. Have you installed and loaded the package?")

  } else if(!deparse(substitute(logger)) %in% ls(name = .GlobalEnv)){
    # if logger is not found stop and prompt
    stop(paste(deparse(substitute(logger)),
               "not found. Please run log_enable."))
  } else if(!file.exists(logfile_loc)){
    # if logfile doesn't exist stop and prompt
    stop(paste(deparse(substitute(logfile_loc)),
               "not found. Please run log_file_ops()"))

  }
  # calculate elapsed time
  elapsed <- Sys.time() - s_time
  # # add to logfile
  log4r::info(my_logger, "Script executed. Duration: ")
  log4r::info(my_logger, capture.output(round(elapsed, digits = 3)))

  # update pipeline message. '<<-' searches for `pipeline_message` in global scope
  pipeline_message <<- "Pipeline halted."

  # sound alert when script completes
  beepr::beep("coin")

  # stop execution
  stop(paste("wrap_up at", current_file()))
}
