##################################################
#                   PLOT #1                      #
##################################################

# Read the database
D <- read.csv('household_power_consumption.txt', sep=';', header=T, stringsAsFactor=F)
# Convert the date's field to Date class
D$Date <- as.Date(D$Date, "%d/%m/%Y")
# Select the datas from 01 Feb 2007 and 02 Feb 2007
D <- D[D$Date>=as.Date("1-2-2007", "%d-%m-%Y") & D$Date<=as.Date("2-2-2007", "%d-%m-%Y"),]
# Change simbols unknown data "?" to "NA"
for (i in 3:9) {D[,i]<-gsub("\\?","NA",D[,i])}
# Convert the data's field to Numeric class
for (i in 3:9) {D[,i]<-as.numeric(D[,i])}
# Create plot #1 in png file
png(filename="plot1.png", width=480, height=480, bg = "transparent")
hist(D$Global_active_power, main="Global active power", col="Red", xlab="Global active power (kilowatts)")
dev.off()
