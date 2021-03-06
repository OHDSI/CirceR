% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/PrintFriendly.R
\name{conceptSetPrintFriendly}
\alias{conceptSetPrintFriendly}
\title{Render conceptSet array for print-friendly}
\usage{
conceptSetPrintFriendly(conceptSet)
}
\arguments{
\item{conceptSet}{A ConceptSet (from cohortExpression.conceptSets[i]), a JSON string, or a list from RJSONIO::fromJson}
}
\value{
A character vector containing the markdown.
}
\description{
Generates a print-friendly (human-readable) representation of a single concept set. This can for example 
be used in a study protocol.
}
