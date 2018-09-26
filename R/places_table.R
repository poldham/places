#' @title Import the latest geonames dump page
#' @description Used to fetch the latest geonames daily dump page containing the latest updates.
#' @details The function fetches the geonames daily dump page at \url{http://download.geonames.org/export/dump/} consisting of a table with "Name", "Last Modified", "Size" and "Description". The Name field is parsed to create a file_name and file_type column. The files are a mix of individual country files (e.g. AD.zip) and other files (e.g. allCountries.zip, admin2Codes.txt etc.). To facilitate country name matching the file name is parsed into iso2c (iso) for two letter country codes. This allows the table to be joined with other data sources.
#' @format{
#' \describe{
#' \item{\code{name}}{filename with extension, character}
#' \item{\code{last modified}}{character}
#' \item{\code{size}}{chr}
#' \item{\code{description}}{character}
#' \item{\code{filename}}{character}
#' \item{\code{file type}}{character}
#' \item{\code{url}}{character}
#' \item{\code{iso}}{two letters iso country code, character}
#' \item{\code{other}}{non iso files}
#' }
#' }
#' @return a data frame containing the geonames daily dump page contents.
#' @export
#' @examples \dontrun{places_table()}
places_table <- function(){
  # the dump page has irregular spacing between file names and date modified.
  # uses rlang .data to suppress CMD check

  dump <- xml2::read_html("http://download.geonames.org/export/dump/")

  dump_page <- rvest::html_nodes(dump, "pre:nth-child(4) , pre a") %>%
    rvest::html_text() %>%
    stringr::str_replace(., "Parent Directory", "") %>%
    stringr::str_replace(., "-", "") %>%
    stringr::str_replace_all(., " +", " ") %>%
    stringr::str_replace_all(., " ", ",")

    # note warnings on extra col and grepl
 dump_page <- suppressWarnings(readr::read_csv(dump_page, col_names = TRUE)) %>%
    dplyr::select(., 1:5) %>%
    tidyr::unite(., rlang::.data$last_modified, c("Last", "modified"), sep = " ")

  names(dump_page) <- tolower(names(dump_page))

  dump_page$file_name <- stringr::str_split_fixed(dump_page$name, "[.]", 2) %>% .[,1]
  dump_page$file_type <- stringr::str_split_fixed(dump_page$name, "[.]", 2) %>% .[,2]
  dump_page$is_iso <- stringr::str_detect(dump_page$file_name, "^[[:upper:]]")

   # add url for funs

  baseurl <- "http://download.geonames.org/export/dump/"
  dump_page$url <- paste0(baseurl, dump_page$name)

#   # split on filter then bind. iso to facilitate join with other data tables

  iso <- dump_page %>% dplyr::filter(., is_iso == TRUE)
  iso$iso <- iso$file_name
  other <- dump_page %>% dplyr::filter(., is_iso == FALSE)
  other$other <- other$file_name
#
  df <- dplyr::bind_rows(iso, other)
  df$is_iso <- NULL

  df
}
