This update is to address the following comments:

Please omit the redundant "An R" at the start of your title and description.
 - Done: changed to Construct Cohort Inclusion and Restriction Criteria Expressions.
 - Updated description to use acronym and quoted software/api/etc
 
Please always write package names, software names and API (application
programming interface) names in single quotes in title and description.
e.g: --> 'Java', 'CIRCE', 'Markdown', 'SQL'
Please note that package names are case sensitive.
 - Done

If there are references describing the methods in your package, please
add these in the description field of your DESCRIPTION file in the form
authors (year) <doi:...>
authors (year) <arXiv:...>
authors (year, ISBN:...)
or if those are not available: <[https:...]https:...>
with no space after 'doi:', 'arXiv:', 'https:' and angle brackets for
auto-linking. (If you want to add a title as well please put it in
quotes: "Title")

- Done: addred reference to GitHub repo for the embedded CIRCE library. No other references exist.


---

## Test environments
* Ubuntu 20.04, R 4.3.1
* MacOS, R 4.2.3
* MacOS, 4.3.1
* Windows 10, R 4.3.1

## R CMD check results

There were no ERRORs or WARNINGs. 

THe prior submission had NOTEs: the URLS were updated to remove the redirection, 
and a java folder was added with instructions on finding source code for the .JARs

