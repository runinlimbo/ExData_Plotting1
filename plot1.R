# Making Plots: Histogram

# Our overall goal here is simply to examine how household
# energy usage varies over a 2-day period in February, 2007. 
# Your task is to reconstruct the following plots below, all 
# of which were constructed using the base plotting system.

# THe following code creates a histogram fo the Global Active Power
# over the 2-day period
plot1 <- function(HP_PLOTS) {
hist(HP_PLOTS$Global_active_power, col="red", 
     xlab = "Global Active Power (kilowatts)",
     main = "Global Active Power")
}