#' log_enable
#'
#' Assigns the necessary global scope objects for logging with log4r.
#'
#' @param logfile_loc The path to the logfile. Defaults to "logs/logfile.txt".
#'
#' @param logger_nm Provide a name for the logger object. Defaults to "my_logger"
#'
#'@param attached_pkgs Defaults to otherPkgs listed in utils::sessionInfo.
#'
#' @return Creates log directory, log file, file appender.
#' @export

log_enable <- function(logfile_loc = "logs/logfile.txt") {
  # assign file appender
  assign("file_app",
         value = log4r::file_appender(logfile_loc,
                                      append = TRUE,
                                      layout = log4r::default_log_layout()),
         envir = .GlobalEnv)

  # create logger
  assign("my_logger", value = log4r::logger(
    threshold = "INFO",
    appenders = file_app
  ),
  envir = .GlobalEnv)
}


# log_file_ops ------------------------------------------------------------

#' log_file_ops
#'
#' Create the necessary file infrastructure to efficiently get up and running
#' with log4r.
#'
#' @param dir_path The name of the folder in which the logfile should be saved.
#' Creates the folder if required. Defaults to "logs".
#'
#' @param logfile_nm Provide a name for the logfile. Do not include suffix.
#' Defaults to "logfile".
#'
#' @return Creates log directory and log file if required. Calls log_enable()
#' to assign necessary logging objects in global scope.
#' @export
log_file_ops <- function(dir_path = "logs",
                         logfile_nm = "logfile",
                         logger_nm = "my_logger"){
  # get all attached packages as character vector
  attached_pkgs <- unlist(lapply(utils::sessionInfo()[["otherPkgs"]],
                                 "[", "Package"))

  # store log location
  log_loc <<- paste0(dir_path, "/", logfile_nm, ".txt")

  # if there are no attached pkgs or log4r is not loaded
  if(is.null(attached_pkgs) |
     !"log4r" %in% attached_pkgs){
    # stop execution and output a warning
    stop("log4r not loaded. Have you installed and loaded the package?")

  } else if(file.exists(log_loc)){
    # if logfile exists output warning & stop
    stop("Logfile with name matching logfile_nm found. Have you previously run
         enable_log()?")

  } else if(!dir.exists(dir_path)){
    # only create folder if it doesn't exist
    # create log directory
    dir.create(dir_path)

  } else {
  # create logfile
  file.create(log_loc, showWarnings = TRUE)

  }
}





