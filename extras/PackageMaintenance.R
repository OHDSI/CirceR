# @file PackageMaintenance
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

# Format and check code -------------------------------------------------------
OhdsiRTools::formatRFolder("./R")
OhdsiRTools::checkUsagePackage("CirceR")
OhdsiRTools::updateCopyrightYearFolder()
devtools::spell_check()

# Create manual and vignettes ------------------------------------------------------
unlink("extras/CirceR.pdf")
shell("R CMD Rd2pdf ./ --output=extras/CirceR.pdf")

pkgdown::build_site()
OhdsiRTools::fixHadesLogo()

# Import JSON objects as data objects in package ---------------------------------
cohortDefinitionJson <- paste(readLines("extras/simpleCohort.json"), collapse = "\n")
save(cohortDefinitionJson, file = "data/cohortDefinitionJson.rda", compress = "xz")

conceptSetJson <- paste(readLines("extras/conceptSet.json"), collapse = "\n")
save(conceptSetJson, file = "data/conceptSetJson.rda", compress = "xz")

conceptSetListJson <- paste(readLines("extras/conceptSetList.json"), collapse = "\n")
save(conceptSetListJson, file = "data/conceptSetListJson.rda", compress = "xz")


