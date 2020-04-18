 
#reading the data
         pow <- read.table("household_power_consumption.txt",sep = ";",na.strings = "?",header = TRUE )
#subseting the required data         
         datepow <- subset(pow,Date==c("1/2/2007","2/2/2007"))
         Glactpow <- as.numeric(datepow$Global_active_power)
#plotting the data 
         hist(Glactpow,col = "red",xlab = "Global Active Power(kilowatts)",main = "Global Active Power")
#copying the ploted data to a png
         dev.copy(png,"plot1.png",width=480 , height=480)
         dev.off()
