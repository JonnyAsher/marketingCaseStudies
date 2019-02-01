mydata = read.csv(file.choose(), header = T, sep = ";")  #reads data into R data frame
rm(mydata)
summary(mydata)
head(mydata)
str(mydata)

#convert time stamps to POSIXct class type for time series analysis
mydata$session_start_text <- as.POSIXct(paste(mydata$session_start_text), format="%H:%M:%S" )
mydata$session_end_text <- as.POSIXct(paste(mydata$session_end_text), format="%H:%M:%S" )
mydata$session <-as.factor(mydata$session)

mydata$diff.time<- -c(mydata$diff.time)
mydata$diff.time <- difftime(mydata$session_end_text, mydata$session_start_text, units="mins")

##These turn the class type to posixlt
#mydata$session_start_text <- strptime(x = as.character(mydata$session_start_text),
 #                               format = "%H:%M:%S")
#mydata$session_end_text <- strptime(x = as.character(mydata$session_end_text),
   #                                   format = "%H:%M:%S")



aa <- ggplot(mydata, aes(x= session, y = mydata$diff.time)) 
     aa + geom_point()
     aa + coord_cartesian(
       xlim = c(0,10000), ylim= c(0,10)) 

#Distribution of clickouts between booking and nonbooking          
bb <- ggplot(mydata, aes(x= clickouts)) 
 bb + geom_histogram() + facet_grid(.~booking)
 
 #How long is each session
ee <- ggplot(mydata, aes(x= diff.time)) 
ee + geom_histogram(binwidth = .05) + facet_grid(.~booking) + 
  coord_cartesian( xlim = c(0,5)) + labs(x = "Total Session Time")

ff <-  ggplot(mydata, aes(x= session_start_text)) 
ff + geom_histogram() + facet_grid(.~booking) + labs(x = "Time of Day")
 

#filter dataset into booking and non-bookings
booked<-subset(mydata, booking=='1')  
notbooked <-subset(mydata, booking=='0') 

cc <- ggplot(booked, aes(x= clickouts)) 
cc + geom_dotplot() + scale_fill_gradientn(colors = heat.colors(6))

dd<- ggplot(notbooked, aes(x= clickouts)) 
dd + geom_histogram()

session_start <- hms(c(mydata$session_start_text))
mydata$session_start_text <- ymd_hms(mydata$session_start_text)
mydata$session_end_text <- ymd_hms(mydata$session_start_text)

mydata$session_start_text[1:99]
session_start <- hms(c(mydata$session_start_text))


