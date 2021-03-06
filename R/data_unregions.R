#' @title United Nations Statistical Division Regions
#'
#'@description  United Nations Statistical Division Regions in English downloaded as .csv from \href{https://unstats.un.org/unsd/methodology/m49/overview/}{UNSD Regions M49}.
#' @docType data
#' @references Citation: United Nations Standard country or area codes for statistical use (M49).
#' @source \href{https://unstats.un.org/unsd/methodology/m49/overview/}{UNSD Regions M49}
#' @details Column names converted to lower case, punctuation and spaces replaced with underscores. Value x in columns ldc, lldc and sids replaced with 1. All column names begin with un for easy identification in table joins.
#' @format A data.frame with 15 variables \code{un_global_code}, \code{un_global_name}, \code{un_region_code}, \code{un_region_name}, \code{un_sub_region_code}, \code{un_sub_region_name}, \code{un_intermediate_region_code}, \code{un_intermediate_region_code}, \code{un_intermediate_region_name}, \code{un_country_or_area}, \code{un_m49_code}, \code{iso3}, \code{un_least_developed_countries_ldc}, \code{un_land_locked_developing_countries_lldc}, \code{un_small_island_developing_states_sids}, \code{un_developed_or_developing_countries}
#' #' @examples regions
"unregions"
