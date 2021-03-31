[![R-CMD-check](https://github.com/KWB-R/dwc.ar4gw/workflows/R-CMD-check/badge.svg)](https://github.com/KWB-R/dwc.ar4gw/actions?query=workflow%3AR-CMD-check)
[![pkgdown](https://github.com/KWB-R/dwc.ar4gw/workflows/pkgdown/badge.svg)](https://github.com/KWB-R/dwc.ar4gw/actions?query=workflow%3Apkgdown)
[![codecov](https://codecov.io/github/KWB-R/dwc.ar4gw/branch/main/graphs/badge.svg)](https://codecov.io/github/KWB-R/dwc.ar4gw)
[![Project Status](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://www.tidyverse.org/lifecycle/#experimental)
[![CRAN_Status_Badge](https://www.r-pkg.org/badges/version/dwc.ar4gw)]()

# dwc.ar4gw

R Package for preparing Modflow output data for
articifical reality visualisation.

## Installation

For details on how to install KWB-R packages checkout our [installation tutorial](https://kwb-r.github.io/kwb.pkgbuild/articles/install.html).

```r
### Optionally: specify GitHub Personal Access Token (GITHUB_PAT)
### See here why this might be important for you:
### https://kwb-r.github.io/kwb.pkgbuild/articles/install.html#set-your-github_pat

# Sys.setenv(GITHUB_PAT = "mysecret_access_token")

# Install package "remotes" from CRAN
if (! require("remotes")) {
  install.packages("remotes", repos = "https://cloud.r-project.org")
}

# Install KWB package 'dwc.ar4gw' from GitHub
remotes::install_github("KWB-R/dwc.ar4gw")
```

## Documentation

Release: [https://kwb-r.github.io/dwc.ar4gw](https://kwb-r.github.io/dwc.ar4gw)

Development: [https://kwb-r.github.io/dwc.ar4gw/dev](https://kwb-r.github.io/dwc.ar4gw/dev)
