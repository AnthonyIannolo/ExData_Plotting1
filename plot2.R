##  Coursera Exploratory Data Analysis Assignment 1
##
##  Plot 2 - Assignment is plot Global Active Power by date and time.
##  Global_active_power = household global minute-averaged active power (in kilowatt)
##  
##  Variables that specify the path to the downloaded data from UCI and to save copy of plot
##
data_folder <- "/Users/anthonyiannolo/course4data/"
data_folder2 <- "/Users/anthonyiannolo/ExData_Plotting1/"
##
##  Create strings to subsequently read the data and copy the data
##
plot_string <- paste(data_folder,"household_power_consumption.txt",sep="")
device_string <- paste(data_folder2, "plot2.png")
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

##  Set up for proper size for PNG File
##
png(filename = device_string, width = 480, height = 480)

##  Create Plot
##
with(plot_data_subset, plot( DateTime, Global_active_power, type="l",
     ylab="Global Active Power (kilowatts)", xlab=""))

##
## Turn off Device
dev.off()
