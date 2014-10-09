##################################################
#                   PLOT #2                      #
##################################################

library(dplyr)

# Read the database
D <- read.csv('household_power_consumption.txt', sep=';', header=T, stringsAsFactor=F)
# Select the datas from 01 Feb 2007 and 02 Feb 2007
D <- D[as.Date(D$Date,"%d/%m/%Y")>=as.Date("1-2-2007", "%d-%m-%Y") & as.Date(D$Date,"%d/%m/%Y")<=as.Date("2-2-2007", "%d-%m-%Y"),]
# Add column DateTime
D <- mutate(D, DateTime=paste(D$Date, D$Time))
# Convert the datetime's field to POSIXlt class
D$DateTime<-strptime(D$DateTime,"%d/%m/%Y %T")
# Change simbols unknown data "?" to "NA"
for (i in 3:9) {D[,i]<-gsub("\\?","NA",D[,i])}
# Convert the data's field to Numeric class
for (i in 3:9) {D[,i]<-as.numeric(D[,i])}
# Create plot in png file
png(filename="plot2.png", width=480, height=480, bg = "transparent")
plot(D$DateTime, D$Global_active_power, ylab="Global active power (kilowatts)", xlab="", type="l")
dev.off()
