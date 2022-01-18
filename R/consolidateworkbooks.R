consolidateworkbooks <- function(verbose = FALSE)
{
  #' Consolidate multiple Excel workbooks into a single workbook file
  #'
  #' `consolidateworkbooks` is useful for combining multiple
  #' Excel workbooks and their contained sheets into a single Excel file.
  #' This function was coded with the assumption all of the workbooks
  #' and their contained sheets have the same structure.  The user is
  #' prompted for source files and target file name.
  #'
  #' @param verbose when `TRUE` display processing information
  #'
  #' @return a single data frame containing all sheets
  #'
  #' @importFrom magrittr %>%
  #' @importFrom writexl  write_xlsx
  #' @importFrom utils choose.files str
  #'
  #' @export
  #'

  excelfilter <- matrix(c("Excel", "*.xls*"), ncol = 2)

  list_of_files <- choose.files(filters = excelfilter,
                                caption = "Select files to consolidate")

  if (length(list_of_files) == 0)
    stopquietly("no source files selected")

  targetfilename <- choose.files(filters = excelfilter,
                                 multi = FALSE,
                                 default = paste(dirname(list_of_files[1]), "/consolidate.xlsx", sep = ""),
                                 caption = "Set target for consolidated files")

  if (length(targetfilename) == 0)
    stopquietly("no target file named")


  lapply(list_of_files,
         consolidatesheets,
         verbose = verbose) %>%
    do.call('rbind', .) %>%
    write_xlsx(path = targetfilename)

  message(paste("\nwrote "), targetfilename)
}
