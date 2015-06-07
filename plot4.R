plot4<-function(){
    # Read file to generate data.frame
    powerData<-read.table("./household_power_consumption.txt",sep=";",header=TRUE, stringsAsFactors=FALSE)
    
    # Get subset from original data frame 
    powerDataSub<-subset(powerData, Date == "1/2/2007" | Date == "2/2/2007")
   
    # Global Active Power
    globalActivity<-powerDataSub$Global_active_power
    globalActivity<-as.numeric(globalActivity[globalActivity!="?"])
    
    # Global Reactive Power
    globalReactivity<-powerDataSub$Global_reactive_power
    globalReactivity<-as.numeric(globalReactivity[globalReactivity!="?"])
    
    # Voltage
    voltage<-powerDataSub$Voltage
    voltage<-as.numeric(voltage[voltage!="?"])
   
    # Date time
    dateTime<-as.POSIXlt(paste(as.Date(powerDataSub$Date, format="%d/%m/%Y"), powerDataSub$Time, sep=" "))
    
    ## Exploratory section ##    
    # Create target png file with 480 pixels width and height
    png(file="./plot4.png",width = 480, height = 480, units = "px")
    
    # 2 rows and 2 cols in row-wise
    par(mfrow = c(2,2))
    
    # Plotting
    with(powerDataSub,{
        # figure 1. Global Active Power versus Date Time
        plot(dateTime, powerDataSub$Global_active_power,xlab="",ylab="Global Active Power", type="l")
        
        # figure 2. Voltage versus Date Time
        plot(dateTime, powerDataSub$Voltage,xlab="datetime",ylab="Voltage", type="l")
        
        # figure 3. Energy sub metering versus Date Time
        with(powerDataSub, plot(dateTime, powerDataSub$Sub_metering_1, xlab="",ylab="Energy sub metering", type = "n"))
        with(powerDataSub, points(dateTime,powerDataSub$Sub_metering_1 , col = "black",type="l"))
        with(powerDataSub, points(dateTime,powerDataSub$Sub_metering_2 , col = "red",type="l"))
        with(powerDataSub, points(dateTime,powerDataSub$Sub_metering_3 , col = "blue",type="l"))
        legend("topright", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"),lty=1)
        
        # figure 4. Global_reactive_power versus Date Time
        plot(dateTime, powerDataSub$Global_reactive_power,xlab="datetime",ylab="Global_reactive_power", type="l")
    })
    
    # Close device
    dev.off()
}