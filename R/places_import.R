#' @title Import Geonames Data Files
#' @description Read in and process geonames data dump files into a data.frame.
#' @param country A country name (use \code{\link{places_lookup}}). For all countries use "all" (note > 300 MB file).
#' @param code A two letter iso country code (use \code{\link{places_lookup}})
#' @param path For manually downloaded files as either zip or txt.
#' @details Column names are converted to lower, spaces replaced with underscores and brackets removed. download_date added to table with the users system date.
#' @return a data.frame
#' @export
#' @examples \dontrun{cc <- places_import(code = "AI")}
places_import <- function(country = NULL, code = NULL, path = NULL){
  # These are if statements for different cases. The work is done by read_places and read_path in zzz
  # identify the URL from the country name or code and import and unzip the file adding file headers
  if (!is.null(path)) {
    df <- read_path(path)
  }
  if (!is.null(country)) {
      if (country == "all") {
      df <- read_places(country = "allCountries") # without country it uses NA as the code. Weird
      }
    # places lookup returns a tibble where what is wanted is the code in the first row of the tibble
    country1 <- places_lookup(country)
    # error message case needed here
    df <- read_places(country1[[1]])
    }
  if (!is.null(code)) {
    df <- read_places(code)
  }
}
