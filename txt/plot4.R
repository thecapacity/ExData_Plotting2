## This code and associated plot explores the following question:
##
## Across the United States, how have emissions from coal combustion-related 
##      sources changed from 1999–2008?
library(ggplot2)

source("load_data.R")
## Loads two data sets, emissions_data and classification_data

## Subset classification just to coal combustion-released, sources,
coal_indexes = which(
                grepl("coal", classification_data$Short.Name, ignore.case=TRUE) &
                grepl("comb", classification_data$Short.Name, ignore.case=TRUE)
                )
coal_classification_data = classification_data[coal_indexes, 1]

## Subset Emissions Data
coal_emissions_data = subset(emissions_data, SCC %in% coal_classification_data)

## Totals
aggregates <- aggregate(Emissions ~ year, data=coal_emissions_data, FUN=sum)

#Output graph to file
png(filename = "plot4.png", width=480, height=480, units="px", bg="white")

## Best Solution:
qplot(year, log(Emissions), data=aggregates, geom=c("point", "smooth"), method="lm") +
    labs(title="US Coal Combustion-based Emissions")

#Close device
dev.off()