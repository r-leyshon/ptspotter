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
  x <- list.files(directory)

  # filter out anything that doesn't contain digits at start of string
  y <- x[grepl("^[0-9]", x)]

  # extract numbering
  z <- as.numeric(stringr::str_extract(y, "^[0-9.]*"))

  # remove all numbers from listed filenames vector
  y_new <- stringr::str_remove(y, "^[0-9.]*")

  # test lengths are equal
  if (length(y) != length(z)) {
    stop(
      paste(
        "Execution halted: Number of files and extracted digits unequal.",
        paste("Length of filenames:", length(y), paste(y, collapse = ", ")),
        paste("Length of extracted digits:", length(z),
              paste(z, collapse = ", "))
      )
    )
  }

  # if action == up (the default), increment numbers from target and larger up
  # by one
  if (action == "up") {
    z_new <- z
    z_new[z_new >= target] <- z_new[z_new >= target] + step
    print(paste(length(z_new[z_new >= target]), "file(s) incremented"))

    # if action == down, decrease numbers from target and larger down by one
  } else if (action == "down") {
    z_new <- z
    z_new[z_new >= target] <- z_new[z_new >= target] - step
    print(paste(length(z_new[z_new >= target]), "file(s) decreased"))
  }

  # convert to character
  format(z_new)
  # wherever the digits are single, add a 0 in front
  z_new[stringr::str_count(z_new) == 1] <- paste0(
    "0", z_new[stringr::str_count(z_new) == 1]
  )
  print(paste("Digits assigned: ", paste(z_new, collapse = ", ")))

  # paste together new digits and filenames
  adj_filenames <- paste0(z_new, y_new)

  # paste directory name to complete write path
  old_filenames <- paste(directory, y[y != adj_filenames], sep = "/")
  adj_filenames <- paste(directory, adj_filenames[adj_filenames != y],
                         sep = "/")
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
  print(paste(
    length(old_filenames), "Filenames adjusted from: ",
    paste(old_filenames, collapse = ", "),
    "to",
    paste(adj_filenames, collapse = ", ")
  ))
}
