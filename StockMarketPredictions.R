## Project : Stock Market Predictions
## Explore and learn data import from MySQL and time series data analysis with R
## this case study is taken from the book "Data Ming With R - Learning with Case Studies" by Luis Torgo
## Date Created : 10/20/2017
## =====================================================================================================

source("requirements.R")
library(DBI)
library(RMySQL)

drv <- dbDriver("MySQL")
ch <- dbConnect(dbDriver("MySQL"), user = user, password = password, dbname = dbname, host = host, port = port)

