epc <-  read.table("household_power_consumption.txt",header=TRUE,sep=";",stringsAsFactors=FALSE, dec=".")
febepc <- subset(epc,Date == "1/2/2007" | Date == "2/2/2007")
## seems we have to have a date-time to get graphs to look like requested. That's needlessly obtuse
febepc$datetime <-  strptime(paste(febepc$Date, febepc$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
png(file="plot3.png",width = 480, height = 480, units = "px")plot
par(mfrow = c(2, 2))
with(febepc,plot(datetime,as.numeric(Global_active_power),type="l",xlab="",ylab="Global Active Power"))
with(febepc,plot(datetime,as.numeric(Voltage),type="l",xlab="datetime",ylab="Voltage"))
with(febepc,plot(datetime,as.numeric(Sub_metering_1),type="l",ylab="Energy Submetering",xlab=""))
with(febepc,points(datetime,as.numeric(Sub_metering_2, type="l"),type="l",col="red"))
with(febepc,points(datetime,as.numeric(Sub_metering_3, type="l"),type="l",col="blue"))
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
with(febepc,plot(datetime,as.numeric(Global_reactive_power),type="l",xlab="datetime",ylab="Global_reactive_power"))
dev.off()



