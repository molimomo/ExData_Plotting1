plot2<-function(){
    # Read file to generate data.frame
    powerData<-read.table("./household_power_consumption.txt",sep=";",header=TRUE, stringsAsFactors=FALSE)
    
    # Get subset from original data frame
    powerDataSub<-subset(powerData, Date == "1/2/2007" | Date == "2/2/2007")
    
    # Global Reactive Power
    globalActivity<-powerDataSub$Global_active_power
    globalActivity<-as.numeric(globalActivity[globalActivity!="?"])
    
    # Date time
    dateTime<-as.POSIXlt(paste(as.Date(powerDataSub$Date, format="%d/%m/%Y"), powerDataSub$Time, sep=" "))
    
    # Create target png file with 480 pixels width and height
    png(file="./plot2.png",width = 480, height = 480, units = "px")
    
    # Plotting
    plot(dateTime, powerDataSub$Global_active_power,xlab="",ylab="Global Active Power (kilowatts)", type="l")
    
    # Close device
    dev.off()
}