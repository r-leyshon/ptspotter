#' Enable logging
#'
#' Create the necessary infrastructure to efficiently get up and running with
#' log4r
#'
#' @param dir_path The name of the folder in which the logfile should be saved.
#' Creates the folder if required. Defaults to "logs".
#'
#' @param logfile_nm Provide a name for the logfile. Do not include suffix.
#' Defaults to "logfile".
#'
#' @return Creates log directory, log file, file appender.
#' @export
enable_log <- function(dir_path = "logs", logfile_nm = "logfile"){
  # retrieve the loaded packages
  loaded_pckgs <- devtools::session_info()[2][[1]][,1]
  # test for presence of log4r and output warning if not loaded
  if(!"log4r" %in% loaded_pckgs){
    stop("log4r not loaded. Have you installed and loaded the package?")
  }
  # create log directory
  dir.create(dir_path)
  # store log location
  log_loc <<- paste0(dir_path, "/", logfile_nm, ".txt")
  # create logfile
  file.create(log_loc, showWarnings = TRUE)
  # create file appender
  file_app <- file_appender(log_loc,
                            append = TRUE,
                            layout = default_log_layout()
  )
  # create logger
  my_logger <<- log4r::logger(
    threshold = "INFO",
    appenders = file_app
  )
}
