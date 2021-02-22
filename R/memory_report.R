#' Perform garbage collection and log allocated memory.
#'
#' Used to log memory allocation at points during sequential script execution.
#'
#' @param logger the name of the log4r logger object. Defaults to my_logger.
#'
#' @return Performs garbage collection and logs memory size and script name
#' currently being executed.
#'
#' @export
memory_report <- function(logger = my_logger) {
  # perform a manual garbage collection
  gc()
  # show me the filename of current file
  thisfile <- current_file()

  # log the used memory at this point
  log4r::info(
    logger,
    print(paste(
      "Memory size checked at",
      thisfile, "is",
      if(Sys.info()["sysname"] == "Darwin"){
        pryr::mem_used()
        } else(memory.size())
    ))
  )
}
