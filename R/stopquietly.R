stopquietly <- function(message, ...) {
  #' Stop processing quietly (without error)
  #'
  #' Stop the processing with a message.  Usually executed in the context
  #' of a user making a cancel decision during interaction.
  #'
  #' @param message the message to display to the user when stopping
  #' @param ... further arguments for `print` function
  print(message, ...)
  opt <- options(show.error.messages = FALSE)
  on.exit(options(opt))
  stop()
}
