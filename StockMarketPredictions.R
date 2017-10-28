## Project : Stock Market Predictions
## Explore and learn data import from MySQL and time series data analysis with R
## this case study is taken from the book "Data Ming With R - Learning with Case Studies" by Luis Torgo
## Date Created : 10/20/2017
## =====================================================================================================

rm(list = ls(all = TRUE))
source("requirements.R")

## Automatic Stock Trading Systems - Data is daily stock quotes data for predicting the future returns of the S&P 500 market index.

## Load the necessary packages
library(DBI)
library(RMySQL)

library(zoo)
library(xts)   ## Packages for time series data analysis

## Create connection to MySQL
ch <- dbConnect(dbDriver("MySQL"), user = user, password = password, dbname = dbname, host = host, port = port)

## Extract the data table
allQuotes <- dbGetQuery(ch, "SELECT * FROM gspc" )
GSPC <- xts(allQuotes[,-1],order.by=as.Date(allQuotes[,1]))
head(GSPC)
str(GSPC)

summary(GSPC)


