# PT Spotter

Helper functions for working with [ProjectTemplate](http://projecttemplate.net/)


* **adj_file_nos()**: Increase or decrease scripts with numerical prefixes.  
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

* **current_file()**: Cleans the output of [{this.path}](https://CRAN.R-project.org/package=this.path)
to provide the name of the R script being executed.

* **memory_report()**: Performs a manual garbage collection. Report and log
memory size using [{log4r}](https://cran.r-project.org/package=log4r). Expects
log4r infrastructure configured. See also **log_file_ops** and **log_enable**.

* **wrap_up()**: Calculates and logs execution duration since
'start_time <- Sys.time()' using [{log4r}](https://cran.r-project.org/package=log4r).
Updates `pipeline_message` with "Pipeline halted.". Plays an audio jingle using
[{beepr}](https://cran.r-project.org/package=beepr). Stops execution with a
message indicating file location of wrap_up() call.

* **log_file_ops**: Creates a specified logging directory and logfile if required.
Expects [{log4r}](https://cran.r-project.org/package=log4r) is attached to namespace.

* **log_enable**: Assigns file appender and logger objects to global environment.
Expects [{log4r}](https://cran.r-project.org/package=log4r) is attached to namespace.
