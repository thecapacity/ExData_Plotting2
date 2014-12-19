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
aggregates <- aggregate(Emissions ~ year + type, data=selection, FUN=sum)
aggregates$type = as.factor(aggregates$type)

#Output graph to file
png(filename = "plot3.png", width=480, height=480, units="px", bg="white") #bg="transparent")

qplot(year, Emissions, data=aggregates, color=type, geom=c("point", "smooth"))

#Close device
dev.off()