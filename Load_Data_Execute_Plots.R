# Loading the dataless 
#
# When loading the dataset into R, please consider the following:
#  
# The dataset has 2,075,259 rows and 9 columns. First calculate a rough
# estimate of how much memory the dataset will require in memory before 
# reading into R. Make sure your computer has enough memory (most modern 
# computers should be fine).

# GB estimate
# Assuming all Numeric
Estimate <-round(2075259*9*8/(2^{20}),2)
# 142.4 MB
round(Estimate/(2^{10}),2)
# 0.14 GB
# Rule of thumb == need almost twice as much free data to read the data;
# Need approx 0.28 GB of RAM to read the data
# OK -- Over 900 GB of free space on computer

URL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
if(!file.exists("~/Documents/DataScience/Course 4/Programming Assignment 1/DATA"))
{dir.create("~/Documents/DataScience/Course 4/Programming Assignment 1/DATA")}
download.file(URL,destfile = 
                "~/Documents/DataScience/Course 4/Programming Assignment 1/DATA/EPConsumption_Dataset.zip")
unzip(zipfile=
        "~/Documents/DataScience/Course 4/Programming Assignment 1/DATA/EPConsumption_Dataset.zip"
      ,exdir="~/Documents/DataScience/Course 4/Programming Assignment 1/DATA")
list.files("~/Documents/DataScience/Course 4/Programming Assignment 1/DATA")
# "EPConsumption_Dataset.zip"       "household_power_consumption.txt"

# Read Data into R
setwd("~/Documents/DataScience/Course 4/Programming Assignment 1/DATA")
HP_DATA <- read.table("household_power_consumption.txt",sep = ";",header = TRUE)
# We will only be using data from the dates 2007-02-01 and 2007-02-02. One 
# alternative is to read the data from just those dates rather than reading
# in the entire dataset and subsetting to those dates.
head(HP_DATA)
names(HP_DATA)
x <- paste(HP_DATA$Date,HP_DATA$Time)
head(x)
HP_DATA$DateTime <-strptime(x,"%d/%m/%Y %H:%M:%S")
head(HP_DATA)

# You may find it useful to convert the Date and Time variables to Date/Time 
# classes in R using the 𝚜𝚝𝚛𝚙𝚝𝚒𝚖𝚎()  and 𝚊𝚜.𝙳𝚊𝚝𝚎() functions.
# 
#Keep Data for Feb 1, 2017 and Feb 2, 2007
HP_PLOTS = subset(HP_DATA,as.Date(HP_DATA$DateTime) >= as.Date("2007-02-01")
                 & as.Date(HP_DATA$DateTime) <= as.Date("2007-02-02"))

head(HP_PLOTS)
indx <- sapply(HP_PLOTS,is.factor)
head(indx)
#Convert all columns 3-9 from factor to numeric
HP_PLOTS[3:9] <- 
  lapply(HP_PLOTS[3:9],
         function(x) as.numeric(as.character(x))
         )
head(HP_PLOTS)

# Note that in this dataset missing values are coded as ?.
apply(HP_PLOTS, 1, function(x) which(x=="?"))
## No ? found in filtered data set

# Making Plots

# Our overall goal here is simply to examine how household
# energy usage varies over a 2-day period in February, 2007. 
# Your task is to reconstruct the following plots below, all 
# of which were constructed using the base plotting system.

# Fork and Clone the following GitHub 
# repository: https://github.com/rdpeng/ExData_Plotting1
setwd("~/Documents/DataScience/Course 4/Programming Assignment 1")

# For each plot (1-4), a separate R code is created.  
par(mfrow = c(1,1)) # 1 plot
# Global Active Power Utilization
png("plot1.png", width=480, height=480, res=120)
plot1(HP_PLOTS)
dev.off()
# Global Active Powwer vs. Time
png("plot2.png", width=480, height=480, res=120)
plot2(HP_PLOTS, HP_PLOTS$Global_active_power,"Global Active Power (Kilowatts)")
dev.off()
# Energy Sub Metering Category vs. Time
png("plot3.png", width=480, height=480, res=120)
plot3(HP_PLOTS)
dev.off()
# Multiple Base Plots: Creates 4 plots
# 1) Global Active Power vs. Time; 2) Voltage vs. Time;
# 3) Energy Sub Metering Category vs. Time; 4) Global Reactive Power vs. Time
png("plot4.png", width=480, height=480, res=120)
plot4(HP_PLOTS)
dev.off()
