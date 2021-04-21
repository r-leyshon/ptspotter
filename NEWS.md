# ptspotter News

## Changelog

### Version 1.0

* Bumped to 1.0 for CRAN submission and standardisation.
* Standard R Cmd check continuous integration with GitHub Actions.

### Version 0.3

* New tests.
* `adj_file_nos()` & `seq_file_ops()` no longer introduces hashcodes into names
(`file.rename()` expected behaviour resolved).
* `sequence_file_ops()` renamed to `seq_file_ops()`.
* `wrap_up()` `pos` argument removed and `start_time` argument now optional.
* `log_enable()` now has optional arguments `logger_nm` and `appender_nm`.

### Version 0.2

* `wrap_up()` current file now uses `basename()` for more efficient
implementation.
* `log_enable()` asks for `log_file_ops()` if logfile does not exist.
* All functions prefer assign over <<- with `pos` parameter.
* `adj_file_nos()` and `sequence_file_ops()` use filename hashes for part
filename duplication in the target directory (when some files have been named
and some have not).
* `adj_file_nos()` no longer errors if target directory is a mix of numbered and
non-numbered files.

### Version 0.1

* `adj_file_nos()` introduces alphanumeric hash into filename if all files are
identical.
* `wrap_up()` current file cleans string differently for Mac OS.
* `wrap_up()` uses control flow to prompt for "log4r" infrastructure.
* `sequence_file_ops()` new function - quickly create numbered scripts. Only overwrites pre-existing files if argument `force = TRUE`.

***

## To do

* github.io vignettes.
* function to trim decimals from filenames.
