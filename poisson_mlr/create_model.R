

# Plumber R



# Load Data
library(tidyverse, quietly = TRUE)
url <- "https://raw.githubusercontent.com/tykiww/projectpage/master/datasets/Absentee/work_absentee.csv"
dta <- read.csv(url, head = TRUE) %>% as_tibble


set.seed(15)
idd <- sample(nrow(dta),.8*nrow(dta), replace = FALSE)
train <- dta[idd,]
tests <- dta[-idd,]


hist(dta$Absenteeism.time.in.hours) # Looks poisson to me.

# Create Model to Prepare for poisson regression
ab_lm <- glm(Absenteeism.time.in.hours ~., data = train, family = "poisson")

# Save Model
saveRDS(ab_lm, "absent_poisson.rds")

# Load Model
mods <- readRDS("absent_poisson.rds")

# Save test data as JSON
tests_json <- jsonlite::toJSON(tests)
save(tests_json, file="test.json")
