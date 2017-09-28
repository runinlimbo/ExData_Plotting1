# Making Plots: Line Graph
#
# DATA IMPORT, EXECUTION OF PLOT, & CREATION OF PNG FILE IN 
# LOAD_DATA_EXECUTE_PLOTS.R
#
# Our overall goal here is simply to examine how household
# energy usage varies over a 2-day period in February, 2007. 
# Your task is to reconstruct the following plots below, all 
# of which were constructed using the base plotting system.

# The following code creates a line graph of the Global Active 
# Power output by day over the 2-day period
plot2 <- function(HP_PLOTS, YData, yaxis) {
head(HP_PLOTS)
x <- HP_PLOTS$DateTime
y <- YData
xrange <- range(x)
yrange <- range(y)

plot(xrange,yrange, xlab ="", 
     ylab= yaxis,#"Global Active Power (kilowatts)",
     pch = NA_integer_)
lines(x,y,lwd=.75)
}
