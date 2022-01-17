consolidatesheets <- function(path, verbose = FALSE) {
  #' Consolidate sheets of an Excel workbook into a single data frame
  #'
  #' consolidatesheets is useful for combining multiple sheets of an
  #' Excel workbook into a single data frame.  It treats all columns as text
  #' and assumes that the sheets all have the same structure.
  #'
  #' @param path file name of the source Excel workbook
  #' @param verbose when TRUE display processing information
  #'
  #' @return a single data frame containing all sheets
  #'
  #' @importFrom magrittr %>% %T>%
  #' @importFrom readxl excel_sheets read_excel
  #'
  #' @export

  lapply(excel_sheets(path),    # sheets
         read_excel,            # the read function
         col_types = "text",    # extra arguments for the read function
         path = path) %T>%
    {if (verbose) str(.)}  %>%  # for manual compare with final results
    do.call('rbind', .)         # bind the data frames in the list into a single data frame
                                # and return it to the caller
}
