epc <-  read.table("household_power_consumption.txt",header=TRUE,sep=";",stringsAsFactors=FALSE, dec=".")
febepc <- subset(epc,Date == "1/2/2007" | Date == "2/2/2007")
## seems we have to have a date-time to get graphs to look like requested. That's needlessly obtuse
febepc$datetime <-  strptime(paste(febepc$Date, febepc$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
png(file="plot2.png",width = 480, height = 480, units = "px")
with(febepc,plot(datetime,as.numeric(Global_active_power),type="l",xlab="",ylab="Global Active Power"))
dev.off()