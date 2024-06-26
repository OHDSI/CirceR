# @file PrintFriendly.R
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

#' Render cohort print-friendly
#' 
#' @description 
#' Generates a print-friendly (human-readable) representation of the cohort definition. This can for example 
#' be used in a study protocol.
#'
#' @param expression  A character vector or result of cohortExpressionFromJson containing the cohort expression.
#'
#' @return 
#' A character vector containing the markdown.
#' 
#' @export
cohortPrintFriendly <- function(expression) {
  renderer <- rJava::new(Class = rJava::J("org.ohdsi.circe.cohortdefinition.printfriendly.MarkdownRender"))
  expr <- expression
  if (is.list(expression)) { # assuming this is a JSON parsed expression in a RJSONIO list 
    expr <- RJSONIO::toJSON(expression)
  } 
  # expression can be a org.ohdsi.circe.cohortdefinition.CohortExpression or a String (it’s an overload method):
  markdown <- renderer$renderCohort(expr)

  return(markdown)
}

#' Render conceptSet array for print-friendly
#' 
#' @description 
#' Generates a print-friendly (human-readable) representation of an array of concept sets. This can for example 
#' be used in a study protocol.
#'
#' @param conceptSetList  A ConceptSet[] (from cohortExpression.conceptSets), a JSON string, or a list from RJSONIO::fromJson
#'
#' @return 
#' A character vector containing the markdown.
#' 
#' @export
conceptSetListPrintFriendly <- function(conceptSetList) {
  renderer <- rJava::new(Class = rJava::J("org.ohdsi.circe.cohortdefinition.printfriendly.MarkdownRender"))

  if (is.character(conceptSetList)) {
    markdown <- renderer$renderConceptSetList(conceptSetList)
  } else if (is.list(conceptSetList)) {
    if (length(conceptSetList) == 0) {
      markdown <- ""
    } else if (inherits(conceptSetList[[1]],"jobjRef")) { # this is an java array
      markdown <- renderer$renderConceptSetList(rJava::.jarray(conceptSetList, contents.class = "org.ohdsi.circe.cohortdefinition.ConceptSet"))  
    } else {
      markdown <- renderer$renderConceptSetList(RJSONIO::toJSON(conceptSetList))
    }
  } else {
    stop("Unable to determine conceptSetList type in conceptSetListPrintFriendly()")
  }

  return(markdown)
}

#' Render conceptSet array for print-friendly
#' 
#' @description 
#' Generates a print-friendly (human-readable) representation of a single concept set. This can for example 
#' be used in a study protocol.
#'
#' @param conceptSet  A ConceptSet (from cohortExpression.conceptSets[i]), a JSON string, or a list from RJSONIO::fromJson
#'
#' @return 
#' A character vector containing the markdown.
#' 
#' @export
conceptSetPrintFriendly <- function(conceptSet) {
  renderer <- rJava::new(Class = rJava::J("org.ohdsi.circe.cohortdefinition.printfriendly.MarkdownRender"))
  expr <- conceptSet
  if (is.list(conceptSet)) { # assuming this is a JSON parsed expression in a RJSONIO list 
    expr <- RJSONIO::toJSON(conceptSet)
  } 
  
  markdown <- renderer$renderConceptSet(expr)
  
  return(markdown)
}

