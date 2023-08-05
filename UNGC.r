# Load packages
library(xml2)
library(dplyr)
library(rvest)

# Perform the search
keyword <- "bmw"

read_html(paste0("https://unglobalcompact.org/what-is-gc/participants/search?search[keywords]=", keyword)) %>%
    html_table()

# ...

