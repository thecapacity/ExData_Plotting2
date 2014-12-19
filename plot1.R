## This code and associated plot explores the following question:
##
## Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? 
## Using the base plotting system, make a plot showing the total PM2.5 emission from 
## all sources for each of the years 1999, 2002, 2005, and 2008.

source("load_data.R")
## Loads two data sets, emissions_data and classification_data

select <- emissions_data$year == 1999 | emissions_data$year == 2002 | emissions_data$year == 2005 | emissions_data$year == 2008

#Output graph to file
#png(filename = "plot1.png", width=480, height=480, units="px", bg="white") #bg="transparent")

plot(emissions_data[select,]$Emissions ~ emissions_data[select,]$year, 
        xlab="year", ylab="Emission Levels", type="l")

#Close device
dev.off()
