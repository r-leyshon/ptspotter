# CRAN feedback

## Submission 1:
***

* \dontrun{} should only be used if the example really cannot be executed
(e.g. because of missing additional software, missing API keys, ...) by
the user. That's why wrapping examples in \dontrun{} adds the comment
("# Not run:") as a warning for the user.
Does not seem necessary in all cases.
Please unwrap the examples if they are executable in < 5 sec, or replace
\dontrun{} with \donttest{}.
**`\dontrun{}` removed from all functions. Replaced with `tempdir()`.**

* Please ensure that your functions do not write by default or in your
examples/vignettes/tests in the user's home filespace (including the
package directory and getwd()). This is not allowed by CRAN policies.
Please omit any default path in writing functions.
**Default paths removed from functions.**

* In your examples/vignettes/tests you can write to tempdir().
**`tempdir()` used in examples & tests. No vignettes at this point.**

* Did you submit your package via the CRAN webform? Since there was no
submission mail generated.
**Initially submitted with `devtools::submit_cran()`. For resubmission I will**
**use the webform.**


## Test environments
***

* local R installation, R 4.0.4
* ubuntu 16.04 (on travis-ci), R 4.0.4
* win-builder (devel)

## R CMD check results
***
```
0 errors ✓ | 0 warnings ✓ | 0 notes ✓

* This is a new release.
* There are no references for the package.
```

**Please note the cran_summary output of `rhub::check_for_cran()`:**
## Test environments
***
```
- R-hub windows-x86_64-devel (r-devel)
- R-hub ubuntu-gcc-release (r-release)
- R-hub fedora-clang-devel (r-devel)

## R CMD check results
***
> On windows-x86_64-devel (r-devel), ubuntu-gcc-release (r-release), fedora-clang-devel (r-devel)
  checking CRAN incoming feasibility ... NOTE
  
  New submission
  
  Possibly mis-spelled words in DESCRIPTION:
    ProjectTemplate (2:39)
  Maintainer: 'Rich Leyshon <leyshonrr@hotmail.co.uk>'

0 errors ✓ | 0 warnings ✓ | 1 note x
```

**Checking the noted line, this is the correct syntax for the package I am**
**referring to.**

## Reverse dependencies
***

None
