Circe-R
========

Introduction
============
A R-wrapper for [Circe](https://www.github.com/OHDSI/circe-be).  This package provides convienent wrappers for Circe functions, and includes the necessary Java dependencies.

System Requirements
===================
Requires R (version 3.2.2 or higher). Installation on Windows requires [RTools](http://cran.r-project.org/bin/windows/Rtools/).  
Circe is a Java library, so a JRE must be installed (also a requirement for rJava).  
If you intend to build the package, you will need [Maven](https://maven.apache.org/install.html) installed.

Getting Started
===============
In R, use the following commands to download and install CirceR:

```r
install.packages("drat")
drat::addRepo("OHDSI")
install.packages("CirceR")
```

Building Package
===============
CirceR functions as a normal R package, but depends on external Java dependencies specified in the `pom.xml` file.  The following command should be executed in order to refresh the dependencies specified in `pom.xml`.  

```
mvn process-sources
```

The embedded version of Circe is specified in the POM, and dependent JARS will be placed into inst/java.

License
=======
CirceR is licensed under Apache License 2.0
