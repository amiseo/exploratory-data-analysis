library(dplyr)
library(ggplot2)

cars <- read.csv("https://assets.datacamp.com/production/course_1796/datasets/cars04.csv")

# Learn data structure
str(cars)

# A dot plot shows all the datapoints
ggplot(cars, aes(x = weight)) + 
  geom_dotplot(dotsize = 0.4)

# A histogram groups the points into bins so it does not get overwhelming
ggplot(cars, aes(x = weight)) + 
  geom_histogram(dotsize = 0.4, binwidth = 500)

# A density plot gives a bigger picture representation of the distribution
# It more helpful when there is a lot of data
ggplot(cars, aes(x = weight)) + 
  geom_density()

# A boxplot is a good way to just show the summary info of the distriubtion
ggplot(cars, aes(x = 1, y = weight)) + 
  geom_boxplot() +
  coord_flip()

# Create faceted histogram
ggplot(cars, aes(x = city_mpg)) +
  geom_histogram() +
  facet_wrap(~ suv) # can facet a plot by any categorical variable using facet_wrap()

# Filter cars with 4, 6, 8 cylinders
common_cyl <- filter(cars, ncyl %in% c(4,6,8))

# Create box plots of city mpg by ncyl
ggplot(common_cyl, aes(x = as.factor(ncyl), y = city_mpg)) +
  geom_boxplot()

# Create overlaid density plots for same data
ggplot(common_cyl, aes(x = city_mpg, fill = as.factor(ncyl))) +
  geom_density(alpha = .3)

# Create hist of horsepwr
cars %>%
  ggplot(aes(horsepwr)) +
  geom_histogram() +
  ggtitle("Horsepower Distribution")

# Create hist of horsepwr for affordable cars
cars %>% 
  filter(msrp < 25000) %>%
  ggplot(aes(horsepwr)) +
  geom_histogram() +
  xlim(c(90, 550)) +
  ggtitle("Horsepower distribtion for msrp < 25000")

# Create hist of horsepwr with binwidth of 3
cars %>%
  ggplot(aes(horsepwr)) +
  geom_histogram(binwidth = 3) +
  ggtitle("Horse Power - Binwidth 3")

# Create hist of horsepwr with binwidth of 30
cars %>%
  ggplot(aes(horsepwr)) +
  geom_histogram(binwidth = 30) +
  ggtitle("Horse Power - Binwidth 30")


# Create hist of horsepwr with binwidth of 60
cars %>% 
  ggplot(aes(horsepwr)) +
  geom_histogram(binwidth = 30) +
  ggtitle("Horse Power - Binwidth 30")
