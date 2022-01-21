consolidatesheets <- function(path, verbose = FALSE) {
  #' Consolidate sheets of an Excel workbook into a single data frame
  #'
  #' `consolidatesheets` combines multiple sheets of an
  #' Excel workbook into a single data frame.  It treats all columns as text
  #' and assumes that the sheets all have the same structure.  The sheets
  #' are read one at a time, converted to a data frame for each sheet, and
  #' collected in a list.  The data frames in the list are bound together
  #' into a single data frame, which is returned to the caller.  If `verbose`
  #' is `TRUE`, the intermediate list of data frames is displayed.
  #'
  #' @param path file name of the source Excel workbook
  #' @param verbose when `TRUE` display `str` of returned data frame
  #'
  #' @return a single data frame containing all sheets
  #'
  #' @importFrom magrittr %>% %T>%
  #' @importFrom readxl excel_sheets read_excel
  #'
  #' @export

  lapply(excel_sheets(path), read_excel, col_types = "text", path = path) %T>%
    {if (verbose) str(.)}  %>%
    do.call('rbind', .)
}
