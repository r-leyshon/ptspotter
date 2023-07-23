# 'ptspotter' v1.0.2

Patches submitted by author of `this.path` in preparation for breaking changes.

## Test environments
***

* local R installation, R 4.0.4
* ubuntu 16.04 (on travis-ci), R 4.0.4
* win-builder (devel)

## R CMD check results
***
```
── R CMD check results ───────────────────────────────────────── ptspotter 1.0.2
Duration: 16.8s

0 errors ✔ | 0 warnings ✔ | 0 notes ✔
```

**Please note the cran_summary output of `rhub::check_for_cran()`:**
## Test environments
***
```
N  checking for non-standard things in the check directory
   Found the following files/directories:
✔  checking HTML version of manual
     ''NULL''
N  checking for detritus in the temp directory
   Found the following files/directories:
     'lastMiKTeXException'

```

## Reverse dependencies
***

OK: 0
BROKEN: 0
Total time: <1 min

***
***

# 'ptspotter' v1.0.1

**Apologies** for the relatively quick re-submission. Passing a vector of length
greater than 1 to the `target` argument of `adj_file_nos()` risks losing
peoples' work. 1.0.1 causes this to error and vector compatibility could be
added as a feature in a future version.

## Test environments
***

* local R installation, R 4.0.4
* ubuntu 16.04 (on travis-ci), R 4.0.4
* win-builder (devel)

## R CMD check results
***
```
0 errors ✓ | 0 warnings ✓ | 0 notes ✓

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
