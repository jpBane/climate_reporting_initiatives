# ----------------
# Load Packages
# ----------------
library(readxl)
library(stringdist)
library(dplyr)
library(ggplot2)

# ----------------
# Import data
# ----------------
#download.file("https://sciencebasedtargets.org/download/excel", destfile = "SBTI_participants.xlsx") # does not work?
sbti <- read_excel("companies-taking-action.xlsx")

# use the web_scraping.r script to get the data
ungc <- readRDS("UNGC_participants.Rds")

# -----------------------
# Exploratory Analysis 
# -----------------------
summary(ungc)
summary(sbti)

dist_matrix <- stringdist(ungc$Name, sbti$`Company Name`)
hist(dist_matrix)

# ---------------------------
# Perform the comparision
# ---------------------------
