context("Print Friendly")
library(CirceR)

test_that("renderCohort can be invoked", {
  cohortJson <- paste(readLines("resources/simpleCohort.json"),collapse="\n");
  expect_true(nchar(cohortJson, keepNA=TRUE) > 0)
  
  # test passing the string
  cohortMarkdown <- cohortPrintFriendly(cohortJson);
  expect_true(nchar(cohortMarkdown, keepNA=TRUE) > 0)
  
  cohortExpressionObj <- cohortExpressionFromJson(cohortJson);
  cohortMarkdown <- cohortPrintFriendly(cohortExpressionObj);
  expect_true(nchar(cohortMarkdown, keepNA=TRUE) > 0)
  
})

test_that("renderConceptSetList can be invoked", {
  cohortJson <- paste(readLines("resources/simpleCohort.json"),collapse="\n");
  expect_true(nchar(cohortJson, keepNA=TRUE) > 0)
  cohortExpressionObj <- cohortExpressionFromJson(cohortJson);
  conceptSetMarkdown <- conceptSetListPrintFriendly(cohortExpressionObj$conceptSets);
  expect_true(nchar(conceptSetMarkdown, keepNA=TRUE) > 0)
  
})

test_that("renderConceptSet can be invoked", {
  cohortJson <- paste(readLines("resources/simpleCohort.json"),collapse="\n");
  expect_true(nchar(cohortJson, keepNA=TRUE) > 0)
  cohortExpressionObj <- cohortExpressionFromJson(cohortJson);
  conceptSetMarkdown <- conceptSetPrintFriendly(cohortExpressionObj$conceptSets[[1]]);
  expect_true(nchar(conceptSetMarkdown, keepNA=TRUE) > 0)
  
})