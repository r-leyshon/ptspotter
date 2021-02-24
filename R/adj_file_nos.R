#' Adjust file numbers.
#'
#' This function is used to increment / decrease sequential scripts within the
#' specified directory, allowing efficient adjustment of script sequence for
#' additional or removed files.
#'
#' @param target Required. The number in the sequential scripts to begin the
#' adjustment. The adjustment will affect script with that leading digit and
#' greater.
#' @param directory Defaults to "munge". The directory holding the sequential
#' scripts.
#' @param action Defaults to "up". Whether to adjust file numbers up or down.
#'
#' @param step Defaults to 1. The step by which to increment or decrement the
#' file numbering.
#'
#' @return Renumbers filenames in the specified directory, according to the
#' specified action. Only affects the target file and above.
#' @export
adj_file_nos <- function(target, directory = "munge", action = "up", step = 1) {
  # list all files in specified directory
  files_found <- list.files(directory)

  # filter out anything that doesn't contain digits at start of string
  num_filenms <- files_found[grepl("^[0-9]*", files_found)]

  # extract numbering
  nums_only <- as.numeric(stringr::str_extract(num_filenms, "^[0-9.]*"))

  # remove all numbers from listed filenames vector
  alpha_only <- stringr::str_remove(num_filenms, "^[0-9]*")

  # test lengths are equal
  if (length(num_filenms) != length(nums_only)) {
    stop(
      paste(
        "Execution halted: Number of files and extracted digits unequal.",
        paste0("Length of filenames: ", length(num_filenms), ". ",
              paste(num_filenms, collapse = ", ")),
        paste0("Length of extracted digits: ", length(nums_only), ". ",
              paste(nums_only, collapse = ", "))
      )
    )
  }
  # reassign the numbers ready for increasing / decreasing
  nums_new <- nums_only

  # if action == up (the default), increment numbers from target and larger up
  # by step
  if (action == "up") {
    # any file numbers greater than the specified target, increase by step
    nums_new[nums_new >= target] <- nums_new[nums_new >= target] + step
    # print the number of files incremented.
    print(paste(length(nums_new[nums_new >= target]), "file(s) incremented"))

    # if action == down, decrease numbers from target and larger down by step
  } else if (action == "down") {
    # any file numbers greater thanspecified target, decrease by step
    nums_new[nums_new >= target] <- nums_new[nums_new >= target] - step
    # print the number of files decreased
    print(paste(length(nums_new[nums_new >= target]), "file(s) decreased"))
  }

  # wherever the digits are single, add a 0 in front
  nums_new[stringr::str_count(nums_new) == 1] <- paste0(
    "0", nums_new[stringr::str_count(nums_new) == 1]
  )
  print(paste("Digits assigned: ", paste(nums_new, collapse = ", ")))

  # if all of the filenames following the numbers are identical,
  # names will need to be introduced to prevent incorrect rename
  if(all(alpha_only == alpha_only[1])){
    # introduce random hashes for identical filenames
    alpha_only <- paste0("-",
                         stringi::stri_rand_strings(n = length(alpha_only),
                                                    length = 10), alpha_only)
    warning("Identical filenames found. Alphanumeric hashes introduced.")
  }

  # paste together new digits and filenames
  adj_filenames <- paste(directory, paste0(nums_new, alpha_only), sep = "/")

  # paste directory name to complete write path
  old_filenames <- paste(directory, files_found, sep = "/")

  # test lengths are equal
  if (length(old_filenames) != length(adj_filenames)) {
    stop(
      paste(
        "Execution halted: Number of old and new filenames are unequal.",
        paste(
          "Length of old filenames:", length(old_filenames), paste(
            old_filenames,
            collapse = ", "
          )
        ),
        paste("Length of adjusted filenames:", length(adj_filenames), paste(
          adj_filenames,
          collapse = ", "
        ))
      )
    )
  }

  # write out only adjusted filenames
  file.rename(from = old_filenames, to = adj_filenames)

  # print confirmation msg to console
  print(paste(
    length(old_filenames), "Filenames adjusted from: ",
    paste(
      if(Sys.info()["sysname"] == "Darwin"){
        lapply(stringr::str_split(old_filenames, pattern = "/"), utils::tail, 1)
      } else{
        lapply(stringr::str_split(old_filenames, pattern = "\\\\"), utils::tail,
               1)
      }, collapse = ", "),
    "to",
    paste(
      if(Sys.info()["sysname"] == "Darwin"){
        lapply(stringr::str_split(adj_filenames, pattern = "/"), utils::tail, 1)
      } else{
        lapply(stringr::str_split(adj_filenames, pattern = "\\\\"), utils::tail,
               1)
      }, collapse = ", ")
  ))
}
