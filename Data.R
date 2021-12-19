# Installing Packages
#install.packages("ClusterR")
#Run install.packages if you haven't installed it before (only once)
#install.packages("cluster")

# Loading package
#library(ClusterR)
library(cluster)

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
ages <- cbind(grocery_entries[6] , grocery_entries[3])
sum_ages <- aggregate(total ~ age,ages,sum)
plot(sum_ages)


#Distribution of spending - Abdo






