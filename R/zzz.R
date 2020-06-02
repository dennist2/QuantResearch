.onAttach <- function(libname, pkgname) {
  packageStartupMessage("REmail: Basic E-Mail Parsing with Python
                        Version 0.2.0 created on 2018-03-01.
                        copyright (c) 2018, Matthew J. Denny, Penn State
                        Development website: github.com/matthewjdenny/REmail
                        Contact: matthewjdenny@gmail.com")
}

.onLoad <- function(libname, pkgname) {
  user_permission <- utils::askYesNo("Install miniconda? downloads 50MB and takes time")
  if (isTRUE(user_permission)) {
    # reticulate::install_miniconda()
    print("You off dat hook for rn")
    } else {
    message("You should run reticulate::install_miniconda() before using this package")
   }
}
