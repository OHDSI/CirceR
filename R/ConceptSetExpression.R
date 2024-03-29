# @file CohortExpression.R
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

#' Render read JSON into a ConceptSetExpression instance
#' 
#' @description 
#' Reads a String (json) and deserializes it into a org.ohdsi.circe.vocabulary.CohortExpression
#'
#' @param expressionJson  A character vector containing the cohort expression.
#'
#' @return 
#' A java instance of org.ohdsi.circe.cohortdefinition.CohortExpression.
#' 
#' @export
conceptSetExpressionFromJson <- function(expressionJson) {
  conceptSetExpressionObj <- rJava::new(Class = rJava::J("org.ohdsi.circe.vocabulary.ConceptSetExpression"))
  return(conceptSetExpressionObj$fromJson(expressionJson))
}
