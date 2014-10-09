##################################################
#                   PLOT #3                      #
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
png(filename="plot3.png", width=480, height=480, bg = "transparent")
plot(D$DateTime, D$Sub_metering_1, ylab="Energy sub metering", xlab="", type="l")
lines(D$DateTime, D$Sub_metering_2, col="Red")
lines(D$DateTime, D$Sub_metering_3, col="Blue")
legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=c(1,1,1),col=c("black", "red","blue"))
dev.off()
