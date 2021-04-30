context("Cohort Generate Sql")
library(CirceR)

test_that("createOptions can be invoked", {
  
  options <- createGenerateOptions(cohortId = 1, cdmSchema = "CDMSchema", targetTable = "cohort", resultSchema = "ResultSchema");
  
  # check values in object are set
  expect_equal(1, rJava::.jsimplify(options$cohortId));
  expect_true(rJava::is.jnull(options$cohortIdFieldName))
  
})

test_that("cohortSql is generated", {
  cohortJson <- paste(readLines("resources/simpleCohort.json"),collapse="\n");
  cohortExpressionObj <- cohortExpressionFromJson(cohortJson);
  options <- createGenerateOptions(cohortId = 1, cdmSchema = "CDMSchema", targetTable = "cohort", resultSchema = "ResultSchema");
  cohortSql <- buildCohortQuery(cohortExpressionObj, options);
  
  expect_true(nchar(cohortSql, keepNA=TRUE) > 0)
})

test_that("cohortSql is generated from raw JSON", {
  cohortJson <- paste(readLines("resources/simpleCohort.json"),collapse="\n");
  options <- createGenerateOptions(cohortId = 1, cdmSchema = "CDMSchema", targetTable = "cohort", resultSchema = "ResultSchema");
  cohortSql <- buildCohortQuery(cohortJson, options);
  
  expect_true(nchar(cohortSql, keepNA=TRUE) > 0)
})

test_that("cohortSql is generated with statistics", {
  cohortJson <- paste(readLines("resources/simpleCohort.json"),collapse="\n");
  cohortExpressionObj <- cohortExpressionFromJson(cohortJson);
  options <- createGenerateOptions(cohortId = 1, cdmSchema = "CDMSchema", targetTable = "cohort", resultSchema = "ResultSchema", generateStats = TRUE);
  cohortSql <- buildCohortQuery(cohortExpressionObj, options);
  
  expect_true(nchar(cohortSql, keepNA=TRUE) > 0)
})
