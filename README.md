CirceR
======

[![Build Status](https://github.com/OHDSI/CirceR/workflows/R-CMD-check/badge.svg)](https://github.com/OHDSI/CirceR/actions?query=workflow%3AR-CMD-check)
[![codecov.io](https://codecov.io/github/OHDSI/CirceR/coverage.svg?branch=main)](https://codecov.io/github/OHDSI/CirceR?branch=main)

CirceR is part of [HADES](https://ohdsi.github.io/Hades/).

Introduction
============
A R-wrapper for [Circe](https://www.github.com/OHDSI/circe-be), a library for creating queries for the OMOP Common Data Model. These queries are used in cohort definitions (CohortExpression) as well as custom features (CriteriaFeature). This package provides convenient wrappers for Circe functions, and includes the necessary Java dependencies.

Features
========

- Convert a JSON cohort expression into a markdown print-friendly presentation.
- Convert a JSON cohort expression into SQL.

Examples
========

```r
# use an example JSON cohort expression:
data(cohortDefinitionJson)

cohortExpresion <- cohortExpressionFromJson(cohortDefinitionJson)
markdown <- cohortPrintFriendly(cohortExpresion)
writeLines(markdown)
 
# ### Cohort Entry Events
# 
# People enter the cohort when observing any of the following:
# 
# 1. condition occurrences of 'Some ConceptSet'.
# 
# Limit cohort entry events to the earliest event per person.
# 
# ### Cohort Exit
# 
# The person exits the cohort at the end of continuous observation.
# 
# ### Cohort Eras
# 
# Entry events will be combined into cohort eras if they are within 0 days of each other.

```

Technology
==========
CirceR is an R package wrapped around a Java library.

System Requirements
===================
Requires R (version 3.2.2 or higher). CirceR require Java.

Getting Started
===============
1. See the instructions [here](https://ohdsi.github.io/Hades/rSetup.html) for configuring your R environment, including Java.

2. In R, use the following commands to download and install CirceR:

  ```r
  install.packages("remotes")
  remotes::install_github("ohdsi/CirceR")
  ```

User Documentation
==================
The documentation website can be found at [http://ohdsi.github.io/CirceR/](http://ohdsi.github.io/CirceR/). A PDF version of the package manual is here:

* Package manual: [CirceR manual](https://raw.githubusercontent.com/OHDSI/CirceR/main/extras/CirceR.pdf) 


Support
=======
* Developer questions/comments/feedback: <a href="http://forums.ohdsi.org/c/developers">OHDSI Forum</a>
* We use the <a href="https://github.com/OHDSI/CirceR/issues">GitHub issue tracker</a> for all bugs/issues/enhancements

Contributing
============
Read [here](https://ohdsi.github.io/Hades/contribute.html) how you can contribute to this package.

License
=======
CirceR is licensed under Apache License 2.0

Development
===========
CirceR is being developed in R Studio.

### Development status

Beta. Use at your own risk.
