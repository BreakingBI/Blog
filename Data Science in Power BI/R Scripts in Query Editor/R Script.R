dataset <- read.csv(
  "C://Users//Brad//Documents//GitHub//Blog//Data Science in Power BI//R Scripts in Query Editor//data.csv"
)
head(dataset)

tax <- dataset[,c("SalesOrderID", "TaxAmt", "TotalDue")]
tax[,"TaxPerc"] <- tax[,"TaxAmt"] / tax[,"TotalDue"]
head(tax)

freight <- dataset[,c("SalesOrderID", "Freight", "TotalDue")]
freight[,"FreightPerc"] <- freight[,"Freight"] / freight[,"TotalDue"]
head(freight)

library(dplyr)
totalsales <- dataset %>%
  group_by(CustomerID) %>%
  summarise(
    TotalSales = sum(TotalDue)
  )
head(totalsales)