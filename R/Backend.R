
#' Checks if the Python backend is enabled
#'
#' @return
#' TRUE if CIRCER_BACKEND environment variable is set to 'python', FALSE otherwise.
#'
#' @export
usePythonBackend <- function() {
  backend <- Sys.getenv("CIRCER_BACKEND")
  return(tolower(backend) == "python")
}

#' Enables the Python backend
#'
#' Sets the CIRCER_BACKEND environment variable to 'python'.
#'
#' @export
enablePythonBackend <- function() {
  Sys.setenv(CIRCER_BACKEND = "python")
}

#' Ensures the Python backend is available
#'
#' @return
#' The 'circepy' module.
#'
#' @keywords internal
ensurePythonBackend <- function() {
  if (!requireNamespace("reticulate", quietly = TRUE)) {
    stop("Package 'reticulate' is required for the Python backend. Please install it.")
  }
  if (!reticulate::py_module_available("circepy")) {
    stop("Python module 'circepy' is required. Please install with `pip install ohdsi-circe-python-alpha`.")
  }
  return(reticulate::import("circepy"))
}

#' Ensures the Java backend is available
#'
#' @keywords internal
ensureJavaBackend <- function() {
  if (!requireNamespace("rJava", quietly = TRUE)) {
    stop("Package 'rJava' is required for the Java backend. Please install it or use enablePythonBackend().")
  }
  
  # Check if Java is actually working
  tryCatch({
    rJava::.jinit()
    # Simple check to see if we can create a string or get properties
    invisible(rJava::J("java.lang.System")$getProperty("java.version"))
  }, error = function(e) {
    stop("Java backend is not working. Please fix Java configuration or use enablePythonBackend(). Error: ", e$message)
  })
}

#' Get the backend implementation
#' 
#' @return 
#' An object with class 'circe_backend_python' or 'circe_backend_java'.
#' 
#' @keywords internal
.get_backend <- function() {
  if (usePythonBackend()) {
    return(structure(list(), class = "circe_backend_python"))
  } else {
    return(structure(list(), class = "circe_backend_java"))
  }
}
