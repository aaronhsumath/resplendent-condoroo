

temp = as.data.frame(data[,1,2,])

qplot(data = temp, # for temp = as.data.frame(data[2,1,2,])
      x = row.names(temp), 
      y = temp[,1],
      xlab = "Year",
      ylab = "Median Sale Price",
      main = "Median Sale Price by Year",
      ymin = 0
      # color = city
      )

ggplot(data = temp, aes(row.names(temp), temp[,1])) + 
  geom_histogram()

qplot(data = temp, # for temp = as.data.frame(data[,1,2,])
      x = colnames(temp), 
      y = temp[1,],
      xlab = "Year",
      ylab = "Median Sale Price",
      main = "Median Sale Price by Year",
      ymin = 0
      # color = city
)

# original plot
temp = as.data.frame(data[2,1,2,])
qplot(data = temp, # for temp = as.data.frame(data[2,1,2,])
      x = row.names(temp), 
      y = temp[,1],
      xlab = "Year",
      ylab = "Median Sale Price",
      main = "Median Sale Price by Year",
      ymin = 0
      # color = city
)

# try to replicate in ggplot

# this is all points
typeSelected = "SFR"
ggplot(
  data = subset(frame, frame[, "type"] == typeSelected),
  aes(
    x = year,
    y = msp,
    group = city,
    color = city
  )) +
  geom_point() +
  geom_line()
  

# Make it flexible by type of data we want
selectType = "SFR"
selectCity = c("SU", "PA", "MP", "PV")
ggplot(
  data = subset(frame, frame[, "type"] == selectType & frame[, "city"] %in% selectCity),
  aes(
    x = year,
    y = msp,
    group = city,
    color = city
  )) +
  geom_point() +
  geom_line()






















