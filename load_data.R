##library("data.table")

#Get data if it doesn't exist
if (! file.exists("data")) {
    dir.create("data")
    data_file <- "./data/data.zip"
    download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip", mode="wb",
                    destfile=data_file, method="curl")
    dateDownloaded <- date()
}

unzip("./data/data.zip")
emissions_data <- readRDS("summarySCC_PM25.rds")
classification_data <- readRDS("Source_Classification_Code.rds")

file.remove("summarySCC_PM25.rds")
file.remove("Source_Classification_Code.rds")