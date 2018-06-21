library(dplyr)
library(gapminder)
library(ggplot2)

life <- read.csv("https://assets.datacamp.com/production/course_1796/datasets/life_exp_raw.csv")
head(life)
(x <- head(round(life$Female.life.expectancy..years.), 11))

# Measures of center

sum(x)/11
mean(x)
sort(x)
median(x)
table(x)

# Calculate center measures

# Create dataset of 2007 data
gap2007 <- filter(gapminder, gapminder$year == 2007)

# Compute groupwise mean and median lifeExp
gap2007 %>%
  group_by(continent) %>%
  summarize(mean(lifeExp),
            median(lifeExp))


# Generate box plots of lifeExp for each continent
gap2007 %>%
  ggplot(aes(x = continent, y = lifeExp)) +
  geom_boxplot()
