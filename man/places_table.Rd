% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/places_table.R
\name{places_table}
\alias{places_table}
\title{Fetch the daily geonames dump page}
\usage{
places_table()
}
\value{
a data frame containing the geonames daily dump page contents.
}
\description{
Used to fetch the latest geonames daily dump page containing the latest updates. An archived copy of the table is located in data \code{dumppage} and forms the basis for data \code{regionfilename} containing the UN regions.
}
\details{
The function fetches the geonames daily dump page at \url{http://download.geonames.org/export/dump/} consisting of a table with "Name", "Last Modified", "Size" and "Description". The Name field is parsed to create a file_name and file_type column. The files are a mix of individual country files (e.g. AD.zip) and other files (e.g. allCountries.zip, admin2Codes.txt etc.). To facilitate country name matching the file name is parsed into iso2c (iso) for two letter country codes. This allows the table to be joined with other data sources.
}
\examples{
\dontrun{places_table()}
}