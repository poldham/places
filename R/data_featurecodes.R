#' @title Geonames Feature Codes table for Feature classes & types
#' @description The english geonames featurecodes table \href{http://download.geonames.org/export/dump/featureCodes_en.txt}{geonames featurecode}.
#' @docType data
#' @usage data("featurecodes")
#' @aliases featurecodes
#' @references Please cite as: GeoNames. http://geonames.org/.
#' @source \href{http://download.geonames.org/export/dump/featureCodes_en.txt}{geonames featureCodes_en.txt}
#' @format {A data.frame with 7 variables
#' \describe{
#' * {\code{feature_full:}}{ The full feature code}
#' * {\code{feature_class:}}{ The class of feature:
#' * A = country, state, region,
#' * H = stream, lake,
#' * L = parks, area,
#' * P = city, village,
#' * R = road, railroad,
#' * S = spot, building, farm,
#' * T = mountain, hill, rock,
#' * U = undersea,
#' * V = forest, heath}
#' * {\code{feature_code:}}{ Specific feature codes, character}
#' * {\code{feature_name:}}{ Type of feature, character}
#' * {\code{feature_detail:}}{ Details of a feature}
#' * {\code{feature_clean:}}{ Processed feature name field with brackets and plurals removed, character}
#' \item{\code{multi:}}{ Processed field indicating the presence of a plural in feature name, logical}
#' }
#' }
#' @examples featurecodes
"featurecodes"
