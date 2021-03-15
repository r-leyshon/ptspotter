

req_nos <- c(1:5)

req_files <- paste(paste(".", req_nos, sep = "/"), "R",
                   sep = ".")

invisible(file.create(req_files))


new_nos <- req_nos + 1
