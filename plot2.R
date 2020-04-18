#reading the data
      pow <- read.table("household_power_consumption.txt",sep = ";",na.strings = "?" )
#subseting the required data         
      datepow <- subset(pow,V1=="1/2/2007" | V1=="2/2/2007")
      names(datepow) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
      dttm <- strptime(paste(datepow$Date, datepow$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
#ploting the data
      with(datepow,plot(dttm,as.numeric(as.character(Global_active_power)),xlab="",ylab = "Global Active Power(kilowatts)",type = "l"))
#copying the ploted data to a png
      dev.copy(png,"plot2.png",width=480,height=480)
      dev.off()
      