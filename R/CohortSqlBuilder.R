# @file CohortSqlBuilder.R
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

#' Create Generation Options
#' 
#' @description 
#' Creates the generation options object for use in generateSql()
#'
#' @param cohortIdFieldName The field that contains the cohortId in the cohort table.
#' @param cohortId The generated cohort ID.
#' @param cdmSchema The value of the CDM schema.
#' @param targetTable the cohort table name.
#' @param resultSchema the schema the cohort table belongs to.
#' @param vocabularySchema the schema of the vocabulary tables (defaults to cdmSchema)
#' @param generateStats a boolean representing if the query should include inclusion rule statistics calculation
#' 
#' @return 
#' A jObj that can be passed to generateSql().
#' 
#' @export
createGenerateOptions <- function(cohortIdFieldName, cohortId, cdmSchema, targetTable, resultSchema, vocabularySchema, generateStats) {
  UseMethod("createGenerateOptions", .get_backend())
}

#' @export
createGenerateOptions.circe_backend_java <- function(cohortIdFieldName, cohortId, cdmSchema, targetTable, resultSchema, vocabularySchema, generateStats) {
  ensureJavaBackend()
  options <- rJava::new(Class = rJava::J("org.ohdsi.circe.cohortdefinition.CohortExpressionQueryBuilder$BuildExpressionQueryOptions"))
  if (!missing(cohortIdFieldName)) options$cohortIdFieldName <- cohortIdFieldName
  if (!missing(cohortId)) options$cohortId <- rJava::.jnew("java/lang/Integer", as.integer(cohortId))
  if (!missing(cdmSchema)) options$cdmSchema <- cdmSchema
  if (!missing(targetTable)) options$targetTable <- targetTable
  if (!missing(resultSchema)) options$resultSchema <- resultSchema
  if (!missing(vocabularySchema)) options$vocabularySchema <- vocabularySchema
  if (!missing(generateStats)) options$generateStats <- generateStats
  return(options)
}

#' @export
createGenerateOptions.circe_backend_python <- function(cohortIdFieldName, cohortId, cdmSchema, targetTable, resultSchema, vocabularySchema, generateStats) {
  options <- list()
  if (!missing(cohortIdFieldName)) options$cohortIdFieldName <- cohortIdFieldName
  if (!missing(cohortId)) options$cohortId <- as.integer(cohortId)
  if (!missing(cdmSchema)) options$cdmSchema <- cdmSchema
  if (!missing(targetTable)) options$targetTable <- targetTable
  if (!missing(resultSchema)) options$resultSchema <- resultSchema
  if (!missing(vocabularySchema)) options$vocabularySchema <- vocabularySchema
  if (!missing(generateStats)) options$generateStats <- generateStats
  return(options)
}

#' Build cohort SQL
#' 
#' @description 
#' Generates the OMOP CDM Sql to generate the cohort expression
#'
#' @param expression  result of cohortExpressionFromJson containing the cohort expression.
#' @param options  The options built using createGenerateOptions()
#'
#' @return 
#' A character vector containing the OHDSI Sql for the cohort expression
#' 
#' @export
buildCohortQuery <- function(expression, options) {
  UseMethod("buildCohortQuery", .get_backend())
}

#' @export
buildCohortQuery.circe_backend_java <- function(expression, options) {
  ensureJavaBackend()
  cohortQueryBuilder <- rJava::new(Class = rJava::J("org.ohdsi.circe.cohortdefinition.CohortExpressionQueryBuilder"))
  
  # expression can be a org.ohdsi.circe.cohortdefinition.CohortExpression or a String (it’s an overload method):
  sql <- cohortQueryBuilder$buildExpressionQuery(expression, options)
  
  return(sql)
}

#' @export
buildCohortQuery.circe_backend_python <- function(expression, options) {
  circe <- ensurePythonBackend()

  if (is.list(expression) && !inherits(expression, "python.builtin.object")) {
    expression <- RJSONIO::toJSON(expression)
  }
  if (is.character(expression)) {
    expression <- circe$cohort_expression_from_json(expression)
  }

  pyOptions <- circe$cohortdefinition$BuildExpressionQueryOptions()
  if (!is.null(options$cohortIdFieldName)) pyOptions$cohort_id_field_name <- options$cohortIdFieldName
  if (!is.null(options$cohortId)) pyOptions$cohort_id <- as.integer(options$cohortId)
  if (!is.null(options$cdmSchema)) pyOptions$cdm_schema <- options$cdmSchema
  if (!is.null(options$targetTable)) pyOptions$target_table <- options$targetTable
  if (!is.null(options$resultSchema)) pyOptions$result_schema <- options$resultSchema
  if (!is.null(options$vocabularySchema)) pyOptions$vocabulary_schema <- options$vocabularySchema
  if (!is.null(options$generateStats)) pyOptions$generate_stats <- isTRUE(options$generateStats)

  return(circe$build_cohort_query(expression, pyOptions))
}