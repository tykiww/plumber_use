
# Poisson GLM API

# Plumber R

# Establish url connection and load model
url <- url("https://github.com/tykiww/plumber_use/raw/master/poisson_mlr/absent_poisson.rds")
p_mod <- readRDS(url)


#* @apiTitle Poisson GLM Absentee Regression API
#* @apiDescription Endpoints for predicting Absentees at Company X

## ---- Filter
#* Log system time, request method and HTTP user agent of the incoming request
#* @filter logger
function(req){
  cat(as.character(Sys.time()), "-",
      req$REQUEST_METHOD, req$PATH_INFO, "-",
      req$HTTP_USER_AGENT, "@", req$REMOTE_ADDR, "\n")
  forward()
}


## ---- Endpoint
#* Prediction from input data
#* @post /predict
function(req, res) {

  # Retrieve new data as json. tryCatch to return null
  new_data <- tryCatch(jsonlite::parse_json(req$postBody, simplifyVector = TRUE),
                   error = function(e) NULL)
  
  # No Data or Bad data will return status code 400
  if (is.null(data)) {
    res$status <- 400
    return(list(error = "No Data or Bad Data"))
  }
  
  # Predict Hours absent
  predict(p_mod, new_data)
}

