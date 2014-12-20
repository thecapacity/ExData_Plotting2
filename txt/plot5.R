## This code and associated plot explores the following question:
##
## How have emissions from motor vehicle sources changed from 1999–2008 in Baltimore City?
library(ggplot2)

source("load_data.R")
## Loads two data sets, emissions_data and classification_data

## Subset emissions data to Baltimore City, Maryland (fips == "24510")
selection <- subset(emissions_data, fips == "24510")

## ID classification for motor vehicle sources
auto_indexes = which(
    grepl("vehicle", classification_data$Short.Name, ignore.case=TRUE)
)
auto_classification_data = classification_data[auto_indexes, 1]

## Subset Emissions Data
auto_emissions_data = subset(selection, SCC %in% auto_classification_data)

## Totals
aggregates <- aggregate(Emissions ~ year, data=auto_emissions_data, FUN=sum)

#Output graph to file
png(filename = "plot5.png", width=480, height=480, units="px", bg="white")

## Best Solution:
qplot(year, log(Emissions), data=aggregates, geom=c("point", "smooth"), method="lm") +
    labs(title="Baltimore Vehicle-based Emissions")

#Close device
dev.off()