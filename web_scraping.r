# Load packages
library(dplyr)
library(xml2)
library(rvest)
library(svMisc)

# Scrape the data
datalist = list()

n <- 1949 # you need to manually look, how many pages the table has (to be automated later)

for (i in 1:n){
  df <- read_html(paste0("https://unglobalcompact.org/what-is-gc/participants?page=", i)) %>%
    html(table)
  # putting each page of the table into a list
  datalist[i] <- df
  # create a progress indicator
  progress(i, n, progress.bar = T)
}

# Make one large data frame from the list
library(data.table)
df_complete <- rbindlist(datalist)
