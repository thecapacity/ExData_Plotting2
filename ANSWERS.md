== Answers

**Each question is addressed via a specific plot[1-5].R and corresponding *.png file.** available in the repository: http://github.com/thecapacity/ExData_Plotting2

You must address the following questions and tasks in your exploratory analysis. For each question/task you will need to make a single plot. Unless specified, you can use any plotting system in R to make your plot.

1. Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? Using the base plotting system, make a plot showing the total PM2.5 emission from all sources for each of the years 1999, 2002, 2005, and 2008.

```
Total US Emissions for the years 1999-2008 (Specifically the years measured: 1999, 2002, 2005, 2008) have decreased.

Plot1.png was composed using R's base plotting capabilities and shows a line plot of the total emissions with an overall downward trend.
```

2. Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510") from 1999 to 2008? Use the base plotting system to make a plot answering this question.

```
Total Emissions for Baltimore City, MD (fips code 24510) for the years 1999-2008 (Specifically the years measured: 1999, 2002, 2005, 2008) have decreased for the full period.

Plot2.png was composed using R's base plotting capabilities and shows a line plot of the total emissions with a downward trend, although there seems to be a spike in emissions between 2002 and 2005.
```

3. Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable, which of these four sources have seen decreases in emissions from 1999–2008 for Baltimore City? Which have seen increases in emissions from 1999–2008? Use the ggplot2 plotting system to make a plot answer this question.

```
Of the four sources of emissions types (point, nonpoint, onroad, nonroad) three of them have seen general decreases in emissions during the time period: Non-Road, Non-Point, and On-Road.

One of them, Point, has seen a general increase in emissions although the trend line shows significant margin for measurement. 

Plot3.png was created with the ggplot2 library and shows each of the four factors in separate panels, with an associated linear regression line.
```

4. Across the United States, how have emissions from coal combustion-related sources changed from 1999–2008?

```
During the time period measured (specifically years 1999, 2002, 2005, and 2008) US Coal Combusion-based emissions, based on the Short.Name variable specifying "coal" and "comb", have declined.

Plot4.png shows a ggplot2 line plot, with linear regression line, outlining the log() of the emission values.
```

5. How have emissions from motor vehicle sources changed from 1999–2008 in Baltimore City?

```
Baltimore vehicile-based emissions, based on the Short.Name variable specifying "vehicle", have declined over the time period (years 1999, 2002, 2005, and 2008).

Plot5.png shows a ggplot2 line plot, with linear regression line, of the log() of emission valies for this time period.
```

6. Compare emissions from motor vehicle sources in Baltimore City with emissions from motor vehicle sources in Los Angeles County, California (fips == "06037"). Which city has seen greater changes over time in motor vehicle emissions?

```
Both Baltimore City (fips 24510) and LA County (fips 06037) have seen reductions in emissions over the time period measured, with Baltimore's overall emissions being significantly less than LA's.

Plot6.png shows the log() of emission values for this period, specifically years (1999, 2002, 2005, and 2008) based on the identifification of vehicle-based sources (with "vehicle" in the Short.Name) for both of these geographic areas. The ggplot2 graph has both factors overlayed on a single graph for better comparison.
```

