install.packages("fitbitScraper")
library("fitbitScraper")
install.packages("ggplot2")
library("ggplot2")  

cookie <- login(email="your id @ fitbit", password="your password")  

df <- get_intraday_data(cookie, what="steps", date="2015-10-21")  
ggplot(df, aes(x=time, y=steps)) + geom_bar(stat="identity") 

steps <- get_daily_data(cookie, what="steps", start_date="2015-10-13", end_date="2015-10-21")  
ggplot(steps, aes(x=time, y=steps)) + geom_point(stat="identity", size=4) + geom_line(stat="identity")
summary(steps)

sleepdata <- get_sleep_data(cookie, start_date="2015-09-01", end_date="2015-09-10")

weight <- get_weight_data(cookie, start_date="2015-01-13", end_date="2015-09-07")  
ggplot(weight, aes(x=time, y=weight)) + geom_point(stat="identity") +
        geom_line(stat="identity")

my_data = data.frame(steps["time"], steps["steps"], sleep["duration"])

heart_data <- get_intraday_data(cookie, what="heart-rate", date="2015-10-21")
colnames(heart_data)[2] <- 'heart'
ggplot(heart_data, aes(x=time, y=heart)) + geom_line(stat="identity") 

sleep <- get_sleep_data(cookie, start_date="2015-10-18", end_date="2015-10-21")  



