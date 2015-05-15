#read all data
file <- "household_power_consumption.txt"
data <- read.table(file, sep=";",header=TRUE)
data$Date <- as.Date(data$Date,format="%d/%m/%Y")

#subsetting only the interesting dates
select_date <- as.Date(c("2007-02-01","2007-02-02"),format="%Y-%m-%d")
subset_data <- data[data$Date %in% select_date,]
d<-subset_data #shortcut
d$Global_active_power <- as.numeric(as.character(d$Global_active_power)) #convert factors to numeric

#make the plot
png("plot1.png")
hist(d$Global_active_power,col="red",main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()



