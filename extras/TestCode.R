# Some random code for testing new features:

cohort <- ROhdsiWebApi::getCohortDefinition(cohortId = 7364, baseUrl = keyring::key_get("baseUrl"))
expression <- RJSONIO::toJSON(cohort$expression)
rendePrintFriendly(expression)
