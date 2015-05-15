#read all data
file <- "household_power_consumption.txt"
data <- read.table(file, sep=";",header=TRUE)
data$Date <- as.Date(data$Date,format="%d/%m/%Y")

#subsetting only the interesting dates
select_date <- as.Date(c("2007-02-01","2007-02-02"),format="%Y-%m-%d")
subset_data <- data[data$Date %in% select_date,]
df<-subset_data #shortcut
df$Global_active_power <- as.numeric(as.character(df$Global_active_power)) #convert factors to numeric
df$datetime <- as.POSIXct(paste(df$Date, as.character(df$Time))) #add new column date&time

#make the plot
png("plot2.png")
plot(x=df$datetime,y=df$Global_active_power,col="black",ylab="Global Active Power (kilowatts)",type="l",xlab="")
dev.off()




