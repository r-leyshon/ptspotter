## Test environments
* local R installation, R 4.0.4
* ubuntu 16.04 (on travis-ci), R 4.0.4
* win-builder (devel)

## R CMD check results

0 errors | 0 warnings | 1 note

* This is a new release.
* There are no references for the package.

**Please note the cran_summary output of `rhub::check_for_cran()`:**
## Test environments
- R-hub windows-x86_64-devel (r-devel)
- R-hub ubuntu-gcc-release (r-release)
- R-hub fedora-clang-devel (r-devel)

## R CMD check results
> On windows-x86_64-devel (r-devel), ubuntu-gcc-release (r-release), fedora-clang-devel (r-devel)
  checking CRAN incoming feasibility ... NOTE
  
  New submission
  
  Possibly mis-spelled words in DESCRIPTION:
    ProjectTemplate (2:39)
  Maintainer: 'Rich Leyshon <leyshonrr@hotmail.co.uk>'

0 errors ✓ | 0 warnings ✓ | 1 note x

* Checking the noted line, this is the correct syntax for the package I am 
referring to. Unsure if single or double quotation marks would be better.
