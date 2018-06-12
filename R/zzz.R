#if(getRversion() >= "3.1.0") utils::suppressForeignCheck(".")

# Read in file
# Take the input from places_import, download the file, name the columns, create feature_full for join, drop feature_class and feature_code to avoid_duplicates, return a data frame.
# Input from places_import
read_places <- function(x) {
  # Namibia as NA will need special treatment as the file name will need to be converted to Namibia on import
  code <- x
  baseurl <- "http://download.geonames.org/export/dump/"
  extension <- ".zip"
  url <- paste0(baseurl, code, extension)
  print(url)
  file <- paste0(code, ".txt")
  x <- utils::download.file(url, destfile = "data-raw/temp.zip")
  # should this go into a separate fun as so can be used in the path case without repetition
  x <- unz("data-raw/temp.zip", file) %>%
    readr::read_delim(., delim = "\t", escape_double = FALSE, trim_ws = TRUE, na = "", col_names = c("geonameid", "name", "asciiname", "alternatenames", "latitude", "longitude", "feature_class", "feature_code", "iso", "cc2", "admin1_code", "admin2_code", "admin3_code", "admin4_code", "population", "elevation", "dem", "timezone", "modification_date"), col_type = readr::cols(geonameid = readr::col_character(),
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
  )
  unlink("data-raw/temp.zip")
  # Namibia (NA) is a special case that needs to be handled somewhere here
  x <- x %>% dplyr::mutate(download_date = Sys.Date()) %>%
    tidyr::unite(., feature_full, c(feature_class, feature_code), sep = ".", remove = TRUE) # note changed from FALSE for joining
  assign(code, x, envir = globalenv()) # CRAN issue
 }

# handle file import from file path. Not actually used. Drop?
# Import raw file and return df with regular cols where path specified. Note that may need to adjust for windows file path cases.
# geonames file path
read_path <- function(path) {
  is_zip <- stringr::str_detect(path, ".zip")
  is_txt <- stringr::str_detect(path, ".txt")
   if (is_zip == TRUE) {
      # extract the filename
      file <- basename(path) %>%
        stringr::str_replace(., ".zip", ".txt")
      df <- unz(path, file) %>%
        readr::read_delim(., "\t", escape_double = FALSE, trim_ws = TRUE, na = "", col_names = c("geonameid", "name", "asciiname", "alternatenames", "latitude", "longitude", "feature_class", "feature_code", "iso", "cc2", "admin1_code", "admin2_code", "admin3_code", "admin4_code", "population", "elevation", "dem", "timezone", "modification_date"), col_types = readr::cols(
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
 )
 df

  }
  if (is_txt == TRUE) {
    df <-  readr::read_delim(path, "\t", escape_double = FALSE, trim_ws = TRUE, na = "", col_names = c("geonameid", "name", "asciiname", "alternatenames", "latitude", "longitude", "feature_class", "feature_code", "iso", "cc2", "admin1_code", "admin2_code", "admin3_code", "admin4_code", "population", "elevation", "dem", "timezone", "modification_date"), col_types = readr::cols(
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
    )
    df
  }
}
