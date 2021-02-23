#' Return the name of the current file.
#'
#' Used to identify the sequential script currently executing. Useful for
#' logging and debugging.
#'
#' @return Returns the name of the script currently being executed.
#' @export
current_file <- function(){
  # get last element of this.path()
  if(Sys.info()["sysname"] == "Darwin"){
    cur_file <- sapply(stringr::str_split(this.path::this.path(),
                                          pattern = "/"), utils::tail, 1)
  } else{
  cur_file <- sapply(stringr::str_split(this.path::this.path(),
                                        pattern = "\\\\"), utils::tail, 1)
  }

  return(cur_file)

}
