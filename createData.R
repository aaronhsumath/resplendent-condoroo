## Initialize -----
cat("\014")
library(xlsx)
library(plyr)
setwd("C:/r/resplendent-kangaroo")

## Set xlsx data sheet variables
nSheets = 15  # number of sheets (cities)
nTypes = 3  # number of types of buildings
nStats = 3  # number of stats to read
nYears = 14 # number of rows (years) to read

## Load xlsx data sheet -----
dataPath = "kangaroo.data.xlsx"

## Save names of the cities
cityNames = names(getSheets(loadWorkbook(dataPath)))

## Define other names
typeNames = c("SFR", "Condo", "Townhome")
statNames = c("Year","MSP","Ratio")
yearNames = unlist(2002:2015)

## Populate array of data from xlsx file
data <- array(data = 1:(nSheets*nTypes*nStats*nYears), 
              dim = c(nSheets, nTypes, 3, nYears), 
              dimnames = list(
                cityNames,
                typeNames,
                statNames,
                yearNames
             ))

for (i in 1:nSheets) {  # loop through number of sheets
  for (j in 1:nTypes) {
    for (k in 1:nStats) {
      cat("Currently processing City", i, ", Type ", j, ", Stat ", k, " \n")
      toPad = read.xlsx(file = dataPath,
                        sheetIndex = i,
                        rowIndex = 2:(nYears + 1),
                        colIndex = 4*(j-1) + 1 + (k - 1),
                        header = FALSE
                        )[[1]]
      cat(toPad, "\n")
      data[i,j,k, ] = toPad
    }
  }
}

# Convert from multi-dimensional array to data frame
kangaroo <- adply(data,c(1,2,4)) 
colnames(kangaroo) <- c("city", "type", "year", "year2", "msp", "ratio")
kangaroo[, "year2"] <- NULL

# Sort the data frame
kangaroo <- kangaroo[order(kangaroo[, "city"], kangaroo[,"type"], kangaroo[, "year"]) , ]

# Remove missing values
kangaroo[kangaroo == 94306] <- NA

## Save the resulting R object-----
save(kangaroo, file = "kangaroo.RData")

## View the data frame
cat("All done! Viewing kangaroo data frame...")
View(kangaroo)