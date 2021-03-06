#' Return the name of the current file.
#'
#' Used to identify the sequential script currently executing. Useful for
#' logging and debugging.
#'
#' @return Returns the name of the script currently being executed.
#'
#' @import this.path
#'
#' @export

current_file <- function ()
  basename(this.path::this.path())

