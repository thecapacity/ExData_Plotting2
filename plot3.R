## This code and associated plot explores the following question:
##
## Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable, 
## which of these four sources have seen decreases in emissions from 1999–2008 for Baltimore City? 
## Which have seen increases in emissions from 1999–2008? Use the ggplot2 plotting system to 
## make a plot answer this question.
library(ggplot2)

##qplot(x, y, data=, color=, shape=, size=, alpha=, geom=, method=, formula=, 
##          facets=, xlim=, ylim= xlab=, ylab=, main=, sub=) 

source("load_data.R")
## Loads two data sets, emissions_data and classification_data

## Subset to Baltimore City, Maryland (fips == "24510")
selection <- subset(selection, fips == "24510")

## Totals
totals <- data.frame( matrix(0, nrow=4, ncol=4), row.names=c("1999", "2002", "2005", "2008"))
colnames(totals) <- c("point", "nonpoint", "onroad", "nonroad")

#1999
totals["1999", "point"] = sum(selection$Emissions[ which(selection$year == 1999 & selection$type == "POINT") ])
totals["1999", "nonpoint"] = sum(selection$Emissions[ which(selection$year == 1999 & selection$type == "NONPOINT") ])
totals["1999", "onroad"] = sum(selection$Emissions[ which(selection$year == 1999 & selection$type == "ON-ROAD") ])
totals["1999", "nonroad"] = sum(selection$Emissions[ which(selection$year == 1999 & selection$type == "NON-ROAD") ])

#2002
totals["2002", "point"] = sum(selection$Emissions[ which(selection$year == 2002 & selection$type == "POINT") ])
totals["2002", "nonpoint"] = sum(selection$Emissions[ which(selection$year == 2002 & selection$type == "NONPOINT") ])
totals["2002", "onroad"] = sum(selection$Emissions[ which(selection$year == 2002 & selection$type == "ON-ROAD") ])
totals["2002", "nonroad"] = sum(selection$Emissions[ which(selection$year == 2002 & selection$type == "NON-ROAD") ])

#2005
totals["2005", "point"] = sum(selection$Emissions[ which(selection$year == 2005 & selection$type == "POINT") ])
totals["2005", "nonpoint"] = sum(selection$Emissions[ which(selection$year == 2005 & selection$type == "NONPOINT") ])
totals["2005", "onroad"] = sum(selection$Emissions[ which(selection$year == 2005 & selection$type == "ON-ROAD") ])
totals["2005", "nonroad"] = sum(selection$Emissions[ which(selection$year == 2005 & selection$type == "NON-ROAD") ])

#2008
totals["2008", "point"] = sum(selection$Emissions[ which(selection$year == 2008 & selection$type == "POINT") ])
totals["2008", "nonpoint"] = sum(selection$Emissions[ which(selection$year == 2008 & selection$type == "NONPOINT") ])
totals["2008", "onroad"] = sum(selection$Emissions[ which(selection$year == 2008 & selection$type == "ON-ROAD") ])
totals["2008", "nonroad"] = sum(selection$Emissions[ which(selection$year == 2008 & selection$type == "NON-ROAD") ])

#Output graph to file
## png(filename = "plot2.png", width=480, height=480, units="px", bg="white") #bg="transparent")

#Close device
##dev.off()