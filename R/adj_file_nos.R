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
  num_filenms <- files_found[grepl("^[0-9].", files_found)]

  # reverse filenames to ensure chain rewrite doesn't occur
  num_filenms <- num_filenms[rev(grep("^[0-9].", num_filenms))]

  # extract numbering
  nums_only <- as.numeric(stringr::str_extract(num_filenms, "^[0-9]."))

  # remove all numbers from listed filenames vector
  alpha_only <- stringr::str_remove(num_filenms, "^[0-9].")

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
    # any file numbers greater than specified target, decrease by step
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
  # if(any(duplicated(alpha_only))){
  #   # get the duplicated filename suffixes
  #   dupes <- alpha_only[duplicated(alpha_only)]
  #   # introduce random hashes for identical filenames
  #   dupes <- paste0("-",
  #                        stringi::stri_rand_strings(n = length(dupes),
  #                                                   length = 10), dupes)
  #   # find the uniques and join to the new filenames for dupes
  #   not_dupes <- alpha_only[!duplicated(alpha_only)]
  #
  #   alpha_only <- c(not_dupes, dupes)
  #
  #   warning("Identical filenames found. Alphanumeric hashes introduced.")
  # }

  # paste together new digits and filenames
  adj_filenames <- paste(directory, paste(nums_new, alpha_only, sep = "."),
                         sep = "/")

  # paste directory name to complete write path
  old_nums <- paste(directory, num_filenms, sep = "/")

  # test lengths are equal
  if (length(old_nums) != length(adj_filenames)) {
    stop(
      paste(
        "Execution halted: Number of old and new numbered filenames unequal.",
        paste(
          "Length of old filenames:", length(old_nums), paste(
            old_nums,
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
  file.rename(from = old_nums, to = adj_filenames)

  # print confirmation msg to console
  print(paste(
    length(old_nums), "Filenames adjusted from: ",
    paste(basename(old_nums), collapse = ", "),
    "to",
    paste(basename(adj_filenames), collapse = ", ")
  ))
}
