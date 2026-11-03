test_that("Episode criteria SQL is generated", {
  cohortJson <- paste(readLines("resources/episodeCohort.json"), collapse = "\n")
  options <- createGenerateOptions(
    cohortId = 1,
    cdmSchema = "CDMSchema",
    targetTable = "cohort",
    resultSchema = "ResultSchema"
  )

  cohortSql <- buildCohortQuery(cohortJson, options)

  expect_match(cohortSql, "EPISODE")
  expect_match(cohortSql, "episode_start_date")
})
