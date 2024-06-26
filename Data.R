# Installing Packages
#install.packages('gridExtra')
#Run install.packages if you haven't installed it before (only once)
#install.packages("cluster")
#install.packages('ggplot2')
# Loading package
#library(ClusterR)

library(cluster)
library(gridExtra)
library(ggplot2)
library(grid)
library(arules)
library(RColorBrewer)


#library(cluster)
coul <- brewer.pal(5, "Set2")

#Read spreadsheet file
grocery_entries <- read.csv(file.choose())


#Compare cash and credit totals -Sewelam

cash_credit <- cbind(grocery_entries[3], grocery_entries[8])
sum_cash <-sum(cash_credit[which(cash_credit$paymentType=='Cash'),1])
sum_credit <-sum(cash_credit[which(cash_credit$paymentType=='Credit'),1])
CompCashCredit <- c(sum_cash,sum_credit)
barplot(CompCashCredit,names.arg = c('Cash','Credit'),horiz = TRUE,col = coul)

#City and Total Spent comparison -Jimmy
city_total <- cbind(grocery_entries[3], grocery_entries[7])
sum_cities<-aggregate(total ~city ,city_total,sum)
sum_citiesOrdered <- sum_cities[order(sum_cities$total),]
barplot(height = sum_citiesOrdered$total,names.arg = sum_citiesOrdered$city,col = coul,las=2)
        


#Compare between ages and their total spent (Youssri)
age <- cbind(grocery_entries[6] , grocery_entries[3])
sum_ages <- aggregate(total ~ age,age,sum)
pie(sum_ages$total,col = coul,labels = sum_ages$age,main = "Ages and total spent")


#Distribution of spending - Abdo

plot(grocery_entries$total, col = coul,type = "l", main = "spending")

#All in one dashboard
pdf(file = "graphs.pdf")

plot(grocery_entries$total, col = coul,type = "l", main = "spending")
pie(sum_ages$total,col = coul,labels = sum_ages$age,main = "Ages and total spent")
barplot(height = sum_citiesOrdered$total,names.arg = sum_citiesOrdered$city,col = coul,las=2)
barplot(CompCashCredit,names.arg = c('Cash','Credit'),horiz = TRUE,col = coul)

dev.off()

#kmeans --Yousri
name_total_age<-cbind(grocery_entries[5],grocery_entries[3],grocery_entries[6])
n<-as.numeric(readline("Enter number of clusters: "))
keameans<-cbind(grocery_entries[3],grocery_entries[6])
result<-kmeans(keameans,centers =n)
final_result<-cbind(name_total_age,result$cluster)


#Association Rules --Sewelam
clean_data <- grocery_entries[,-5] #remove names
minsup <- as.numeric(readline("Enter minimum support: "))
minconf <- as.numeric(readline("Enter minimum confidence: "))
asoc_rules <- apriori(clean_data,parameter = list(supp = minsup,conf = minconf))
asociation_rules <- inspect(asoc_rules)
write.csv(as(asoc_rules,"data.frame"),file = "Output.csv")




