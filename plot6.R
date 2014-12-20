## This code and associated plot explores the following question:
##
## Compare emissions from motor vehicle sources in Baltimore City, Maryland (fips == "24510")
## with emissions from motor vehicle sources in Los Angeles County, California (fips == "06037").

## Which city has seen greater changes over time in motor vehicle emissions?

library(ggplot2)

source("load_data.R")
## Loads two data sets, emissions_data and classification_data

## ID classification for motor vehicle sources
auto_indexes = which(
    grepl("vehicle", classification_data$Short.Name, ignore.case=TRUE)
)
auto_classification_data = classification_data[auto_indexes, 1]

## Subset Emissions Data, first by automotive then by location
auto_emissions_data = subset(emissions_data, SCC %in% auto_classification_data)
auto_emissions_selection <- subset(auto_emissions_data, fips == "24510" | fips =="06037")
##auto_emissions_selection$fips <- as.factor(auto_emissions_selection$fips)

## Totals
aggregates <- aggregate(Emissions ~ year + fips, data=auto_emissions_selection, FUN=sum)
## Cleanup fips code for Legend
aggregates[aggregates$fips == "06037","fips"] = "LA County"
aggregates[aggregates$fips == "24510","fips"] = "BAL City"

#Output graph to file
png(filename = "plot6.png", width=480, height=480, units="px", bg="white")

## Best Solution:
qplot(year, log(Emissions), data=aggregates, geom=c("point", "smooth"),
      color=fips, method="lm")

#Close device
dev.off()