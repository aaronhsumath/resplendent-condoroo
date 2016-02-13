## Initialize -----
cat("\014")
require(xlsx)
setwd("C:/r/webdata")

## Set xlsx data sheet variables
nSheets = 12  # number of sheets (cities)
nTypes = 3  # number of types of buildings
nStats = 3  # number of stats to read
nYears = 13 # number of rows (years) to read

## Load xlsx data sheet -----
dataPath = "webdata.data.xlsx"

## Save names of the cities
cityNames = names(getSheets(loadWorkbook(dataPath)))

## Define other names
typeNames = c("SFR", "Condo", "Townhome")
statNames = c("Year","MSP","Ratio")
yearNames = unlist(2003:2015)

## Populate array of data from xlsx file
data <- array(data = 1:(nSheets*nTypes*nStats*nYears), 
              dim = c(nSheets, nTypes, 3, nYears), 
              dimnames = list(
                cityNames,
                typeNames,
                statNames,
                yearNames
             ))
#               dimnames = as.list(cityNames, )
#               dimnames = as.list(c("city", "type", "stat", "year")))
for (i in 1:nSheets) {  # loop through number of sheets
  for (j in 1:nTypes) {
    for (k in 1:nStats) {
      toPad = read.xlsx(file = dataPath,
                        sheetIndex = i,
                        rowIndex = 2:(nYears + 1),
                        colIndex = 4*(j-1) + 1 + (k - 1),
                        header = FALSE
                        )[[1]]
#                                 # out = nYears)
#       bigger = toPad
#       bigger[(length(toPad)+1):nYears] <- NA
      data[i,j,k, ] = toPad
      cat("Currently processing City", i, ", Type ", j, ", Stat ", k, " \n")
    }
  }
}



# Convert from multi-dimensional array to data frame
frame <- adply(data,c(1,2,4)) 
colnames(frame) <- c("city", "type", "year", "year2", "msp", "ratio")
frame[, "year2"] <- NULL

# Sort the data frame
frame <- frame[order(frame[, "city"], frame[,"type"], frame[, "year"]) , ]



## Save the resulting R objects-----
save(data, file = "webdata.data.RData")
save(frame, file = "webdata.frame.RData")



# ## Ignore following -----
# read.xlsx
# data[10,3,2,] <- c(1:13)
# data[10,3,2,] <- c
# 
# 
# stuff = array(dim = c(13,2))
# stuff[,2] = c
# 
# 
# 
# c = read.xlsx(file = dataPath,
#               sheetIndex = i,
#               rowIndex = 2:(nYears + 1),
#               colIndex = 3*(j-1) + 1
# )[[1]]
# 
# length(c)
# 
# read.xlsx(dataPath,4)



