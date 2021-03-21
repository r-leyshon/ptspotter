library(stringr)
# how many files to create
req_nos <- order(-c(1:5))
# create file names
req_names <- paste(req_nos, "R", sep = ".")
# create the files
invisible(file.create(req_names))
# adjust the numbering plus 1
new_nos <- as.character(req_nos + 1)
# create new names with the new numbering
new_names <- str_replace(req_names, "^[0-9]*", new_nos)
# file.rename loses the files up to the largest value of new_nos
file.rename(from = req_names, to = new_names)
