test_that("ConceptsetSqlBuilder works", {
  conceptSetJSON <- paste(readLines("resources/conceptSet.json"),collapse="\n");
  expression <- RJSONIO::fromJSON(conceptSetJSON)$expression
  query <- CirceR::buildConceptSetQuery(RJSONIO::toJSON(expression))
  expect_true(nchar(query) > 0)
  
  expect_error(CirceR::buildConceptSetQuery(""), "conceptSetJSON must be a single non-zero length string.")
  expect_error(CirceR::buildConceptSetQuery("{}"), "java.lang.NullPointerException")
})
