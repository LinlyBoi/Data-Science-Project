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


#Read spreadsheet file
grocery_entries <- read.csv(file.choose())

#Compare cash and credit totals -Sewelam

cash_credit <- cbind(grocery_entries[3], grocery_entries[8])
sum_cash <-sum(cash_credit[which(cash_credit$paymentType=='Cash'),1])
sum_credit <-sum(cash_credit[which(cash_credit$paymentType=='Credit'),1])
CompCashCredit <- c(sum_cash,sum_credit)
barplot(CompCashCredit,names.arg = c('Cash','Credit'),horiz = FALSE,col = c(rgb(0,1,0),rgb(1,0,0)))

#City and Total Spent comparison -Jimmy






#Compare between ages and their total spent (Youssri)
age <- cbind(grocery_entries[6] , grocery_entries[3])
sum_ages <- aggregate(total ~ age,age,sum)
plot(sum_ages)


#Distribution of spending - Abdo




#kmeans --Yousri
name_total_age<-cbind(grocery_entries[5],grocery_entries[3],grocery_entries[6])
k<-readline("Enter number of clusters: ")
keameans<-cbind(grocery_entries[3],grocery_entries[6])
result<-kmeans(keameans,centers = k)
final_result<-cbind(name_total_age,result$cluster)






#Association Rules --Sewelam
minsup <- readline("Enter minimum support: ")
minconf <- readline("Enter minimum confidence: ")
asoc_rules <- apriori(,parameter = list(supp = minsup,conf = minconf))
write.csv(as(asoc_rules,"data.frame"),file = "pog.csv")