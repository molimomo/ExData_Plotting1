plot3<-function(){
    # Read file to generate data.frame
    powerData<-read.table("./household_power_consumption.txt",sep=";",header=TRUE, stringsAsFactors=FALSE)
    
    # Get subset from original data frame 
    powerDataSub<-subset(powerData, Date == "1/2/2007" | Date == "2/2/2007")
    
    # Date time
    dateTime<-as.POSIXlt(paste(as.Date(powerDataSub$Date, format="%d/%m/%Y"), powerDataSub$Time, sep=" "))
    
    # Create target png file with 480 pixels width and height
    png(file="./plot3.png",width = 480, height = 480, units = "px")
    
    # Plotting
    with(powerDataSub, plot(dateTime, powerDataSub$Sub_metering_1, xlab="",ylab="Energy sub metering", type = "n"))
    with(powerDataSub, points(dateTime,powerDataSub$Sub_metering_1 , col = "black",type="l"))
    with(powerDataSub, points(dateTime,powerDataSub$Sub_metering_2 , col = "red",type="l"))
    with(powerDataSub, points(dateTime,powerDataSub$Sub_metering_3 , col = "blue",type="l"))
    legend("topright", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"),lty=1)
    
    # Close device
    dev.off()
}