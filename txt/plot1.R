## This code and associated plot explores the following question:
##
## Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? 
## Using the base plotting system, make a plot showing the total PM2.5 emission from 
## all sources for each of the years 1999, 2002, 2005, and 2008.

source("load_data.R")
## Loads two data sets, emissions_data and classification_data

## Subset Data, just to be sure
selection <- subset(emissions_data, year == 1999 | year == 2002 | year == 2005 | year == 2008)

## Totals
totals <- data.frame( row.names=c("1999", "2002", "2005", "2008"), totals=c(
                            sum(selection$Emissions[ which(selection$year == 1999) ]), #1999
                            sum(selection$Emissions[ which(selection$year == 2002) ]), #2002
                            sum(selection$Emissions[ which(selection$year == 2005) ]), #2005
                            sum(selection$Emissions[ which(selection$year == 2008) ]) #2008
                        ) )

#Output graph to file
png(filename = "plot1.png", width=480, height=480, units="px", bg="white") #bg="transparent")

plot(rownames(totals), totals$totals, type="l",
        xlab="Year", 
        ylab="Emission Levels", axes=FALSE)
title("Total US PM2.5 Emissions by Year")
axis(1, at=rownames(totals))
axis(2, at=totals$totals)
box()

#Close device
dev.off()
