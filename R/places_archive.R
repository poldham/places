#' @title Download an archive of the All Countries (all data) table
#' @description The allcountries file is a reference file of the Geonames daily data dump from 2018-01-01 containing 11,180,293 georeferenced place names.
#' The Geonames daily data dump for all countries (\href{http://download.geonames.org/export/dump/allCountries.zip}{Geonames allCountries.txt}). The package reference file from 2018-01-01 contains 11,180,293 georeferenced place names in a 364MB compressed rda file. As this is a large file it can take a while. To import the most recent file use \code{\link{places_download}}.
#' @docType data
#' @references Citation: Geonames AllCountries (\href{http://download.geonames.org/export/dump/allCountries.zip}{http://download.geonames.org/export/dump/allCountries.zip}).
#' @source (\href{http://download.geonames.org/export/dump/allCountries.zip}{Geonames allCountries file})
#' @details Column names converted to lower case, punctuation and spaces replaced with underscores. The download_date column is added by \code{\link{places_import}}.
#' @format{A data.frame with 20 variables
#'\describe{
#' \item{\code{geonameid}}{}
#' \item{\code{name}}{}
#' \item{\code{asciiname}}{}
#' \item{\code{alternatenames}}{}
#' \item{\code{latitude}}{}
#' \item{\code{longitude}}{}
#' \item{\code{feature_class}}{}
#' \item{\code{feature_code}}{}
#' \item{\code{iso}}{}
#' \item{\code{cc2}}{}
#' \item{\code{admin1_code}}{}
#' \item{\code{admin2_code}}{}
#' \item{\code{admin3_code}}{}
#' \item{\code{admin4_code}}{}
#' \item{\code{population}}{}
#' \item{\code{elevation}}{}
#' \item{\code{dem}}{}
#' \item{\code{timezone}}{}
#' \item{\code{modification_date}}{}
#' \item{\code{download_date}}{}
#' }
#' }
#' @export
#' @examples \dontrun{places <- places_archive(),
#' load("allcountries.rda")}
places_archive <- function(){
  # change this to google. Just download and point user, avoid assigning to globalenv
  #utils::download.file("https://oneworldanalytics.ams3.digitaloceanspaces.com/allcountries.rda", destfile = "allcountries.rda", method = "libcurl")
  #load("allcountries.rda", envir = globalenv(), verbose = FALSE)

  utils::download.file("https://storage.googleapis.com/owa/allcountries.rda", destfile = "allcountries.rda", method = "libcurl")

}
