#' @title Lookup Countries to Import
#' @description A helper function to navigate two letter country codes. The geonames dump file \code{\link{places_table}} uses two letter country codes (iso2c). The \code{\link{places_table}} includes optional country and region names. If you prefer to look up country codes then use this helper. The function wraps the \code{\link[countrycode]{countrycode}} lookup function for matching single country names or vectors to two letter country codes. Country and region names are not case sensitive.
#' @param name A country, region or subregion name.
#' @param type Either "country", "region", "subregion" or "intermediate"
#' @details The function wraps the \href{https://github.com/vincentarelbundock/countrycode}{countrycode} package on CRAN function \code{\link[countrycode]{countrycode}}
#' \itemize{ UN Regions
#' \item Africa
#' \item Americas
#' \item Asia
#' \item Europe
#' \item Oceania
#' }
#' \itemize{ UN Subregion
#' \item Australia and New Zealand
#' \item Central Asia
#' \item Eastern Asia
#' \item Eastern Europe
#' \item Latin America and the Caribbean
#' \item Melanesia
#' \item Micronesia
#' \item Northern Africa
#' \item Northern America
#' \item Northern Europe
#' \item Polynesia
#' \item South-eastern Asia
#' \item Southern Asia
#' \item Southern Europe
#' \item Sub-Saharan Africa
#' \item Western Asia
#' \item Western Europe
#' }
#' \itemize{UN Intermediate Region
#' \item Caribbean
#' \item Central America
#' \item Channel Islands
#' \item Eastern Africa
#' \item Middle Africa
#' \item South America
#' \item Southern Africa
#' \item Western Africa
#' }
#' @return A vector containing a country name or set of two letter country codes for a region or subregion.
#' @export
#' @importFrom magrittr "%$%"
#' @examples \dontrun{one <- places_lookup("UK", type = "country"),
#' two <- places_lookup(c("US", "UK"), type = "country"),
#' two_names <- places_lookup(c("Kenya", "Tanzania"))
#' upper <- places_lookup("Africa", type = "region")
#' africa <- places_lookup("africa", type = "region"),
#' central_asia <- places_lookup("Central Asia", type = "subregion"),
#' caribbean <- places_lookup("Caribbean", type = "intermediate"),
#' }
places_lookup <- function(name = NULL, type = "country"){
  # test if all upper case for country codes, convert to title in cases where FALSE
  # need a friendly warning
  case <- grepl("^[[:upper:]]+$", name)
  if (case[[1]] == FALSE) {
    name <- stringr::str_to_title(name)
  } else {name}
  if (type == "country") {
  res <- purrr::map(name, countrycode::countrycode, "country.name", "iso2c") %>%
    purrr::set_names(., nm = name) %>%
    tibble::as_tibble()
  # insert warning message here
   }
  if (type == "region") {
      load("data/lookup.rda")
      res <- places::lookup %>%
        dplyr::filter(., un_region_name == name) %$%
        iso
   }
  if (type == "subregion") {
     load("data/lookup.rda")
     res <- places::lookup %>%
       dplyr::filter(., un_sub_region_name == name) %$%
       iso
    }
  if (type == "intermediate") {
    load("data/lookup.rda")
    res <- places::lookup %>%
    dplyr::filter(., un_intermediate_region_name == name) %$%
    iso
}
res
}
