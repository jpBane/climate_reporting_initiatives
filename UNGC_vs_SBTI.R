# Load Packages
library(readxl)
library(stringdist)

# Import the data
download.file("https://sciencebasedtargets.org/download/excel", destfile = "SBTI_participants.xlsx")
sbti <- read_excel("SBTI_participants.xlsx")


# Prepare the data
...

# Perform the comparision
stringdist(...)
