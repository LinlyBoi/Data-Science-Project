library(readxl)
#grocery_entries <- read.csv(file.choose())
grocery_entries <- read_excel("~/College/Data Science/Project/grc.xlsx")
cash_credit <- cbind(grocery_entries[3], grocery_entries[8])
#
#sum_cash <-sum(cash_credit[which(cash_credit$paymentType=='Cash'),1])
#sum_credit <-sum(cash_credit[which(cash_credit$paymentType=='Credit'),1])

CompCashCredit <- c(sum_cash,sum_credit)
#please visualise the data I am lazy - Sewelam
ages <- cbind(grocery_entries[6] , grocery_entries[3])
sum_ages <- aggregate(total ~ age,ages,sum)
#First Github Commitment! 2