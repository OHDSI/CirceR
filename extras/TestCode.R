# Some random code for testing new features:

cohort <- ROhdsiWebApi::getCohortDefinition(cohortId = 18390, baseUrl = keyring::key_get("baseUrl"))
expression <- RJSONIO::toJSON(cohort$expression)
markdown <- renderPrintFriendly(expression)
writeLines(markdown)
