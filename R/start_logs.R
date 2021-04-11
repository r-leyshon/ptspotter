#' log_enable
#'
#' Assigns the necessary global scope objects for logging with log4r.
#'
#' @param logfile_loc The path to the logfile. Defaults to "logs/logfile.txt".
#'
#' @param pos The environment which to assign pipeline_message. Defaults to 1,
#' equivalent to the .GlobalEnv.
#'
#' @param logger_nm What to call the logger. Provide unquoted strings with no
#' spaces. Defaults to my_logger.
#'
#' @param appender_nm What to call the appender function. Provide unquoted
#' strings with no spaces. Defaults to file_app.
#'
#' @return Creates logger and file appender.
#'
#' @import log4r
#'
#' @examples
#' \dontrun{
#' # create logging infrastructure
#' log_file_ops()
#' # enable logging
#' log_enable()
#' }
#'
#' @export
log_enable <- function(logfile_loc = "logs/logfile.txt", pos = 1,
                       logger_nm = my_logger, appender_nm = file_app) {

  file_app <- file_appender(logfile_loc,
                            append = TRUE,
                            layout = default_log_layout())
  my_logger <- logger(
    threshold = "INFO",
    appenders = file_app)

  # file appender
  # check for presence of file_app in case of reruns
  if(!deparse(substitute(appender_nm)) %in% ls(name = as.environment(pos))){
    # assign file appender
    assign(deparse(substitute(appender_nm)), file_app,
           envir = as.environment(pos))

    #test for presence
    if(deparse(substitute(appender_nm)) %in% ls(name = as.environment(pos))){
      message(paste("File appender successfully assigned to",
                    deparse(substitute(appender_nm)))
      )

      } else{
        stop("File appender not assigned. Logging not enabled.")

        }
    } else {
      message("File appender already exists. Not re-assigned.")

    }

  # logger object
  #test for presence of my_logger in case of reruns
  if(!deparse(substitute(logger_nm)) %in% ls(name = as.environment(pos))){
    # create logger
    assign(deparse(substitute(logger_nm)), my_logger,
           envir = as.environment(pos))
    # test for presence
    if(deparse(substitute(logger_nm)) %in% ls(name = as.environment(pos))){
      message(paste("Logger object sucessfully assigned to",
                    deparse(substitute(logger_nm))))

        } else{
          stop("Logger not assigned. Logging not enabled.")

        }
      } else{
        message("Logger already exists. Not re-assigned.")

      }

  # Check if the logfile already exists, if not output a warning.
  if(!file.exists(logfile_loc)){
    warning(
      "Logfile not found. Please run ptspotter::log_file_ops.")
    }
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
#'
#' @examples
#' \dontrun{
#' log_file_ops()
#' }
#'
#' @export
log_file_ops <- function(dir_path = "logs", logfile_nm = "logfile"){
  # store log location
  log_loc <- paste0(dir_path, "/", logfile_nm, ".txt")

  if(file.exists(log_loc)){
    # if logfile exists output warning & stop
    stop("Logfile with name matching logfile_nm found. Have you previously run
         enable_log()?")

  } else if(!dir.exists(dir_path)){
    # only create folder if it doesn't exist
    # create log directory
    dir.create(dir_path)

    if(dir.exists(dir_path)){
      message(paste0("Logging directory successfully created at '",
                   dir_path, "/'"))
    }

  }

  # create the logfile
  file.create(log_loc)
  if(file.exists(log_loc)){
    message(paste0("Logfile successfully created at '", log_loc, "'"))
  }

}
