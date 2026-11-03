# @file CirceR.R
#
# Copyright 2020 Observational Health Data Sciences and Informatics
#
# This file is part of CirceR
# 
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
# 
#     http://www.apache.org/licenses/LICENSE-2.0
# 
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

#' @keywords internal
"_PACKAGE"

NULL

.onLoad <- function(libname, pkgname) {
  if (requireNamespace("rJava", quietly = TRUE)) {
    tryCatch({
      rJava::.jpackage(pkgname, lib.loc = libname)
      
      # In development mode (e.g. using devtools::load_all), 
      # .jpackage may fail to find the JARs in inst/java.
      # We explicitly add them if they exist in that location.
      jar_dir <- system.file("java", package = pkgname)
      if (jar_dir != "") {
        jars <- list.files(jar_dir, pattern = "\\.jar$", full.names = TRUE)
        if (length(jars) > 0) {
          rJava::.jaddClassPath(jars)
        }
      }
    }, error = function(e) {
      warning("CirceR: Java backend could not be initialized: ", e$message)
    })
  }
}
