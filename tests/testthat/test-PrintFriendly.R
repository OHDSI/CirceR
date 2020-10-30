context("Print Friendly")
library(CirceR)
data(cohortDefinitionJson)

test_that("renderCohort can be invoked", {
  expect_true(nchar(cohortDefinitionJson, keepNA = TRUE) > 0)
  
  # test passing the string
  cohortMarkdown <- cohortPrintFriendly(cohortDefinitionJson)
  expect_true(nchar(cohortMarkdown, keepNA = TRUE) > 0)
  
  cohortExpressionObj <- cohortExpressionFromJson(cohortDefinitionJson)
  cohortMarkdown <- cohortPrintFriendly(cohortExpressionObj)
  expect_true(nchar(cohortMarkdown, keepNA = TRUE) > 0)
})

test_that("renderConceptSetList can be invoked", {
  expect_true(nchar(data(cohortDefinitionJson), keepNA = TRUE) > 0)
  cohortExpressionObj <- cohortExpressionFromJson(cohortDefinitionJson)
  conceptSetMarkdown <- conceptSetListPrintFriendly(cohortExpressionObj$conceptSets)
  expect_true(nchar(conceptSetMarkdown, keepNA = TRUE) > 0)
})

test_that("renderConceptSet can be invoked", {
  expect_true(nchar(data(cohortDefinitionJson), keepNA = TRUE) > 0)
  cohortExpressionObj <- cohortExpressionFromJson(cohortDefinitionJson)
  conceptSetMarkdown <- conceptSetPrintFriendly(cohortExpressionObj$conceptSets[[1]])
  expect_true(nchar(conceptSetMarkdown, keepNA = TRUE) > 0)
})