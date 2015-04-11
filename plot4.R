##  Coursera Exploratory Data Analysis Assignment 1
##
##  Plot 4 - Assignment is to construct 4 plots in one view.
##  Sub-Plot 1: Global Active Power by date and time.
##  Sub-Plot 2: Energy sub-metering by date and time.
##  Sub-Plot 3: Voltage by date & time
##  Sub-Plot 4: Global Reactive power by date and time.

##  Variables that specify the path to the downloaded data from UCI and to save copy of plot
##
data_folder <- "/Users/anthonyiannolo/course4data/"
data_folder2 <- "/Users/anthonyiannolo/ExData_Plotting1/"

##  Create strings to subsequently read the data and copy the data
##
plot_string <- paste(data_folder,"household_power_consumption.txt",sep="")
device_string <- paste(data_folder2, "plot4.png")
                                                    
##  Read the plat data
##
plot_data <- read.table(plot_string, header=TRUE, sep=";", na.strings="?")
                                                    
##  Retain two key dates
plot_data_subset <- subset(plot_data, (plot_data$Date == "1/2/2007" |
                                       plot_data$Date == "2/2/2007"))

##  Create new DateTime value from exiting Data and Time values
##
plot_data_subset$DateTime <- 
  strptime(paste(plot_data_subset$Date, plot_data_subset$Time), format="%d/%m/%Y %H:%M:%S")

##  Set up for proper size for PNG File
##
png(filename = device_string, width = 480, height = 480)

##  Define 2 by 2 arrangement
par(mfcol=c(2,2))

##  Create Plots

##  Plot 1
with(plot_data_subset, plot( DateTime, Global_active_power, type="l",
                             ylab="Global Active Power (kilowatts)", xlab=""))
##  Plot 2
with(plot_data_subset, plot( DateTime, Sub_metering_1, type="n",
                             ylab="Energy sub metering", xlab=""))

with(plot_data_subset, lines( DateTime, Sub_metering_1, col = "black"))
with(plot_data_subset, lines( DateTime, Sub_metering_2, col = "red"))
with(plot_data_subset, lines( DateTime, Sub_metering_3, col = "blue"))

legend("topright", lty = c(1,1,1), col=c("black", "red", "blue"),
                          legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))
##  Plot 3
##
with(plot_data_subset, plot( DateTime, Voltage, type="l",
                             ylab="Voltage", xlab="datetime"))
##  Plot 4
##
with(plot_data_subset, plot( DateTime, Global_reactive_power, type="l",
                             ylab="Global_reactive_power", xlab="datetime"))


## Turn off device
dev.off()
