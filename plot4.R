# Making Plots: Multiple Base Plots
#
# DATA IMPORT, EXECUTION OF PLOT, & CREATION OF PNG FILE IN 
# LOAD_DATA_EXECUTE_PLOTS.R
#
# Our overall goal here is simply to examine how household
# energy usage varies over a 2-day period in February, 2007. 
# Your task is to reconstruct the following plots below, all 
# of which were constructed using the base plotting system.

# The following code creates a multiple base plots of the 
# 1) Upper Left: plot2.R 
# 2) Upper Right DateTime vs. Voltage
# 3) Lower Left: plot3.R
# 4) Lower Right: DateTime vs. Global reactive power
plot4 <- function(HP_PLOTS){
par(mfrow = c(2, 2), mar = c(4, 4, 4, .5), oma = c(0, 0, 1, 0))
op <- par(cex = .6)
plot2(HP_PLOTS, HP_PLOTS$Global_active_power,"Global Active Power (kilowatts)")
plot2(HP_PLOTS, HP_PLOTS$Voltage,"Voltage")
plot3(HP_PLOTS)
plot2(HP_PLOTS, HP_PLOTS$Global_reactive_power,"Global Reactive Power")

}
