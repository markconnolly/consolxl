consolidateworkbooks <- function(workbookfilenames, targetfilename, verbose = FALSE)
{
  #' Consolidate multiple Excel workbooks into a single workbook file
  #'
  #' `consolidateworkbooks` takes a list of Excel filenames, reads and
  #' consolidates the files, writes a new Excel workbook, which
  #' contains all of the source workbooks and their sheets in a single
  #' sheet.
  #'
  #' @param workbookfilenames a list of file names to be consolidated
  #' @param targetfilename the new file to be written as a single page workbook
  #' @param verbose when `TRUE` display processing information
  #'
  #' @return a single data frame containing all sheets
  #'
  #' @importFrom magrittr %>%
  #' @importFrom writexl  write_xlsx
  #' @importFrom utils str
  #'
  #' @export
  #'

  lapply(workbookfilenames,
         consolidatesheets,
         verbose = verbose) %T>%             # extra arguments for the read function
    {if (verbose) print(workbookfilenames)}  %>%    # for manual compare with final results %>%
    do.call('rbind', .) %>%
    write_xlsx(path = targetfilename)

}
