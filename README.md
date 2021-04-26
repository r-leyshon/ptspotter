# PT Spotter version 1.0.1

<!-- badges: start -->
[![CRAN status](https://www.r-pkg.org/badges/version/ptspotter)](https://CRAN.R-project.org/package=ptspotter)  
[![R build status](https://github.com/r-leyshon/ptspotter/workflows/R-CMD-check/badge.svg)](https://github.com/r-leyshon/ptspotter/actions)  

[![Codecov test coverage](https://codecov.io/gh/r-leyshon/ptspotter/graph/badge.svg)]()
<!-- badges: end -->

## Description

Helper functions for use with [ProjectTemplate](http://projecttemplate.net/)

***

## Functions

* **'adj_file_nos()'**: Increase or decrease scripts with numerical prefixes.  
Arguments:  
`target`: Required. The number in the sequential scripts to begin the 
adjustment. Use single digits only. The adjustment will affect script with that leading digit and greater.  
`directory`: The directory holding the sequential
scripts to adjust.  
`action`: "up or "down". Defaults to "up". Whether to adjust file numbers
up or down.  
`step`: Defaults to 1. The step by which to increment (or decrease) the
file numbering. Accepts decimals also.  

***

* **'log_file_ops()'**: Creates a specified logging directory and logfile if
required.
Expects ['log4r'](https://cran.r-project.org/package=log4r) is attached to
namespace.  
Arguments:  
`dir_path`: The name of the folder in which the logfile should be saved.
Creates the folder if required.  
`logfile_nm`: Provide a name for the logfile. Do not include suffix.
Defaults to "logfile".  

***

* **'log_enable()'**: Assigns file appender and logger objects to global
environment.
Expects ['log4r'](https://cran.r-project.org/package=log4r) is attached to
namespace.  
Arguments:  
`logfile_loc`: The path to the logfile.  
`pos`: The environment which to assign pipeline_message. Defaults to 1,
equivalent to the .GlobalEnv.  
`logger_nm`: What to call the logger. Provide unquoted strings with no spaces. Defaults to my_logger.  
`appender_nm`:  What to call the appender function. Provide unquoted strings
with no spaces. Defaults to file_app.

***

* **'memory_report()'**: Performs a manual garbage collection. Print memory
size. Uses **'utils::memory.size()'** unless on Mac OS, where
**'pryr::mem_used()'** is used. 

***

* **'seq_file_ops()'**:  Write a series of sequentially numbered files within a
specified directory. Creates the directory if required.  
Arguments:  
`target_dir`: Directory to create files. Creates the directory if file.exists(target_dir) evaluates to FALSE.  
`n`: The number of files to create. Accepts a single number or numerical
vector.  
`filetype`: The suffix to append the filename with. Do not include full
stops / periods. Defaults to "R".  
`force`: Defaults to FALSE. If set to TRUE, seq_file_ops will
overwrite any pre-existing files that match the write filenames asked for.

***

* **'wrap_up()'**: Calculates and prints execution duration since
`start_time <- Sys.time`.
Plays an audio jingle using ['beepr'](https://cran.r-project.org/package=beepr).
Stops execution with a message indicating file location of wrap_up call.  
Arguments:  
`start_time`: Optional POSIXct object, created by assigning Sys.time()
#' to an object prior to executing `wrap_up()`.

***
## Code of Conduct

Please note that the ptspotter project is released with a [Contributor Code of Conduct](https://contributor-covenant.org/version/2/0/CODE_OF_CONDUCT.html). By contributing to this project, you agree to abide by its terms.

***

## Installation Notes

* If installing from GitHub results in a non-zero exit status, try:
`Sys.setenv(R_REMOTES_NO_ERRORS_FROM_WARNINGS=TRUE)`, solution from [here](https://github.com/r-lib/remotes/issues/434).

***
