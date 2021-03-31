### How to build an R package from scratch

usethis::create_package(".")
fs::file_delete(path = "DESCRIPTION")

author <- list(name = "Michael Rustler",
               orcid = "0000-0003-0647-7726",
               url = "https://mrustl.de")


pkg <- list(name = "dwc.ar4gw",
            title = "R Package for Preparing Modflow Output Data for Articifical Reality Visualisation",
            desc  = "R Package for preparing Modflow output data for articifical reality visualisation.")


kwb.pkgbuild::use_pkg(author,
                      pkg,
                      version = "0.0.0.9000",
                      stage = "experimental")

usethis::use_vignette("tutorial")

### R functions
pkg_dependencies <- c("reticulate")

sapply(pkg_dependencies, usethis::use_package)

#desc::desc_add_remotes("kwb-r/kwb.utils",normalize = TRUE)

#usethis::use_pipe()

kwb.pkgbuild::create_empty_branch_ghpages(pkg$name)
