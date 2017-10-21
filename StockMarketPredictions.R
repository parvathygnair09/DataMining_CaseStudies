## Project : Stock Market Predictions
## Explore and learn data import from MySQL and time series data analysis with R
## Date Created : 10/20/2017
## ==============================================================================

library(DBI)
library(RMySQL)
drv <- dbDriver("MySQL")
#ch <- dbConnect(drv, dbname = "Projects","root","KunjuPraghu2019")
ch <- dbConnect(dbDriver("MySQL"), user="root", password="KunjuPraghu2019", dbname="Projects", host="127.0.0.1", port=3306)

