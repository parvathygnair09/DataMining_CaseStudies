## Project : Stock Market Predictions
## Explore and learn data import from MySQL and time series data analysis with R
## This case study is taken from the book "Data Ming With R - Learning with Case Studies" by Luis Torgo
## Date Created : 10/20/2017
## =====================================================================================================

rm(list = ls(all = TRUE))
source("requirements.R")

## Automatic Stock Trading Systems - Data is daily stock quotes data for predicting the future returns of the S&P 500 market index.

## Load the necessary packages
library(DBI)
library(RMySQL) ## Packages to connect to MySQL

library(quantmod)
library(zoo)
library(xts)   ## Packages for time series data analysis

## Create connection to MySQL
ch <- dbConnect(dbDriver("MySQL"), user = user, password = password, dbname = dbname, host = host, port = port)

## Extract the data table - GSPC is the ticker ID for S&P 500 at Yahoo Finance
allQuotes <- dbGetQuery(ch, "SELECT * FROM gspc" )
GSPC <- xts(allQuotes[,-1],order.by=as.Date(allQuotes[,1]))   ## constructing a time series object
head(GSPC)
summary(GSPC)

## Data from 1970 to 2009

dbDisconnect(ch)

## Next create an indicator variable to capture the variations in average daily prices of the stock.
T.ind <- function(quotes, tgt.margin = 0.025, n.days = 10) {
        v <<- apply(HLC(quotes), 1, mean)  ## daily average price
        r <- matrix(NA, ncol = n.days, nrow = NROW(quotes))  ## define matrix to store variations
        for (x in 1:n.days) 
                r[, x] <- Next(Delt(v, k = x), x)   ## 
        x <- apply(r, 1, function(x) sum(x[x > tgt.margin | x < -tgt.margin]))
        if (is.xts(quotes))
                xts(x, time(quotes))
        else x
}

test <- T.ind(GSPC)

candleChart(last(GSPC, "3 months"), theme = "white", TA = NULL)
avgPrice <- function(p) apply(HLC(p), 1, mean)
addAvgPrice <- newTA(FUN = avgPrice, col = 1, legend = "AvgPrice")
addT.ind <- newTA(FUN = T.ind, col = "red", legend = "tgtRet")
addAvgPrice(on = 1)
addT.ind()
