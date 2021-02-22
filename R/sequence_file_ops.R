#' sequence_file_ops
#'
#' Quickly create the required number of sequentially labelled files.
#'
#' @param target_dir Directory to create files. Defaults to "munge". Creates
#' the directory if file.exists(target_dir) evaluates to FALSE.
#'
#' @param n The number of files to create. Also accepts numerical vector.
#'
#' @param filetype. The suffix to append the filename. Defaults to ".R".
#'
#' @return Creates logger and file appender.
#' @export

sequence_file_ops <- function(target_dir = "munge", n, filetype = "R"){
  if(!file.exists(target_dir)){
    # if the directory doesn't exist, create it with a prompt.
    dir.create(target_dir)
    print(paste("sequence_file_ops() created",
                paste0(target_dir, "/"), "as it was not found."))
  }

  if(length(n) == 1){
    # if user specifies n as single digit, create required vector
    req_nos <- c(1:n)

  } else if(length(n) > 1){
    # if user provides a vector for n, just use vector
    req_nos <- n

  }

  # wherever the digits are single, add a 0 in front
  req_nos[stringr::str_count(req_nos) == 1] <- paste0(
    "0", req_nos[stringr::str_count(req_nos) == 1]
  )

  # print confirmation msg
  print(paste("Required numbers are", paste0(req_nos, collapse = ", ")))

  # create the filenames
  req_files <- paste(paste(target_dir, req_nos, sep = "/"), filetype, sep = ".")
  print(paste("Required files are", paste(req_files, collapse = ", ")))

  # write the files
  invisible(file.create(req_files))

}

