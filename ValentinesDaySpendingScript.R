#Question 6: Valentines Day Consumer Data
rm(list = ls())
#Load data
Valspending <- read.csv("historical_spending.csv")
#Read in tidyverse (includes ggplot) and plotly
library(tidyverse)
library(plotly)

#Convert from wide to long format
valspendlong <- Valspending %>%
  select(-PerPerson,-PercentCelebrating) %>%
  pivot_longer(cols=-Year, names_to="Category", values_to="SpendingPerPerson")

# Create scatter plot of Valentine's Day spending
plot <- ggplot(valspendlong, aes(x=Year, y=SpendingPerPerson, color=Category)) +
  geom_line() +
  scale_x_continuous(breaks=seq(2010,2022, by=2)) +
  labs(title="Valentine's Day Spending per Person", x="Year",
       y="Spending Per Person ($)") +
  theme(plot.title = element_text(hjust=0.5)) +
  expand_limits(y=0)
#Interact with the plot
ggplotly(plot)  
#Save the plot
ggsave("myplot.png",plot=plot,path=NULL,dpi=300)