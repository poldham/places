#' @title Unique Place Names
#' @description A data frame of unique asciiname entries for place names in
#'   the allcountries geonames file. It is used for text mining.
#' @usage data("unique_places")
#' @format{
#'  A data frame with 7,230,431 observations of three variables.
#'  \describe{
#'    \item{\code{asciiname}}{a place name, character vector}
#'    \item{\code{n}}{number of occurrences across all countries, numeric}
#'    \item{\code{ngram}}{number of ngrams making up a place name, character vector}
#'  }
#'}
"unique_places"
