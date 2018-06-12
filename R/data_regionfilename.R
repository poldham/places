#' @title UN regions to Geonames filename concordance table
#' @description  The geonames table including file paths to download linked with UN regions, sub_regions and intermediate regions.
#' @docType data
#' @details Used for mapping regional names to urls for download. Note that UN region columns are renamed to region, subregion and intermediate see \code{data unregions.rda}. file types in the other column are dropped in this table.
#' @references The United Nations division of countries into regions
#' @format{ A data.frame with 12 variables is detailed in the M49 standard (last updated 1999). Details are available here \url{https://unstats.un.org/unsd/methodology/m49/}
#' \describe{
#'   \item{\code{iso}}{iso2 two letter country code, character}
#'   \item{\code{region}}{UN major region, character}
#'   \item{\code{subregion}}{UN subregion, character}
#'   \item{\code{intermediate}}{UN intermediate region e.g. Caribbean, character}
#'   \item{\code{name}}{Name of Geonames zip file, character}
#'   \item{\code{last_modified}}{Geonames file last modified date, character}
#'   \item{\code{size}}{Geonames file size, character}
#'   \item{\code{description}}{Geonames description field, character}
#'   \item{\code{file_name}}{Geonames file name, character}
#'   \item{\code{file_type}}{Geonames file type, character}
#'   \item{\code{url}}{Geonames url, character}
#'   \item{\code{other}}{other file types, character}
#'  }
#'}
#' @examples regionfilename
#' @keywords datasets
"regionfilename"
