# PT Spotter

Helper functions for working with [ProjectTemplate](http://projecttemplate.net/)


* **adj_file_nos()**: Increase or decrease scripts with numerical prefixes.

* **current_file()**: Cleans the output of [{this.path}](https://CRAN.R-project.org/package=this.path)
to provide the name of the R script being executed.

* **memory_report()**: Performs a manual garbage collection. Report and log
memory size using [{log4r}](https://cran.r-project.org/package=log4r).

* **wrap_up()**: Calculates and logs execution duration since
'start_time <- Sys.time()' using [{log4r}](https://cran.r-project.org/package=log4r).
Updates `pipeline_message` with "Pipeline halted.". Plays an audio jingle using
[{beepr}](https://cran.r-project.org/package=beepr). Stops execution with a
message indicating file location of wrap_up() call.


* **log_file_ops**: Creates a specified logging directory and logfile if required.
Expects [{log4r}](https://cran.r-project.org/package=log4r) is attached to namespace.

* **log_enable**: Assigns file appender and logger objects to global environment.
Expects [{log4r}](https://cran.r-project.org/package=log4r) is attached to namespace.
