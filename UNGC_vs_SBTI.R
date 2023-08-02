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
find_similar_strings <- function(vector1, vector2, threshold = 2) {
  # Initialize an empty list to store similar strings
  similar_strings <- list()
  
  # Loop through the first vector
  for (str1 in vector1) {
    # Initialize a list to store similar strings for the current element in vector1
    similar_to_str1 <- list()
    
    # Loop through the second vector
    for (str2 in vector2) {
      # Calculate the Levenshtein distance between str1 and str2
      distance <- stringdist::stringdist(str1, str2, method = "lv")
      
      # If the Levenshtein distance is below the threshold, consider the strings similar
      if (distance <= threshold) {
        similar_to_str1 <- c(similar_to_str1, str2)
      }
    }
    
    # Add the list of similar strings for str1 to the main list
    similar_strings[[str1]] <- similar_to_str1
  }

  # Return the list of similar strings
  return(similar_strings)
}

# Perform a test with a smaller vector
vector1 <- ungc$Name[1:1000]
vector2 <- sbti$`Company Name`[1:1000]

test <- find_similar_strings(vector1, vector2)

# Filter the relevant information from the list
test_filtered <- test[lengths(test) > 0]
