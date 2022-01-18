consolidatesheets <- function(path, verbose = FALSE) {
  #' Consolidate sheets of an Excel workbook into a single data frame
  #'
  #' `consolidatesheets` is useful for combining multiple sheets of an
  #' Excel workbook into a single data frame.  It treats all columns as text
  #' and assumes that the sheets all have the same structure.
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

  lapply(excel_sheets(path),                      # collection of sheet names
         read_excel,                              # the read function for Excel files
         col_types = "text", path = path) %T>%    # extra arguments for the read function
    {if (verbose) str(.)}  %>%                    # for manual compare with final results
    do.call('rbind', .)                           # bind the data frames in the list into
                                                  # a single data frame and return it to the caller
}
