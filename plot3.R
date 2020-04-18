#reading the data
        pow <- read.table("household_power_consumption.txt",sep = ";",na.strings = "?" )
#subseting the required data         
        datepow <- subset(pow,V1=="1/2/2007" | V1=="2/2/2007")
        names(datepow) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
        dttm <- strptime(paste(datepow$Date, datepow$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
#plotting graph
        with(datepow,plot(dttm,as.numeric(as.character(Sub_metering_1)), type = "l", ylab = "Energy sub metering", xlab = ""))
        with(datepow,lines(dttm,as.numeric(as.character(Sub_metering_2)), col = "Red"))
        with(datepow,lines(dttm,as.numeric(as.character(Sub_metering_3)), col = "Blue"))
        legend("topright", lty = 1, col = c("black", "red", "blue"),legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
#copying to png file
        dev.copy(png,"plot3.png",width=480,height=480)
        dev.off()
        