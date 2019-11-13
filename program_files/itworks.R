
library(plumber)
url <- "https://raw.githubusercontent.com/tykiww/plumber_use/master/program_files/plumber.R"
download.file(url,"plumber.R")
r <- plumb(file = "plumber.R")  # Where 'plumber.R' is the location of the file shown above
r$run(port=8000)


# http://localhost:8000/plot
# http://localhost:8000/echo?msg=hello
