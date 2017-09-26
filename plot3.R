# Making Plots: Multiple Line Graph

# Our overall goal here is simply to examine how household
# energy usage varies over a 2-day period in February, 2007. 
# Your task is to reconstruct the following plots below, all 
# of which were constructed using the base plotting system.

# The following code creates a multiple line graph of the 
# Energy Sub Metering output by day over the 2-day period

plot3 <- function(HP_PLOTS) {
head(HP_PLOTS)
x <- HP_PLOTS$DateTime
y1 <- HP_PLOTS$Sub_metering_1
y2 <- HP_PLOTS$Sub_metering_2
y3 <- HP_PLOTS$Sub_metering_3

xrange <- range(x)
yrange <- range(y1,y2,y3)

# Draw Plot
plot(xrange,yrange, xlab ="", 
     ylab= "Energy sub metering",
     pch = NA_integer_)

# Add Lines
lines(x,y3, col = "blue")
lines(x,y2,col = "red")
lines(x,y1, col = "black")

# Add Legend
legend("topright", lwd=c(1,1.5,2), col=c("black","red","blue"),
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       bty="n"
       )
}