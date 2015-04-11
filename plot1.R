##  Coursera Exploratory Data Analysis Assignment 1
##
##  Plot 1 - Assignment is to constuct a histogram of Global Active Power Observations
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
device_string <- paste(data_folder2, "plot1.png")
##                                                     
##  Read the plat data
##
plot_data <- read.table(plot_string, header=TRUE, sep=";", na.strings="?")
##                                                     
##  Retain two key dates
plot_data_subset <- subset(plot_data, (plot_data$Date == "1/2/2007" |
                                       plot_data$Date == "2/2/2007"))

##  Set up for proper size for PNG File
##
png(filename = device_string, width = 480, height = 480)

##  Create the Histogram
##
hist(plot_data_subset$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col ="red")
##
## Turn off Device
dev.off()
