# PT Spotter version 0.1.

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

* **current_file**: Cleans the output of [{this.path}](https://CRAN.R-project.org/package=this.path)
to provide the base name of the R script being executed.

***

* **log_file_ops**: Creates a specified logging directory and logfile if
required.
Expects [{log4r}](https://cran.r-project.org/package=log4r) is attached to
namespace.  
Arguments:  
<u>dir_path</u>: The name of the folder in which the logfile should be saved.
Creates the folder if required. Defaults to "logs".  
<u>logfile_nm</u>: Provide a name for the logfile. Do not include suffix.
Defaults to "logfile".  

***

* **log_enable**: Assigns file appender and logger objects to global
environment.
Expects [{log4r}](https://cran.r-project.org/package=log4r) is attached to
namespace.  
Arguments:  
<u>logfile_loc</u>: The path to the logfile. Defaults to "logs/logfile.txt".

***

* **memory_report**: Performs a manual garbage collection. Print memory size.
Uses **utils::memory.size** unless on Mac OS, where **pryr::mem_used** is used
instead. 

***

* **sequence_file_ops**:  Write a series of sequentially numbered files within a
specified directory. Creates the directory if required.  
Arguments:  
<u>target_dir</u>: Directory to create files. Defaults to "munge". Creates
the directory if file.exists(target_dir) evaluates to FALSE.  
<u>n</u>: The number of files to create. Accepts a single number or numerical
vector.  
<u>filetype</u>: The suffix to append the filename with. Do not include full
stops / periods. Defaults to "R".  
<u>force</u>: Defaults to FALSE. If set to TRUE, sequence_file_ops will
verwrite any pre-existing files that match the write filenames asked for.

***

* **wrap_up**: Calculates and prints execution duration since
'start_time <- Sys.time' Updates `pipeline_message` with "Pipeline halted.".
Plays an audio jingle using
[{beepr}](https://cran.r-project.org/package=beepr). Stops execution with a
message indicating file location of wrap_up call.  
Arguments:  
<u>s_time</u>: A POSIXct object created by executing Sys.time'. Ensure this
object is assigned prior to calling wrap_up.  
<u>pipeline_message</u>: A character vector object used to convey information
about the current status of the pipeline. Ensure this object is assigned
prior to calling wrap_up.

***

## Changelog

### Version 0.2

* current_file now uses basename() for more efficient implementation.
* log_enable asks for log_file_ops if logfile does not exist.
* Prefers assign over <<- with position parameter.
* adj_file_nos and sequence_file_ops use filename hashes for part filename
duplication in the target directory (when some files have been named and some
have not).
* adj_file_nos no longer errors if target directory is a mix of numbered and
non-numbered files.

### Version 0.1

* adj_file_nos introduces alphanumeric hash into filename if all files are
identical.
* current_file cleans string differently for Mac OS.
* wrap_up uses control flow to prompt for log4r infrastructure.
* sequence_file_ops - function to quickly create numbered scripts. Only
overwrites pre-existing files if argument force = TRUE.

***

## Installation Notes

* If installing from GitHub results in a non-zero exit status, try:
`Sys.setenv(R_REMOTES_NO_ERRORS_FROM_WARNINGS=TRUE)`, solution from [here](https://github.com/r-lib/remotes/issues/434).

***

## To do

* unit tests for all functions  
* seq_file_ops avoids overwriting existing files. But if the files are named,
additional numbered scripts are introduced which would cause conflict in
sequential script execution. Detect the numbers and prevent this from happening.
* function to trim decimals from filenames.

## Resolved: Convert to test.

* adj_file_nos is currently failing unit test. Losing first file. Issue is when 
target = 1. Adjust to use file.copy then file.remove the original source files.
* issue: sequence_file_ops(n = 5) creates 5 files, naming is 01.R etc.
adj_file_nos(target = 4) then removes period, leaving syntax 01R etc. Resolved
but convert to a test. Above issue only applies when filename alpha are all
equal.
