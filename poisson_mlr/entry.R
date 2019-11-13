# Entrypoint File

url <- "https://raw.githubusercontent.com/tykiww/plumber_use/master/poisson_mlr/plumber.R"
download.file(url, "plumber.R")
pr <- plumber::plumb("plumber.R")
glimpse(train)
pr$run(port = 8000,
       swagger = function(pr, spec, ...){
         # Define request body for POST to /predict
         spec$paths$`/predict`$post$requestBody <- list(
           description = "New data to predict",
           required = TRUE,
           content = list(
             `application/json` = list(
               # Define JSON schema
               schema = list(
                 title = "Absentee",
                 required = c("Reason.for.absence", "Month.of.absence", "Day.of.the.week", 
                              "Seasons", "Transportation.expense", "Distance.from.Residence.to.Work", "Service.time",                   
                              "Age", "Work.load.Average.day", "Hit.target", "Disciplinary.failure",           
                              "Education", "Son", "Social.drinker", "Social.smoker",                  
                              "Pet", "Weight", "Height", "Body.mass.index"),
                 properties = list(
                   
                   Reason.for.absence = list(type = "integer"),
                   Month.of.absence = list(type = "integer"),
                   Day.of.the.week = list(type = "integer"),
                   Seasons = list(type = "integer"),
                   Transportation.expense = list(type = "integer"),
                   Distance.from.Residence.to.Work = list(type = "integer"),
                   Service.time = list(type = "integer"),
                   Age = list(type = "integer"),
                   Work.load.Average.day = list(type = "numeric"),
                   Hit.target = list(type = "integer"),
                   Disciplinary.failure = list(type = "integer"),
                   Education = list(type = "integer"),
                   Son = list(type = "integer"),
                   Social.drinker = list(type = "integer"),
                   Social.smoker  = list(type = "integer"),
                   Pet = list(type = "integer"),
                   Weight = list(type = "integer"),
                   Height = list(type = "integer"),
                   Body.mass.index= list(type = "integer")
                   
                 )
               )
             )
           )
         )
         spec
       }
       )




