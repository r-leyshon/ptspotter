# PT Spotter version 1.0

## Description

Helper functions for working with [ProjectTemplate](http://projecttemplate.net/)

***

## Functions

* **adj_file_nos**: Increase or decrease scripts with numerical prefixes.  
Arguments:  
<u>target</u>: Required. The number in the sequential scripts to begin the
adjustment. The adjustment will affect script with that leading digit and
greater. Note that digits must be leading the filename and not trailing.  
<u>directory</u>: Defaults to "munge". The directory holding the sequential
scripts to adjust.  
<u>action</u>: "up or "down". Defaults to "up". Whether to adjust file numbers
up or down.  
<u>step</u>: Defaults to 1. The step by which to increment (or decrease) the
file numbering. Accepts decimals also.  

***

* **log_file_ops**: Creates a specified logging directory and logfile if
required.
Expects [log4r](https://cran.r-project.org/package=log4r) is attached to
namespace.  
Arguments:  
<u>dir_path</u>: The name of the folder in which the logfile should be saved.
Creates the folder if required. Defaults to "logs".  
<u>logfile_nm</u>: Provide a name for the logfile. Do not include suffix.
Defaults to "logfile".  

***

* **log_enable**: Assigns file appender and logger objects to global
environment.
Expects [log4r](https://cran.r-project.org/package=log4r) is attached to
namespace.  
Arguments:  
<u>logfile_loc</u>: The path to the logfile. Defaults to "logs/logfile.txt".

***

* **memory_report**: Performs a manual garbage collection. Print memory size.
Uses **utils::memory.size** unless on Mac OS, where **pryr::mem_used** is used
instead. 

***

* **seq_file_ops**:  Write a series of sequentially numbered files within a
specified directory. Creates the directory if required.  
Arguments:  
<u>target_dir</u>: Directory to create files. Defaults to "munge". Creates
the directory if file.exists(target_dir) evaluates to FALSE.  
<u>n</u>: The number of files to create. Accepts a single number or numerical
vector.  
<u>filetype</u>: The suffix to append the filename with. Do not include full
stops / periods. Defaults to "R".  
<u>force</u>: Defaults to FALSE. If set to TRUE, seq_file_ops will
overwrite any pre-existing files that match the write filenames asked for.

***

* **wrap_up**: Calculates and prints execution duration since
'start_time <- Sys.time'.
Plays an audio jingle using [beepr](https://cran.r-project.org/package=beepr).
Stops execution with a message indicating file location of wrap_up call.  
Arguments:  
<u>start_time</u>: Optional POSIXct object, created by assigning Sys.time()
#' to an object prior to executing `wrap_up()`.

***
## Code of Conduct

Please note that the ptspotter project is released with a [Contributor Code of Conduct](https://contributor-covenant.org/version/2/0/CODE_OF_CONDUCT.html). By contributing to this project, you agree to abide by its terms.

***

## Installation Notes

* If installing from GitHub results in a non-zero exit status, try:
`Sys.setenv(R_REMOTES_NO_ERRORS_FROM_WARNINGS=TRUE)`, solution from [here](https://github.com/r-lib/remotes/issues/434).

***
