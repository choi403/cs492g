# environment variables
folderpath = "change_1_day_change_1_month_high"
plotTitle = "High PER"

# Load the package 
library("rjson")
library("ggplot2")
library("stocks")

# Load the data
dates <- fromJSON(file = paste("./",folderpath,"/days.json", sep=""))
values <- fromJSON(file = paste("./",folderpath,"/values.json", sep=""))
dataFrame <- data.frame(dates, values)

# data processing
lastValue <- values[length(values)]
years <- 19
CAGR <- (lastValue)**(1/years)-1
CAGR_percent <- CAGR * 100
MDD <- mdd(values) * 100
cat("CAGR(%): ", CAGR_percent, "\n")
cat("MDD(%): ", MDD, "\n")

# Plot
ggplot(dataFrame, aes(x=dates, y=values, group=1))+
  geom_point()+
  geom_line()+
  labs(x = "Year", y = "Assets", title=plotTitle)