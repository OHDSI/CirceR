# Some random code for testing new features:

cohort <- ROhdsiWebApi::getCohortDefinition(cohortId = 18390, baseUrl = keyring::key_get("baseUrl"))
expression <- RJSONIO::toJSON(cohort$expression)
markdown <- CirceR::cohortPrintFriendly(expression)
writeLines(markdown)



expression <- SqlRender::readSql("c:/temp/t2dm.json")
markdown <- CirceR::cohortPrintFriendly(expression)
writeLines(markdown)
201826006

text <- stringr::str_replace_all(stringr::str_replace_all(markdown, "\r", ""), "\n+", "\n\n")
writeLines(text)
SqlRender::writeSql(text, "c:/temp/t2dm.md")
writeLines(markdown::renderMarkdown(file = NULL, text = text))


writeLines(stringr::str_replace_all(stringr::str_replace_all(markdown, "\r", ""), "\n\n\n", "\n\n"))


markdown <- sapply(1:6, function(level) paste(c(rep(" ", level * 3), "1. Level ", level), collapse = ""))
markdown <- paste(markdown, collapse = "\n\n")
writeLines(markdown)


markdown <- "Test\n\"Test\", this < that"
mdFile <- tempfile(fileext = ".md")
htmlFile <- tempfile(fileext = ".html")
SqlRender::writeSql(markdown, mdFile)
rmarkdown::render(input = mdFile,
                  output_format = "html_fragment ",
                  output_file = htmlFile,
                  clean = TRUE,
                  quiet = TRUE,
                  output_options = list(ascii = TRUE))
html <- SqlRender::readSql(htmlFile) 
unlink(mdFile)
unlink(htmlFile)
writeLines(html)
gsub("â€œ|â€\u009d", "&quot", html)

text <- "My list:\n\n1. level 1\n\n2. still level 1\n\n   1. level 2\n\n   2. Still level 2\n\n      1. Level 3\n\n      1. Still level 3\n\n         1. Level 4\n\n         1. Still level 4\n\n            1.level 5\n\n               1. Level6\n"
text
writeLines(markdown::renderMarkdown(file = NULL, text = text))
