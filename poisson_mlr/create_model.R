

# Plumber R



# Load Data
library(tidyverse, quietly = TRUE)
url <- "https://raw.githubusercontent.com/tykiww/projectpage/master/datasets/Absentee/work_absentee.csv"
dta <- read.csv(url, head = TRUE) %>% as_tibble


set.seed(15)
idd <- sample(nrow(dta),.8*nrow(dta), replace = FALSE)
train <- dta[idd,]
tests <- dta[-idd,]
glimpse(dta)

hist(dta$Absenteeism.time.in.hours) # Looks poisson to me.

# Create Model to Prepare for poisson regression
ab_lm <- glm(Absenteeism.time.in.hours ~., data = train, family = "poisson")
summary(ab_lm)

# Save Model
saveRDS(ab_lm, "absent_poisson.rds")

# Load Model
mods <- readRDS("absent_poisson.rds")

# Predict using Loaded File
pred <- predict(mods, tests)


# https://shirinsplayground.netlify.com/2018/01/plumber/
