#Uploading data set into Rstudio
getwd()
setwd()
mydata <- read.csv(file.choose())
marketingcampaigns <- read.csv(file.choose(), header = T, sep = ",")


 
#Visualize cost effectiveness of campaign visit - all three together
a <- ggplot(marketingcampaigns, aes(x= Cost , y= Visits , color = Campaign, size = Revenue)) 
a +  geom_point() + geom_smooth()

# How does ad spend affect revenue? pretty strong correlation
b <- ggplot(marketingcampaigns, aes(x= Cost , y= Revenue , color = Campaign)) 
b + geom_point() + geom_smooth() + facet_grid(.~Campaign)

#does ad spend effect visits?
bbb <- ggplot(marketingcampaigns, aes(x= Cost , y= Visits , color = Campaign)) 
bbb + geom_point() + geom_smooth() + facet_grid(.~Campaign)

# ROI of traffic 
#Do higher visits equate to more revenue? 
c <- ggplot(marketingcampaigns, aes(x= Visits  , y= Revenue , color = Campaign)) 
c + geom_point() + geom_smooth() + facet_grid(.~ Campaign)

#Effectiveness of Campaign 
i <- ggplot(marketingcampaigns, aes(x=Revenue, fill = Campaign))
i + geom_dotplot(binwidth = 75) + 
  facet_grid(.~Campaign)

ii<- ggplot(marketingcampaigns, aes(x= Visits, fill = Campaign))
ii + geom_dotplot(binwidth = 75) + 
  facet_grid(.~Campaign)

#AD SPEND Efficiency

# How efficient is ad spend on revenue and visits?
l <- ggplot(marketingcampaigns, aes(x= Week , y=  RPV, color = Campaign)) 
l + geom_col() + facet_grid(.~Campaign)

d <- ggplot(marketingcampaigns, aes(x= Week , y=  CPV, color = Campaign)) 
d + geom_col() + facet_grid(.~Campaign)


e <- ggplot(marketingcampaigns, aes(x= Week, y = RPV, fill = Campaign))
e + geom_col() + facet_grid(.~Campaign)



#Time Series Analysis - Cost / Week

g <- ggplot(mydata, aes(x= Week , y= Cost , color = Campaign)) 
g + geom_area() + facet_grid(.~Campaign)

j <- 

#Time Series Analysis - 
h <- ggplot(marketingcampaigns, aes(x= Week , y=  Profit.Loss , color = Campaign)) 
h + geom_area() + facet_grid(.~Campaign)

k <- ggplot(marketingcampaigns, aes(x= Week , y=  Cum.Profit.Loss , color = Campaign)) 
k+ geom_area() + facet_grid(.~Campaign)

 #Time Series Analysis - Revenue / week
f <- ggplot(mydata, aes(x= Week , y=  Revenue , color = Campaign)) 
f + geom_area() + facet_grid(.~Campaign)


