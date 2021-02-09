context("Print Friendly")
library(CirceR)

test_that("renderCohort can be invoked", {
  cohortJson <- paste(readLines("resources/simpleCohort.json"),collapse="\n");
  expect_true(nchar(cohortJson, keepNA=TRUE) > 0)
  
  # test passing the string
  cohortMarkdown <- cohortPrintFriendly(cohortJson);
  expect_true(nchar(cohortMarkdown, keepNA=TRUE) > 0)
  
  # test passing the obj
  cohortExpressionObj <- cohortExpressionFromJson(cohortJson);
  cohortMarkdown <- cohortPrintFriendly(cohortExpressionObj);
  expect_true(nchar(cohortMarkdown, keepNA=TRUE) > 0)
  
  #test passing the RJSONIO list
  cohortMarkdown <- cohortPrintFriendly(RJSONIO::fromJSON(cohortJson));
  expect_true(nchar(cohortMarkdown, keepNA=TRUE) > 0)
  
})

test_that("renderConceptSetList can be invoked", {
  
  cohortJson <- paste(readLines("resources/simpleCohort.json"),collapse="\n");
  expect_true(nchar(cohortJson, keepNA=TRUE) > 0)
  cohortExpressionObj <- cohortExpressionFromJson(cohortJson);
  
  #test passing the object
  conceptSetMarkdown <- conceptSetListPrintFriendly(cohortExpressionObj$conceptSets);
  expect_true(nchar(conceptSetMarkdown, keepNA=TRUE) > 0)
  
  #test passing the JSON
  conceptSetListJson <- paste(readLines("resources/conceptSetList.json"),collapse="\n");
  conceptSetMarkdown <- conceptSetListPrintFriendly(conceptSetListJson);
  expect_true(nchar(conceptSetMarkdown, keepNA=TRUE) > 0)
  
  #test passing the RJSNIO parsed form
  conceptSetMarkdown <- conceptSetListPrintFriendly(RJSONIO::fromJSON(conceptSetListJson));
  expect_true(nchar(conceptSetMarkdown, keepNA=TRUE) > 0)
  
})

test_that("renderConceptSet can be invoked", {
  cohortJson <- paste(readLines("resources/simpleCohort.json"),collapse="\n");
  expect_true(nchar(cohortJson, keepNA=TRUE) > 0)
  cohortExpressionObj <- cohortExpressionFromJson(cohortJson);
  
  #test passing the object
  conceptSetMarkdown <- conceptSetPrintFriendly(cohortExpressionObj$conceptSets[[1]]);
  expect_true(nchar(conceptSetMarkdown, keepNA=TRUE) > 0)
  
  #test passing the json
  conceptSetJson <- paste(readLines("resources/conceptSet.json"),collapse="\n");
  conceptSetMarkdown <- conceptSetPrintFriendly(conceptSetJson);
  expect_true(nchar(conceptSetMarkdown, keepNA=TRUE) > 0)
  
  #test passing the RJSONIO parsed form
  conceptSetMarkdown <- conceptSetPrintFriendly(RJSONIO::fromJSON(conceptSetJson));
  expect_true(nchar(conceptSetMarkdown, keepNA=TRUE) > 0)
  
})