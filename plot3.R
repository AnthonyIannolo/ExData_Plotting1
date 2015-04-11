##  Coursera Exploratory Data Analysis Assignment 1
##
##  Plot 3 - Assignment is Energy sub-metering by date and time.
##  Sub_metering_1: kitchen, containing mainly a dishwasher, an oven and a microwave 
##  Sub_metering_2: laundry room, containing a washing-machine, tumble-drier, refrigerator and light
##  Sub_metering_3: electric water-heater and an air-conditioner.
##
##  Variables that specify the path to the downloaded data from UCI and to save copy of plot
##
data_folder <- "/Users/anthonyiannolo/course4data/"
data_folder2 <- "/Users/anthonyiannolo/ExData_Plotting1/"
##
##  Create strings to subsequently read the data and copy the data
##
plot_string <- paste(data_folder,"household_power_consumption.txt",sep="")
device_string <- paste(data_folder2, "plot3.png")
##                                                     
##  Read the plat data
##
plot_data <- read.table(plot_string, header=TRUE, sep=";", na.strings="?")
##                                                     
##  Retain two key dates
plot_data_subset <- subset(plot_data, (plot_data$Date == "1/2/2007" |
                                       plot_data$Date == "2/2/2007"))
##
##  Create new DateTime value from exiting Data and Time values
##
plot_data_subset$DateTime <- 
  strptime(paste(plot_data_subset$Date, plot_data_subset$Time), format="%d/%m/%Y %H:%M:%S")
##
##  Set up for proper size for PNG File
##
png(filename = device_string, width = 480, height = 480)

##  Create Plot
##
with(plot_data_subset, plot( DateTime, Sub_metering_1, type="n",
                             ylab="Energy sub metering", xlab=""))

with(plot_data_subset, lines( DateTime, Sub_metering_1, col = "black"))
with(plot_data_subset, lines( DateTime, Sub_metering_2, col = "red"))
with(plot_data_subset, lines( DateTime, Sub_metering_3, col = "blue"))

legend("topright", lty = c(1,1,1), col=c("black", "red", "blue"),
                          legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))

##
## Turn off Device
dev.off()
