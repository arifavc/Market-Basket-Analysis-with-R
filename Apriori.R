

# Install & Use Library
install.packages('arules')
library(arules)

#Install Dataset Packages
install.packages("datasets.load")

# Load Dataset
data("Groceries")



#Show Dataset as Data Frame
v<- as(Groceries, "transactions") 
class(v)

a<- as(v,"data.frame")
a
# Show Class and Length of Dataset
class(Groceries)

length(Groceries)


# Show The Dataset
inspect(Groceries[1:10])


# Summary of Dataset
summary(Groceries)
s <- summary(Groceries)
View(s)


# Most Frequent Items
s@itemSummary


# frequency/support
itemFrequency(Groceries, type = "relative")


# frequency/support (Items Count)
itemFrequency(Groceries, type = "absolute")


#Absolute Item Frequency Plot Top 25
itemFrequencyPlot(Groceries, topN=15, type="absolute",
                  main='Absolute Item Frequency Plot (Top 25)', 
                  xlab="Items", 
                  ylab="Item Frequency (Absolute)")
 dev.off()

 
#Relative Item Frequency Plot (Top 25)
itemFrequencyPlot(Groceries, topN=15, type="relative",
                  main='Relative Item Frequency Plot (Top 25)', 
                  xlab="Items", 
                  ylab="Item Frequency (relative)")
dev.off()




#Both Association Rules

options(digits = 2)
min_supp <- 0.01
min_conf <- 0.25
min_lenght <- 2
BasketRules <- apriori(Groceries, parameter = list(supp = min_supp, conf = min_conf,
                                                   minlen = min_lenght, target = "rules"))
summary(BasketRules)

#Let's see the first 25 of the rules

inspect(BasketRules[1:25])


#First and last 10 rules according to Confidence values
BasketRules_Conf <- sort(BasketRules, by="confidence", decreasing=TRUE)
inspect(head(BasketRules_Conf, n=5))
inspect(tail(BasketRules_Conf, n=5))

#First and last 10 rules according to Support values
BasketRules_Supp <- sort(BasketRules, by="support", decreasing=TRUE)
inspect(head(BasketRules_Supp, n=5))
inspect(tail(BasketRules_Supp, n=5))

#First and last 10 rules according to Lift values
BasketRules_Lift <- sort(BasketRules, by="lift", decreasing=TRUE)
inspect(head(BasketRules_Lift, n=5))
inspect(tail(BasketRules_Lift, n=5))





