#' @title Download the latest Country data
#' @description Read in and process geonames data dump files into a data.frame.
#' @param country A country name (use \code{\link{places_lookup}}). For all countries use "allcountries" (note > 300 MB file).
#' @param code A two letter iso country code (use \code{\link{places_lookup}})
#' @details Column names are converted to lower, spaces replaced with underscores and brackets removed. download_date added to table with the users system date. \code{places_import} cannot handle three letter country codes will throw an error.
#' @return a data.frame
#' @export
#' @importFrom utils download.file
#' @importFrom utils unzip
#' @examples \dontrun{AI <- places_download(code = "AI") %>% places_import()
#' kenya <- places_download(country = "kenya") %>% places_import()
#' all <- places_download(country = "allcountries") %>% places_import()
#' }
places_download <- function(country = NULL, code = NULL){
  # check character length for stop
  # stop when a country code is used for country name
  # stop when a country name and country code are used together
  # stop when a three letter country code is used
  # Address case: country code for the UK is GB in geonames
  # Note Antarctica returns but Antarctic will not
  # Address cases where input is greater than length one
  # Give the user the option of assigning their own name or choosing the original file name as downloaded?
  # The struggle with the fun has been avoiding assigning to the Global env as bad practice generating a CRAN note.
    nc <- nchar(country)
    if(!is.null(country)){
     if(nchar(country) <= 3) {
       stop(message("Are you using a country code? Country must be a country name"))
       } else if(!is.null(country) && !is.null(code)) {
        stop("Please choose either a country name or country code")
       } else if(country == "allcountries") {
        country <- "allCountries"
        out <- return(build_url(country))
        } else if(country != "allcountries") {
        code <- places_lookup(country)[[1]]
        }
    # places_lookup converts a country name to a two letter country code in a tibble and thefeo

     }

    if(!is.null(code)) {
    n <- nchar(code)
      if(n > 2) {
       stop("Are you using a country name or three letter country code? Geonames files use two letter country codes")
      } else if(code == "UK") {
        message("Converting UK to the expected GB country code")
        code <- "GB"
      }
   }

    out <- build_url(code)
 }

 build_url <- function(out){
   x <- as.character(out)
   baseurl <- "http://download.geonames.org/export/dump/"
   extension <- ".zip"
   url <- paste0(baseurl, x, extension)
   print(url)
   download_url(url)
  }


  download_url <- function(url, path = "."){
    file <- basename(url)
    download.file(url, destfile = file)
    out <- file.path(file)

 #   # include info on whether download has been successful and option in case of failure see options for download file
  }

