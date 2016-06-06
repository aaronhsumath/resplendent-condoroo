# Developer: Aaron Hsu (aaronhsu.re[at]removethis.gmail.com)
# Date: June 2016

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
dataPath = "kangaroo.data.2.xlsx"

## Save names of the cities
# cityNames = names(getSheets(loadWorkbook(dataPath)))
cityNames = c("Atherton",
              "Burlingame",
              "Cupertino",
              "Hillsborough",
              "Los Altos",
              "Los Altos Hills",
              "Menlo Park",
              "Mountain View",
              "Palo Alto",
              "Portola Valley",
              "Redwood City",
              "Redwood Shores",
              "San Mateo",
              "Sunnyvale",
              "Woodside")

## Define other names
typeNames = c("SFR", "Condo", "Townhome")
statNames = c("Year","PSF","DOM")
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
      # Developer: Aaron Hsu (aaronhsu.re[at]removethis.gmail.com)
      # Date: June 2016
      cat(toPad, "\n")
      data[i,j,k, ] = toPad
    }
  }
}

# Convert from multi-dimensional array to data frame
kangaroo2 <- adply(data,c(1,2,4)) 
colnames(kangaroo2) <- c("city", "type", "year", "year2", "psf", "dom")
kangaroo2[, "year2"] <- NULL

# Sort the data frame
kangaroo2 <- kangaroo2[order(kangaroo2[, "city"], kangaroo2[,"type"], kangaroo2[, "year"]) , ]

# Remove missing values
kangaroo2[kangaroo2 == 94306] <- NA

## Save the resulting R object-----
save(kangaroo2, file = "kangaroo2.RData")

## View the data frame
cat("All done! Viewing kangaroo2 data frame...")
View(kangaroo2)

## To test
# foo = kangaroo2[kangaroo2$type == "Townhome" & kangaroo2$year == 2014,]
# View(foo)
# write.csv(kangaroo2, "foo.csv")
