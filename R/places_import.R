#' Import downloaded geonames files
#' @description Imports files downloaded with \code{\link{places_download}}
#' @param file A character vector containing a file name with a .zip extension returned by \code{\link{places_download}}
#'
#' @return tibble
#' @export
#' @examples \dontrun{AI <- places_download(code = "AI") %>% places_import()
#' AI <- places_download(country = "Anguilla") %>% places_import()
#' res <- places_download(code = AI)
#' AI <- places_import(res)}
places_import <- function(file) {

# Drafting tests for fail fast approach
  # make sure is a zip file
  # test the name of the zip file and address allCountries case
 #nc <- nchar(file) # the need here is to detect the zip
  # This will need more work
  # a) detect if file exists
  # address cases where it does
  # address cases where it doesnt
 # file <- get("file", envir = globalenv(plcs_env))

#  file <- get("file", envir = "plcs_env")
 # print(file)

# Add checks to fail fast
  # zip <- grepl("zip", file)
  # if(zip == TRUE){
  #  stop("Expecting a two letter country code with .zip file extension")
  #}

  # if(nc > 6 | nc < 6) {
   #  stop("Expecting a two letter country code with .zip file extension")
  # } # check on whether country name create an error

 file = basename(file)
    tmpdir <- file.path(tempdir(), "placesdownload", file)
     utils::unzip(file, exdir = tmpdir, overwrite = TRUE)
     xx <- list.files(tmpdir)
     targetpath <- file.path(tmpdir, xx[[1]]) # assumes first file. Switch to more certain method (grep("[A-Z][A-Z]", xx), except for allcountries, will need to be != readme.txt)
     df <- readr::read_delim(targetpath, "\t", escape_double = FALSE, trim_ws = TRUE, na = "", col_names = c("geonameid", "name", "asciiname", "alternatenames", "latitude", "longitude", "feature_class", "feature_code", "iso", "cc2", "admin1_code", "admin2_code", "admin3_code", "admin4_code", "population", "elevation", "dem", "timezone", "modification_date"), col_types = readr::cols(
       geonameid = readr::col_character(),
       name = readr::col_character(),
       asciiname = readr::col_character(),
       alternatenames = readr::col_character(),
       latitude = readr::col_character(),
       longitude = readr::col_character(),
       feature_class = readr::col_character(),
       feature_code = readr::col_character(),
       iso = readr::col_character(),
       cc2 = readr::col_character(),
       admin1_code = readr::col_character(),
       admin2_code = readr::col_character(),
       admin3_code = readr::col_character(),
       admin4_code = readr::col_character(),
       population = readr::col_character(),
       elevation = readr::col_character(),
       dem = readr::col_integer(),
       timezone = readr::col_character(),
       modification_date = readr::col_date()
     )
     ) %>% dplyr::mutate(download_date = Sys.Date())
   #unlink("placesdownlaod")
}
