#' @title Import the latest Countryinfo file
#' @description The geonames country info text file \url{http://download.geonames.org/export/dump/countryInfo.txt } contains the country names and a range of codes along with information linked to the capital city.
#' @return data.frame
#' @details Column names are converted to lowercase, spaces are replaced with underscores and brackets removed.
#' @export
#' @examples {places_countryinfo()}
places_countryinfo <- function() {
 df <- readr::read_delim("http://download.geonames.org/export/dump/countryInfo.txt", skip = 50, delim = "\t", col_names = TRUE, col_types = readr::cols(
    `#ISO` = readr::col_character(),
    ISO3 = readr::col_character(),
    `ISO-Numeric` = readr::col_character(),
    fips = readr::col_character(),
    Country = readr::col_character(),
    Capital = readr::col_character(),
    `Area(in sq km)` = readr::col_double(),
    Population = readr::col_integer(),
    Continent = readr::col_character(),
    tld = readr::col_character(),
    CurrencyCode = readr::col_character(),
    CurrencyName = readr::col_character(),
    Phone = readr::col_character(),
    `Postal Code Format` = readr::col_character(),
    `Postal Code Regex` = readr::col_character(),
    Languages = readr::col_character(),
    geonameid = readr::col_integer(),
    neighbours = readr::col_character(),
    EquivalentFipsCode = readr::col_character()
  )
  )
 names(df) <- tolower(names(df))
 names(df) <- stringr::str_replace(names(df), "#", "") %>%
    stringr::str_replace(., "-", "") %>%
    stringr::str_replace(., "area[(]in sq km[)]", "area_in_sq_km") %>%
    stringr::str_replace_all(., " ", "_")
df
}
