#read all data
file <- "household_power_consumption.txt"
data <- read.table(file, sep=";",header=TRUE)
data$Date <- as.Date(data$Date,format="%d/%m/%Y")

#subsetting only the interesting dates
select_date <- as.Date(c("2007-02-01","2007-02-02"),format="%Y-%m-%d")
subset_data <- data[data$Date %in% select_date,]
df<-subset_data #shortcut
df$Sub_metering_1 <- as.numeric(as.character(df$Sub_metering_1)) #convert factors to numeric
df$Sub_metering_2 <- as.numeric(as.character(df$Sub_metering_2)) #convert factors to numeric
df$Sub_metering_3 <- as.numeric(as.character(df$Sub_metering_3)) #convert factors to numeric
df$datetime <- as.POSIXct(paste(df$Date, as.character(df$Time))) #add new column date&time

#make the plot
png("plot3.png")
plot(x=df$datetime,y=df$Sub_metering_1,col="black",ylab="Energy sub metering",type="l",xlab="")
lines(x=df$datetime,y=df$Sub_metering_2,col="red")
lines(x=df$datetime,y=df$Sub_metering_3,col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=c(1,1),lwd=c(1,1))
dev.off()




