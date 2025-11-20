library(tidyverse)
library(ggplot2)
library(jsonlite)
library(httr)
library(openf1r)
library(plotly)
library(bslib)


    ## Sessions Data Start
url_sessions <- "https://api.openf1.org/v1/sessions"

resp <- httr::GET(url_sessions)
if (resp$status_code != 200) {
  stop("Request failed: ", resp$status_code, " — ", httr::content(resp, "text"))
}

text <- httr::content(resp, "text", encoding = "UTF-8")
session_data <- jsonlite::fromJSON(text, simplifyVector = TRUE)
    ##Sessions Data End

    ##Meetings Start
url_meetings <- "https://api.openf1.org/v1/meetings"
##Honestly not important, but figured I might as well add it in here in case I need it later
resp <- httr::GET(url_meetings)
if (resp$status_code != 200) {
  stop("Request failed: ", resp$status_code, " — ", httr::content(resp, "text"))
}

text <- httr::content(resp, "text", encoding = "UTF-8")
meeting_data <- jsonlite::fromJSON(text, simplifyVector = TRUE)
    ##Meetings End

    ##Pitstops Start
url_pitstops <- "https://api.openf1.org/v1/pit"

resp <- httr::GET(url_pitstops)
if (resp$status_code != 200) {
  stop("Request failed: ", resp$status_code, " — ", httr::content(resp, "text"))
}

text <- httr::content(resp, "text", encoding = "UTF-8")
pitstop_data <- jsonlite::fromJSON(text, simplifyVector = TRUE)
    ##Pitsops End

    ##Driver Names Start
url_driver_names <- "https://api.openf1.org/v1/drivers"

resp <- httr::GET(url_driver_names)
if(resp$status_code != 200) {
  stop("Request failed: ",resp$status_code, " — ", httr::content(resp, "text"))
}

text <- httr::content(resp, "text", encoding = "UTF-8")
driver_names <- jsonlite::fromJSON(text, simplifyVector = TRUE)
    ##Driver Names End
