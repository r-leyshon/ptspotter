#' log_enable
#'
#' Assigns the necessary global scope objects for logging with log4r.
#'
#' @param logfile_loc The path to the logfile. Defaults to "logs/logfile.txt".
#'
#' @return Creates logger and file appender.
#' @export
log_enable <- function(logfile_loc = "logs/logfile.txt") {

  # get all attached packages as character vector
  attached_pkgs <- unlist(lapply(utils::sessionInfo()[["otherPkgs"]],
                                 "[", "Package"))

  # if there are no attached pkgs or log4r is not loaded
  if(is.null(attached_pkgs) |
     !"log4r" %in% attached_pkgs){
    # stop execution and output a warning
    stop("log4r not loaded. Have you installed and loaded the package?")

  } else {
    # file appender
    # check for presence of file_app in case of reruns
    if(!"file_app" %in% ls(name = .GlobalEnv)){
      # assign file appender
      file_app <<- log4r::file_appender(logfile_loc,
                                        append = TRUE,
                                        layout = log4r::default_log_layout())
      #test for presence
      if("file_app" %in% ls(name = .GlobalEnv)){
        print("File appender successfully assigned to 'file_app'")
      } else{
        stop("File appender not assigned. Logging not enabled.")
      }
      } else {
        print("file appender already exists. Not re-assigned")
      }

    # logger object
    #test for presence of my_logger in case of reruns
    if(!"my_logger" %in% ls(name = .GlobalEnv)){
      # create logger
      my_logger <<- log4r::logger(
        threshold = "INFO",
        appenders = file_app)

      # test for presence
      if("my_logger" %in% ls(name = .GlobalEnv)){
        print("Logger object sucessfully assigned to 'my_logger'")
        } else{
          stop("Logger object not assigned. Logging not enabled.")
        }
      } else{
      print("my_logger already exists. Not re-assigned.")
      }
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

  }

  # create the logfile
  file.create(log_loc)

}





