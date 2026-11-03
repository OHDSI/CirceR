# Limit native numerical library threading
Sys.setenv(
  OMP_NUM_THREADS = "1",
  OPENBLAS_NUM_THREADS = "1",
  MKL_NUM_THREADS = "1",
  VECLIB_MAXIMUM_THREADS = "1",
  NUMEXPR_NUM_THREADS = "1",
  R_DATATABLE_NUM_THREADS = "1",
  R_PARALLELLY_AVAILABLECORES_FALLBACK = "1"
)

library(testthat)
library(CirceR)

test_check("CirceR")
