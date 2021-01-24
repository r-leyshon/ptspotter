#' Perform garbage collection and log allocated memory.
#'
#' Used to log memory allocation at points during sequential script execution.
#'
#' @return Performs garbage collection and logs memory size and script name
#' currently being executed.
#' @export
memory_report <- function() {
  # perform a manual garbage collection
  gc()
  # show me the filename of current file
  thisfile <- current_file()

  # log the used memory at this point
  log4r::info(
    my_logger,
    print(paste(
      "Memory size checked at",
      thisfile, "is", memory.size()
    ))
  )
}
