rm(list=ls(all=T))
library(quadprog)

##function
##I add the last line of function rf_mvp_wx to add the weight of risk free asset into consider
source("D:/大學作業/大四下/財務金融資訊分析/Final Project/function_FDA.R")

##read data
data_1101<-read.table("D:/大學作業/大四下/財務金融資訊分析/Final Project/1101.TW.csv"
                      , sep=",", na.strings="null", header=T)
data_1216<-read.table("D:/大學作業/大四下/財務金融資訊分析/Final Project/1216.TW.csv"
                      , sep=",", na.strings="null", header=T)
data_1303<-read.table("D:/大學作業/大四下/財務金融資訊分析/Final Project/1303.TW.csv"
                      , sep=",", na.strings="null", header=T)
data_1434<-read.table("D:/大學作業/大四下/財務金融資訊分析/Final Project/1434.TW.csv"
                      , sep=",", na.strings="null", header=T)
data_1504<-read.table("D:/大學作業/大四下/財務金融資訊分析/Final Project/1504.TW.csv"
                      , sep=",", na.strings="null", header=T)
data_1612<-read.table("D:/大學作業/大四下/財務金融資訊分析/Final Project/1612.TW.csv"
                      , sep=",", na.strings="null", header=T)
data_1732<-read.table("D:/大學作業/大四下/財務金融資訊分析/Final Project/1732.TW.csv"
                      , sep=",", na.strings="null", header=T)
data_1734<-read.table("D:/大學作業/大四下/財務金融資訊分析/Final Project/1734.TW.csv"
                      , sep=",", na.strings="null", header=T)
data_1810<-read.table("D:/大學作業/大四下/財務金融資訊分析/Final Project/1810.TW.csv"
                      , sep=",", na.strings="null", header=T)
data_1909<-read.table("D:/大學作業/大四下/財務金融資訊分析/Final Project/1909.TW.csv"
                      , sep=",", na.strings="null", header=T)
data_2002<-read.table("D:/大學作業/大四下/財務金融資訊分析/Final Project/2002.TW.csv"
                      , sep=",", na.strings="null", header=T)
data_2105<-read.table("D:/大學作業/大四下/財務金融資訊分析/Final Project/2105.TW.csv"
                      , sep=",", na.strings="null", header=T)
data_2201<-read.table("D:/大學作業/大四下/財務金融資訊分析/Final Project/2201.TW.csv"
                      , sep=",", na.strings="null", header=T)
data_2317<-read.table("D:/大學作業/大四下/財務金融資訊分析/Final Project/2317.TW.csv"
                      , sep=",", na.strings="null", header=T)
data_2330<-read.table("D:/大學作業/大四下/財務金融資訊分析/Final Project/2330.TW.csv"
                      , sep=",", na.strings="null", header=T)
data_2357<-read.table("D:/大學作業/大四下/財務金融資訊分析/Final Project/2357.TW.csv"
                      , sep=",", na.strings="null", header=T)
data_2412<-read.table("D:/大學作業/大四下/財務金融資訊分析/Final Project/2412.TW.csv"
                      , sep=",", na.strings="null", header=T)
data_2430<-read.table("D:/大學作業/大四下/財務金融資訊分析/Final Project/2430.TW.csv"
                      , sep=",", na.strings="null", header=T)
data_2480<-read.table("D:/大學作業/大四下/財務金融資訊分析/Final Project/2480.TW.csv"
                      , sep=",", na.strings="null", header=T)
data_2505<-read.table("D:/大學作業/大四下/財務金融資訊分析/Final Project/2505.TW.csv"
                      , sep=",", na.strings="null", header=T)
data_2603<-read.table("D:/大學作業/大四下/財務金融資訊分析/Final Project/2603.TW.csv"
                      , sep=",", na.strings="null", header=T)
data_2614<-read.table("D:/大學作業/大四下/財務金融資訊分析/Final Project/2614.TW.csv"
                      , sep=",", na.strings="null", header=T)
data_2731<-read.table("D:/大學作業/大四下/財務金融資訊分析/Final Project/2731.TW.csv"
                      , sep=",", na.strings="null", header=T)
data_2884<-read.table("D:/大學作業/大四下/財務金融資訊分析/Final Project/2884.TW.csv"
                      , sep=",", na.strings="null", header=T)
data_3481<-read.table("D:/大學作業/大四下/財務金融資訊分析/Final Project/3481.TW.csv"
                      , sep=",", na.strings="null", header=T)
data_6505<-read.table("D:/大學作業/大四下/財務金融資訊分析/Final Project/6505.TW.csv"
                      , sep=",", na.strings="null", header=T)
data_8039<-read.table("D:/大學作業/大四下/財務金融資訊分析/Final Project/8039.TW.csv"
                      , sep=",", na.strings="null", header=T)

##remove NA
data_1101<-data_1101[complete.cases(data_1101),]
data_1216<-data_1216[complete.cases(data_1216),]
data_1303<-data_1303[complete.cases(data_1303),]
data_1434<-data_1434[complete.cases(data_1434),]
data_1504<-data_1504[complete.cases(data_1504),]
data_1612<-data_1612[complete.cases(data_1612),]
data_1732<-data_1732[complete.cases(data_1732),]
data_1734<-data_1734[complete.cases(data_1734),]
data_1810<-data_1810[complete.cases(data_1810),]
data_1909<-data_1909[complete.cases(data_1909),]
data_2002<-data_2002[complete.cases(data_2002),]
data_2105<-data_2105[complete.cases(data_2105),]
data_2201<-data_2201[complete.cases(data_2201),]
data_2317<-data_2317[complete.cases(data_2317),]
data_2330<-data_2330[complete.cases(data_2330),]
data_2357<-data_2357[complete.cases(data_2357),]
data_2412<-data_2412[complete.cases(data_2412),]
data_2430<-data_2430[complete.cases(data_2430),]
data_2480<-data_2480[complete.cases(data_2480),]
data_2505<-data_2505[complete.cases(data_2505),]
data_2603<-data_2603[complete.cases(data_2603),]
data_2614<-data_2614[complete.cases(data_2614),]
data_2731<-data_2731[complete.cases(data_2731),]
data_2884<-data_2884[complete.cases(data_2884),]
data_3481<-data_3481[complete.cases(data_3481),]
data_6505<-data_6505[complete.cases(data_6505),]
data_8039<-data_8039[complete.cases(data_8039),]

##convert date type
data_1101$Date<-as.Date(data_1101$Date)
data_1216$Date<-as.Date(data_1216$Date)
data_1303$Date<-as.Date(data_1303$Date)
data_1434$Date<-as.Date(data_1434$Date)
data_1504$Date<-as.Date(data_1504$Date)
data_1612$Date<-as.Date(data_1612$Date)
data_1732$Date<-as.Date(data_1732$Date)
data_1734$Date<-as.Date(data_1734$Date)
data_1810$Date<-as.Date(data_1810$Date)
data_1909$Date<-as.Date(data_1909$Date)
data_2002$Date<-as.Date(data_2002$Date)
data_2105$Date<-as.Date(data_2105$Date)
data_2201$Date<-as.Date(data_2201$Date)
data_2317$Date<-as.Date(data_2317$Date)
data_2330$Date<-as.Date(data_2330$Date)
data_2357$Date<-as.Date(data_2357$Date)
data_2412$Date<-as.Date(data_2412$Date)
data_2430$Date<-as.Date(data_2430$Date)
data_2480$Date<-as.Date(data_2480$Date)
data_2505$Date<-as.Date(data_2505$Date)
data_2603$Date<-as.Date(data_2603$Date)
data_2614$Date<-as.Date(data_2614$Date)
data_2731$Date<-as.Date(data_2731$Date)
data_2884$Date<-as.Date(data_2884$Date)
data_3481$Date<-as.Date(data_3481$Date)
data_6505$Date<-as.Date(data_6505$Date)
data_8039$Date<-as.Date(data_8039$Date)

##calculate return (as percentage)
data_1101$ret<-c(NA, retx(as.numeric(data_1101$Adj.Close))*100)
data_1216$ret<-c(NA, retx(as.numeric(data_1216$Adj.Close))*100)
data_1303$ret<-c(NA, retx(as.numeric(data_1303$Adj.Close))*100)
data_1434$ret<-c(NA, retx(as.numeric(data_1434$Adj.Close))*100)
data_1504$ret<-c(NA, retx(as.numeric(data_1504$Adj.Close))*100)
data_1612$ret<-c(NA, retx(as.numeric(data_1612$Adj.Close))*100)
data_1732$ret<-c(NA, retx(as.numeric(data_1732$Adj.Close))*100)
data_1734$ret<-c(NA, retx(as.numeric(data_1734$Adj.Close))*100)
data_1810$ret<-c(NA, retx(as.numeric(data_1810$Adj.Close))*100)
data_1909$ret<-c(NA, retx(as.numeric(data_1909$Adj.Close))*100)
data_2002$ret<-c(NA, retx(as.numeric(data_2002$Adj.Close))*100)
data_2105$ret<-c(NA, retx(as.numeric(data_2105$Adj.Close))*100)
data_2201$ret<-c(NA, retx(as.numeric(data_2201$Adj.Close))*100)
data_2317$ret<-c(NA, retx(as.numeric(data_2317$Adj.Close))*100)
data_2330$ret<-c(NA, retx(as.numeric(data_2330$Adj.Close))*100)
data_2357$ret<-c(NA, retx(as.numeric(data_2357$Adj.Close))*100)
data_2412$ret<-c(NA, retx(as.numeric(data_2412$Adj.Close))*100)
data_2430$ret<-c(NA, retx(as.numeric(data_2430$Adj.Close))*100)
data_2480$ret<-c(NA, retx(as.numeric(data_2480$Adj.Close))*100)
data_2505$ret<-c(NA, retx(as.numeric(data_2505$Adj.Close))*100)
data_2603$ret<-c(NA, retx(as.numeric(data_2603$Adj.Close))*100)
data_2614$ret<-c(NA, retx(as.numeric(data_2614$Adj.Close))*100)
data_2731$ret<-c(NA, retx(as.numeric(data_2731$Adj.Close))*100)
data_2884$ret<-c(NA, retx(as.numeric(data_2884$Adj.Close))*100)
data_3481$ret<-c(NA, retx(as.numeric(data_3481$Adj.Close))*100)
data_6505$ret<-c(NA, retx(as.numeric(data_6505$Adj.Close))*100)
data_8039$ret<-c(NA, retx(as.numeric(data_8039$Adj.Close))*100)

##get data from 2015-01-01 to 2020-12-31
data_1101<-data_1101[data_1101$Date>="2015-01-01",]
data_1216<-data_1216[data_1216$Date>="2015-01-01",]
data_1303<-data_1303[data_1303$Date>="2015-01-01",]
data_1434<-data_1434[data_1434$Date>="2015-01-01",]
data_1504<-data_1504[data_1504$Date>="2015-01-01",]
data_1612<-data_1612[data_1612$Date>="2015-01-01",]
data_1732<-data_1732[data_1732$Date>="2015-01-01",]
data_1734<-data_1734[data_1734$Date>="2015-01-01",]
data_1810<-data_1810[data_1810$Date>="2015-01-01",]
data_1909<-data_1909[data_1909$Date>="2015-01-01",]
data_2002<-data_2002[data_2002$Date>="2015-01-01",]
data_2105<-data_2105[data_2105$Date>="2015-01-01",]
data_2201<-data_2201[data_2201$Date>="2015-01-01",]
data_2317<-data_2317[data_2317$Date>="2015-01-01",]
data_2330<-data_2330[data_2330$Date>="2015-01-01",]
data_2357<-data_2357[data_2357$Date>="2015-01-01",]
data_2412<-data_2412[data_2412$Date>="2015-01-01",]
data_2430<-data_2430[data_2430$Date>="2015-01-01",]
data_2480<-data_2480[data_2480$Date>="2015-01-01",]
data_2505<-data_2505[data_2505$Date>="2015-01-01",]
data_2603<-data_2603[data_2603$Date>="2015-01-01",]
data_2614<-data_2614[data_2614$Date>="2015-01-01",]
data_2731<-data_2731[data_2731$Date>="2015-01-01",]
data_2884<-data_2884[data_2884$Date>="2015-01-01",]
data_3481<-data_3481[data_3481$Date>="2015-01-01",]
data_6505<-data_6505[data_6505$Date>="2015-01-01",]
data_8039<-data_8039[data_8039$Date>="2015-01-01",]

---------------------------------------------------------------------
##1101
##Time series plot of returns
windows(height=4, width=10)
plot(x=data_1101$Date, y=data_1101$ret, main="1101 returns (as percentage)", xlab="Date", ylab="Return(%)", type="l"
     , col=1)
##Time series plot of prices
windows(height=8, width=10)
plot(x=data_1101$Date, y=data_1101$Adj.Close, main="1101 prices", xlab="Date"
     , ylab="Adjusted close prices", type="l", lwd=2)
##Descriptive statistics of returns
result_ret_1101<-c(length(data_1101$ret), min(data_1101$ret), median(data_1101$ret), max(data_1101$ret),
                   mean(data_1101$ret), sd(data_1101$ret), my_skewness(data_1101$ret), my_kurtosis(data_1101$ret),
                   my_acf1(data_1101$ret))
result_ret_1101[2:8]<-result_ret_1101[2:8]*c(rep(252,4), sqrt(252), 1/sqrt(252), 1/252)
names(result_ret_1101)<-c("number of observations", "min", "median", "max", "mean", "std", "skewness"
                          , "kurtosis", "acf1")
result_ret_1101<-round(result_ret_1101, 3)
result_ret_1101

##1216
##Time series plot of returns
windows(height=4, width=10)
plot(x=data_1216$Date, y=data_1216$ret, main="1216 returns (as percentage)", xlab="Date", ylab="Return(%)", type="l"
     , col=2)
##Time series plot of prices
windows(height=8, width=10)
plot(x=data_1216$Date, y=data_1216$Adj.Close, main="1216 prices", xlab="Date"
     , ylab="Adjusted close prices", type="l", lwd=2)
##Descriptive statistics of returns
result_ret_1216<-c(length(data_1216$ret), min(data_1216$ret), median(data_1216$ret), max(data_1216$ret),
                   mean(data_1216$ret), sd(data_1216$ret), my_skewness(data_1216$ret), my_kurtosis(data_1216$ret),
                   my_acf1(data_1216$ret))
result_ret_1216[2:8]<-result_ret_1216[2:8]*c(rep(252,4), sqrt(252), 1/sqrt(252), 1/252)
names(result_ret_1216)<-c("number of observations", "min", "median", "max", "mean", "std", "skewness"
                          , "kurtosis", "acf1")
result_ret_1216<-round(result_ret_1216, 3)
result_ret_1216

##1303
##Time series plot of returns
windows(height=4, width=10)
plot(x=data_1303$Date, y=data_1303$ret, main="1303 returns (as percentage)", xlab="Date", ylab="Return(%)", type="l"
     , col=3)
##Time series plot of prices
windows(height=8, width=10)
plot(x=data_1303$Date, y=data_1303$Adj.Close, main="1303 prices", xlab="Date"
     , ylab="Adjusted close prices", type="l", lwd=2)
##Descriptive statistics of returns
result_ret_1303<-c(length(data_1303$ret), min(data_1303$ret), median(data_1303$ret), max(data_1303$ret),
                   mean(data_1303$ret), sd(data_1303$ret), my_skewness(data_1303$ret), my_kurtosis(data_1303$ret),
                   my_acf1(data_1303$ret))
result_ret_1303[2:8]<-result_ret_1303[2:8]*c(rep(252,4), sqrt(252), 1/sqrt(252), 1/252)
names(result_ret_1303)<-c("number of observations", "min", "median", "max", "mean", "std", "skewness"
                          , "kurtosis", "acf1")
result_ret_1303<-round(result_ret_1303, 3)
result_ret_1303

##1434
##Time series plot of returns
windows(height=4, width=10)
plot(x=data_1434$Date, y=data_1434$ret, main="1434 returns (as percentage)", xlab="Date", ylab="Return(%)", type="l"
     , col=4)
##Time series plot of prices
windows(height=8, width=10)
plot(x=data_1434$Date, y=data_1434$Adj.Close, main="1434 prices", xlab="Date"
     , ylab="Adjusted close prices", type="l", lwd=2)
##Descriptive statistics of returns
result_ret_1434<-c(length(data_1434$ret), min(data_1434$ret), median(data_1434$ret), max(data_1434$ret),
                   mean(data_1434$ret), sd(data_1434$ret), my_skewness(data_1434$ret), my_kurtosis(data_1434$ret),
                   my_acf1(data_1434$ret))
result_ret_1434[2:8]<-result_ret_1434[2:8]*c(rep(252,4), sqrt(252), 1/sqrt(252), 1/252)
names(result_ret_1434)<-c("number of observations", "min", "median", "max", "mean", "std", "skewness"
                          , "kurtosis", "acf1")
result_ret_1434<-round(result_ret_1434, 3)
result_ret_1434

##1504
##Time series plot of returns
windows(height=4, width=10)
plot(x=data_1504$Date, y=data_1504$ret, main="1504 returns (as percentage)", xlab="Date", ylab="Return(%)", type="l"
     , col=5)
##Time series plot of prices
windows(height=8, width=10)
plot(x=data_1504$Date, y=data_1504$Adj.Close, main="1504 prices", xlab="Date"
     , ylab="Adjusted close prices", type="l", lwd=2)
##Descriptive statistics of returns
result_ret_1504<-c(length(data_1504$ret), min(data_1504$ret), median(data_1504$ret), max(data_1504$ret),
                   mean(data_1504$ret), sd(data_1504$ret), my_skewness(data_1504$ret), my_kurtosis(data_1504$ret),
                   my_acf1(data_1504$ret))
result_ret_1504[2:8]<-result_ret_1504[2:8]*c(rep(252,4), sqrt(252), 1/sqrt(252), 1/252)
names(result_ret_1504)<-c("number of observations", "min", "median", "max", "mean", "std", "skewness"
                          , "kurtosis", "acf1")
result_ret_1504<-round(result_ret_1504, 3)
result_ret_1504

##1612
##Time series plot of returns
windows(height=4, width=10)
plot(x=data_1612$Date, y=data_1612$ret, main="1612 returns (as percentage)", xlab="Date", ylab="Return(%)", type="l"
     , col=6)
##Time series plot of prices
windows(height=8, width=10)
plot(x=data_1612$Date, y=data_1612$Adj.Close, main="1612 prices", xlab="Date"
     , ylab="Adjusted close prices", type="l", lwd=2)
##Descriptive statistics of returns
result_ret_1612<-c(length(data_1612$ret), min(data_1612$ret), median(data_1612$ret), max(data_1612$ret),
                   mean(data_1612$ret), sd(data_1612$ret), my_skewness(data_1612$ret), my_kurtosis(data_1612$ret),
                   my_acf1(data_1612$ret))
result_ret_1612[2:8]<-result_ret_1612[2:8]*c(rep(252,4), sqrt(252), 1/sqrt(252), 1/252)
names(result_ret_1612)<-c("number of observations", "min", "median", "max", "mean", "std", "skewness"
                          , "kurtosis", "acf1")
result_ret_1612<-round(result_ret_1612, 3)
result_ret_1612

##1732
##Time series plot of returns
windows(height=4, width=10)
plot(x=data_1732$Date, y=data_1732$ret, main="1732 returns (as percentage)", xlab="Date", ylab="Return(%)", type="l"
     , col=7)
##Time series plot of prices
windows(height=8, width=10)
plot(x=data_1732$Date, y=data_1732$Adj.Close, main="1732 prices", xlab="Date"
     , ylab="Adjusted close prices", type="l", lwd=2)
##Descriptive statistics of returns
result_ret_1732<-c(length(data_1732$ret), min(data_1732$ret), median(data_1732$ret), max(data_1732$ret),
                   mean(data_1732$ret), sd(data_1732$ret), my_skewness(data_1732$ret), my_kurtosis(data_1732$ret),
                   my_acf1(data_1732$ret))
result_ret_1732[2:8]<-result_ret_1732[2:8]*c(rep(252,4), sqrt(252), 1/sqrt(252), 1/252)
names(result_ret_1732)<-c("number of observations", "min", "median", "max", "mean", "std", "skewness"
                          , "kurtosis", "acf1")
result_ret_1732<-round(result_ret_1732, 3)
result_ret_1732

##1734
##Time series plot of returns
windows(height=4, width=10)
plot(x=data_1734$Date, y=data_1734$ret, main="1734 returns (as percentage)", xlab="Date", ylab="Return(%)", type="l"
     , col=8)
##Time series plot of prices
windows(height=8, width=10)
plot(x=data_1734$Date, y=data_1734$Adj.Close, main="1734 prices", xlab="Date"
     , ylab="Adjusted close prices", type="l", lwd=2)
##Descriptive statistics of returns
result_ret_1734<-c(length(data_1734$ret), min(data_1734$ret), median(data_1734$ret), max(data_1734$ret),
                   mean(data_1734$ret), sd(data_1734$ret), my_skewness(data_1734$ret), my_kurtosis(data_1734$ret),
                   my_acf1(data_1734$ret))
result_ret_1734[2:8]<-result_ret_1734[2:8]*c(rep(252,4), sqrt(252), 1/sqrt(252), 1/252)
names(result_ret_1734)<-c("number of observations", "min", "median", "max", "mean", "std", "skewness"
                          , "kurtosis", "acf1")
result_ret_1734<-round(result_ret_1734, 3)
result_ret_1734

##1810
##Time series plot of returns
windows(height=4, width=10)
plot(x=data_1810$Date, y=data_1810$ret, main="1810 returns (as percentage)", xlab="Date", ylab="Return(%)", type="l"
     , col=1)
##Time series plot of prices
windows(height=8, width=10)
plot(x=data_1810$Date, y=data_1810$Adj.Close, main="1818 prices", xlab="Date"
     , ylab="Adjusted close prices", type="l", lwd=2)
##Descriptive statistics of returns
result_ret_1810<-c(length(data_1810$ret), min(data_1810$ret), median(data_1810$ret), max(data_1810$ret),
                   mean(data_1810$ret), sd(data_1810$ret), my_skewness(data_1810$ret), my_kurtosis(data_1810$ret),
                   my_acf1(data_1810$ret))
result_ret_1810[2:8]<-result_ret_1810[2:8]*c(rep(252,4), sqrt(252), 1/sqrt(252), 1/252)
names(result_ret_1810)<-c("number of observations", "min", "median", "max", "mean", "std", "skewness"
                          , "kurtosis", "acf1")
result_ret_1810<-round(result_ret_1810, 3)
result_ret_1810

##1909
##Time series plot of returns
windows(height=4, width=10)
plot(x=data_1909$Date, y=data_1909$ret, main="1909 returns (as percentage)", xlab="Date", ylab="Return(%)", type="l"
     , col=2)
##Time series plot of prices
windows(height=8, width=10)
plot(x=data_1909$Date, y=data_1909$Adj.Close, main="1909 prices", xlab="Date"
     , ylab="Adjusted close prices", type="l", lwd=2)
##Descriptive statistics of returns
result_ret_1909<-c(length(data_1909$ret), min(data_1909$ret), median(data_1909$ret), max(data_1909$ret),
                   mean(data_1909$ret), sd(data_1909$ret), my_skewness(data_1909$ret), my_kurtosis(data_1909$ret),
                   my_acf1(data_1909$ret))
result_ret_1909[2:8]<-result_ret_1909[2:8]*c(rep(252,4), sqrt(252), 1/sqrt(252), 1/252)
names(result_ret_1909)<-c("number of observations", "min", "median", "max", "mean", "std", "skewness"
                          , "kurtosis", "acf1")
result_ret_1909<-round(result_ret_1909, 3)
result_ret_1909

##2002
##Time series plot of returns
windows(height=4, width=10)
plot(x=data_2002$Date, y=data_2002$ret, main="2002 returns (as percentage)", xlab="Date", ylab="Return(%)", type="l"
     , col=3)
##Time series plot of prices
windows(height=8, width=10)
plot(x=data_2002$Date, y=data_2002$Adj.Close, main="2002 prices", xlab="Date"
     , ylab="Adjusted close prices", type="l", lwd=2)
##Descriptive statistics of returns
result_ret_2002<-c(length(data_2002$ret), min(data_2002$ret), median(data_2002$ret), max(data_2002$ret),
                   mean(data_2002$ret), sd(data_2002$ret), my_skewness(data_2002$ret), my_kurtosis(data_2002$ret),
                   my_acf1(data_2002$ret))
result_ret_2002[2:8]<-result_ret_2002[2:8]*c(rep(252,4), sqrt(252), 1/sqrt(252), 1/252)
names(result_ret_2002)<-c("number of observations", "min", "median", "max", "mean", "std", "skewness"
                          , "kurtosis", "acf1")
result_ret_2002<-round(result_ret_2002, 3)
result_ret_2002

##2105
##Time series plot of returns
windows(height=4, width=10)
plot(x=data_2105$Date, y=data_2105$ret, main="2105 returns (as percentage)", xlab="Date", ylab="Return(%)", type="l"
     , col=4)
##Time series plot of prices
windows(height=8, width=10)
plot(x=data_2105$Date, y=data_2105$Adj.Close, main="2105 prices", xlab="Date"
     , ylab="Adjusted close prices", type="l", lwd=2)
##Descriptive statistics of returns
result_ret_2105<-c(length(data_2105$ret), min(data_2105$ret), median(data_2105$ret), max(data_2105$ret),
                   mean(data_2105$ret), sd(data_2105$ret), my_skewness(data_2105$ret), my_kurtosis(data_2105$ret),
                   my_acf1(data_2105$ret))
result_ret_2105[2:8]<-result_ret_2105[2:8]*c(rep(252,4), sqrt(252), 1/sqrt(252), 1/252)
names(result_ret_2105)<-c("number of observations", "min", "median", "max", "mean", "std", "skewness"
                          , "kurtosis", "acf1")
result_ret_2105<-round(result_ret_2105, 3)
result_ret_2105

##2201
##Time series plot of returns
windows(height=4, width=10)
plot(x=data_2201$Date, y=data_2201$ret, main="2201 returns (as percentage)", xlab="Date", ylab="Return(%)", type="l"
     , col=5)
##Time series plot of prices
windows(height=8, width=10)
plot(x=data_2201$Date, y=data_2201$Adj.Close, main="2201 prices", xlab="Date"
     , ylab="Adjusted close prices", type="l", lwd=2)
##Descriptive statistics of returns
result_ret_2201<-c(length(data_2201$ret), min(data_2201$ret), median(data_2201$ret), max(data_2201$ret),
                   mean(data_2201$ret), sd(data_2201$ret), my_skewness(data_2201$ret), my_kurtosis(data_2201$ret),
                   my_acf1(data_2201$ret))
result_ret_2201[2:8]<-result_ret_2201[2:8]*c(rep(252,4), sqrt(252), 1/sqrt(252), 1/252)
names(result_ret_2201)<-c("number of observations", "min", "median", "max", "mean", "std", "skewness"
                          , "kurtosis", "acf1")
result_ret_2201<-round(result_ret_2201, 3)
result_ret_2201

##2317
##Time series plot of returns
windows(height=4, width=10)
plot(x=data_2317$Date, y=data_2317$ret, main="2317 returns (as percentage)", xlab="Date", ylab="Return(%)", type="l"
     , col=6)
##Time series plot of prices
windows(height=8, width=10)
plot(x=data_2317$Date, y=data_2317$Adj.Close, main="2317 prices", xlab="Date"
     , ylab="Adjusted close prices", type="l", lwd=2)
##Descriptive statistics of returns
result_ret_2317<-c(length(data_2317$ret), min(data_2317$ret), median(data_2317$ret), max(data_2317$ret),
                   mean(data_2317$ret), sd(data_2317$ret), my_skewness(data_2317$ret), my_kurtosis(data_2317$ret),
                   my_acf1(data_2317$ret))
result_ret_2317[2:8]<-result_ret_2317[2:8]*c(rep(252,4), sqrt(252), 1/sqrt(252), 1/252)
names(result_ret_2317)<-c("number of observations", "min", "median", "max", "mean", "std", "skewness"
                          , "kurtosis", "acf1")
result_ret_2317<-round(result_ret_2317, 3)
result_ret_2317

##2330
##Time series plot of returns
windows(height=4, width=10)
plot(x=data_2330$Date, y=data_2330$ret, main="2330 returns (as percentage)", xlab="Date", ylab="Return(%)", type="l"
     , col=7)
##Time series plot of prices
windows(height=8, width=10)
plot(x=data_2330$Date, y=data_2330$Adj.Close, main="2330 prices", xlab="Date"
     , ylab="Adjusted close prices", type="l", lwd=2)
##Descriptive statistics of returns
result_ret_2330<-c(length(data_2330$ret), min(data_2330$ret), median(data_2330$ret), max(data_2330$ret),
                   mean(data_2330$ret), sd(data_2330$ret), my_skewness(data_2330$ret), my_kurtosis(data_2330$ret),
                   my_acf1(data_2330$ret))
result_ret_2330[2:8]<-result_ret_2330[2:8]*c(rep(252,4), sqrt(252), 1/sqrt(252), 1/252)
names(result_ret_2330)<-c("number of observations", "min", "median", "max", "mean", "std", "skewness"
                          , "kurtosis", "acf1")
result_ret_2330<-round(result_ret_2330, 3)
result_ret_2330

##2357
##Time series plot of returns
windows(height=4, width=10)
plot(x=data_2357$Date, y=data_2357$ret, main="2357 returns (as percentage)", xlab="Date", ylab="Return(%)", type="l"
     , col=8)
##Time series plot of prices
windows(height=8, width=10)
plot(x=data_2357$Date, y=data_2357$Adj.Close, main="2357 prices", xlab="Date"
     , ylab="Adjusted close prices", type="l", lwd=2)
##Descriptive statistics of returns
result_ret_2357<-c(length(data_2357$ret), min(data_2357$ret), median(data_2357$ret), max(data_2357$ret),
                   mean(data_2357$ret), sd(data_2357$ret), my_skewness(data_2357$ret), my_kurtosis(data_2357$ret),
                   my_acf1(data_2357$ret))
result_ret_2357[2:8]<-result_ret_2357[2:8]*c(rep(252,4), sqrt(252), 1/sqrt(252), 1/252)
names(result_ret_2357)<-c("number of observations", "min", "median", "max", "mean", "std", "skewness"
                          , "kurtosis", "acf1")
result_ret_2357<-round(result_ret_2357, 3)
result_ret_2357

##2412
##Time series plot of returns
windows(height=4, width=10)
plot(x=data_2412$Date, y=data_2412$ret, main="2412 returns (as percentage)", xlab="Date", ylab="Return(%)", type="l"
     , col=1)
##Time series plot of prices
windows(height=8, width=10)
plot(x=data_2412$Date, y=data_2412$Adj.Close, main="2412 prices", xlab="Date"
     , ylab="Adjusted close prices", type="l", lwd=2)
##Descriptive statistics of returns
result_ret_2412<-c(length(data_2412$ret), min(data_2412$ret), median(data_2412$ret), max(data_2412$ret),
                   mean(data_2412$ret), sd(data_2412$ret), my_skewness(data_2412$ret), my_kurtosis(data_2412$ret),
                   my_acf1(data_2412$ret))
result_ret_2412[2:8]<-result_ret_2412[2:8]*c(rep(252,4), sqrt(252), 1/sqrt(252), 1/252)
names(result_ret_2412)<-c("number of observations", "min", "median", "max", "mean", "std", "skewness"
                          , "kurtosis", "acf1")
result_ret_2412<-round(result_ret_2412, 3)
result_ret_2412

##2430
##Time series plot of returns
windows(height=4, width=10)
plot(x=data_2430$Date, y=data_2430$ret, main="2430 returns (as percentage)", xlab="Date", ylab="Return(%)", type="l"
     , col=2)
##Time series plot of prices
windows(height=8, width=10)
plot(x=data_2430$Date, y=data_2430$Adj.Close, main="2430 prices", xlab="Date"
     , ylab="Adjusted close prices", type="l", lwd=2)
##Descriptive statistics of returns
result_ret_2430<-c(length(data_2430$ret), min(data_2430$ret), median(data_2430$ret), max(data_2430$ret),
                   mean(data_2430$ret), sd(data_2430$ret), my_skewness(data_2430$ret), my_kurtosis(data_2430$ret),
                   my_acf1(data_2430$ret))
result_ret_2430[2:8]<-result_ret_2430[2:8]*c(rep(252,4), sqrt(252), 1/sqrt(252), 1/252)
names(result_ret_2430)<-c("number of observations", "min", "median", "max", "mean", "std", "skewness"
                          , "kurtosis", "acf1")
result_ret_2430<-round(result_ret_2430, 3)
result_ret_2430

##2480
##Time series plot of returns
windows(height=4, width=10)
plot(x=data_2480$Date, y=data_2480$ret, main="2480 returns (as percentage)", xlab="Date", ylab="Return(%)", type="l"
     , col=3)
##Time series plot of prices
windows(height=8, width=10)
plot(x=data_2480$Date, y=data_2480$Adj.Close, main="2480 prices", xlab="Date"
     , ylab="Adjusted close prices", type="l", lwd=2)
##Descriptive statistics of returns
result_ret_2480<-c(length(data_2480$ret), min(data_2480$ret), median(data_2480$ret), max(data_2480$ret),
                   mean(data_2480$ret), sd(data_2480$ret), my_skewness(data_2480$ret), my_kurtosis(data_2480$ret),
                   my_acf1(data_2480$ret))
result_ret_2480[2:8]<-result_ret_2480[2:8]*c(rep(252,4), sqrt(252), 1/sqrt(252), 1/252)
names(result_ret_2480)<-c("number of observations", "min", "median", "max", "mean", "std", "skewness"
                          , "kurtosis", "acf1")
result_ret_2480<-round(result_ret_2480, 3)
result_ret_2480

##2505
##Time series plot of returns
windows(height=4, width=10)
plot(x=data_2505$Date, y=data_2505$ret, main="2505 returns (as percentage)", xlab="Date", ylab="Return(%)", type="l"
     , col=4)
##Time series plot of prices
windows(height=8, width=10)
plot(x=data_2505$Date, y=data_2505$Adj.Close, main="2505 prices", xlab="Date"
     , ylab="Adjusted close prices", type="l", lwd=2)
##Descriptive statistics of returns
result_ret_2505<-c(length(data_2505$ret), min(data_2505$ret), median(data_2505$ret), max(data_2505$ret),
                   mean(data_2505$ret), sd(data_2505$ret), my_skewness(data_2505$ret), my_kurtosis(data_2505$ret),
                   my_acf1(data_2505$ret))
result_ret_2505[2:8]<-result_ret_2505[2:8]*c(rep(252,4), sqrt(252), 1/sqrt(252), 1/252)
names(result_ret_2505)<-c("number of observations", "min", "median", "max", "mean", "std", "skewness"
                          , "kurtosis", "acf1")
result_ret_2505<-round(result_ret_2505, 3)
result_ret_2505

##2603
##Time series plot of returns
windows(height=4, width=10)
plot(x=data_2603$Date, y=data_2603$ret, main="2603 returns (as percentage)", xlab="Date", ylab="Return(%)", type="l"
     , col=5)
##Time series plot of prices
windows(height=8, width=10)
plot(x=data_2603$Date, y=data_2603$Adj.Close, main="2603 prices", xlab="Date"
     , ylab="Adjusted close prices", type="l", lwd=2)
##Descriptive statistics of returns
result_ret_2603<-c(length(data_2603$ret), min(data_2603$ret), median(data_2603$ret), max(data_2603$ret),
                   mean(data_2603$ret), sd(data_2603$ret), my_skewness(data_2603$ret), my_kurtosis(data_2603$ret),
                   my_acf1(data_2603$ret))
result_ret_2603[2:8]<-result_ret_2603[2:8]*c(rep(252,4), sqrt(252), 1/sqrt(252), 1/252)
names(result_ret_2603)<-c("number of observations", "min", "median", "max", "mean", "std", "skewness"
                          , "kurtosis", "acf1")
result_ret_2603<-round(result_ret_2603, 3)
result_ret_2603

##2614
##Time series plot of returns
windows(height=4, width=10)
plot(x=data_2614$Date, y=data_2614$ret, main="2614 returns (as percentage)", xlab="Date", ylab="Return(%)", type="l"
     , col=6)
##Time series plot of prices
windows(height=8, width=10)
plot(x=data_2614$Date, y=data_2614$Adj.Close, main="2614 prices", xlab="Date"
     , ylab="Adjusted close prices", type="l", lwd=2)
##Descriptive statistics of returns
result_ret_2614<-c(length(data_2614$ret), min(data_2614$ret), median(data_2614$ret), max(data_2614$ret),
                   mean(data_2614$ret), sd(data_2614$ret), my_skewness(data_2614$ret), my_kurtosis(data_2614$ret),
                   my_acf1(data_2614$ret))
result_ret_2614[2:8]<-result_ret_2614[2:8]*c(rep(252,4), sqrt(252), 1/sqrt(252), 1/252)
names(result_ret_2614)<-c("number of observations", "min", "median", "max", "mean", "std", "skewness"
                          , "kurtosis", "acf1")
result_ret_2614<-round(result_ret_2614, 3)
result_ret_2614

##2731
##Time series plot of returns
windows(height=4, width=10)
plot(x=data_2731$Date, y=data_2731$ret, main="2731 returns (as percentage)", xlab="Date", ylab="Return(%)", type="l"
     , col=7)
##Time series plot of prices
windows(height=8, width=10)
plot(x=data_2731$Date, y=data_2731$Adj.Close, main="2731 prices", xlab="Date"
     , ylab="Adjusted close prices", type="l", lwd=2)
##Descriptive statistics of returns
result_ret_2731<-c(length(data_2731$ret), min(data_2731$ret), median(data_2731$ret), max(data_2731$ret),
                   mean(data_2731$ret), sd(data_2731$ret), my_skewness(data_2731$ret), my_kurtosis(data_2731$ret),
                   my_acf1(data_2731$ret))
result_ret_2731[2:8]<-result_ret_2731[2:8]*c(rep(252,4), sqrt(252), 1/sqrt(252), 1/252)
names(result_ret_2731)<-c("number of observations", "min", "median", "max", "mean", "std", "skewness"
                          , "kurtosis", "acf1")
result_ret_2731<-round(result_ret_2731, 3)
result_ret_2731

##2884
##Time series plot of returns
windows(height=4, width=10)
plot(x=data_2884$Date, y=data_2884$ret, main="2884 returns (as percentage)", xlab="Date", ylab="Return(%)", type="l"
     , col=8)
##Time series plot of prices
windows(height=8, width=10)
plot(x=data_2884$Date, y=data_2884$Adj.Close, main="2884 prices", xlab="Date"
     , ylab="Adjusted close prices", type="l", lwd=2)
##Descriptive statistics of returns
result_ret_2884<-c(length(data_2884$ret), min(data_2884$ret), median(data_2884$ret), max(data_2884$ret),
                   mean(data_2884$ret), sd(data_2884$ret), my_skewness(data_2884$ret), my_kurtosis(data_2884$ret),
                   my_acf1(data_2884$ret))
result_ret_2884[2:8]<-result_ret_2884[2:8]*c(rep(252,4), sqrt(252), 1/sqrt(252), 1/252)
names(result_ret_2884)<-c("number of observations", "min", "median", "max", "mean", "std", "skewness"
                          , "kurtosis", "acf1")
result_ret_2884<-round(result_ret_2884, 3)
result_ret_2884

##3481
##Time series plot of returns
windows(height=4, width=10)
plot(x=data_3481$Date, y=data_3481$ret, main="3481 returns (as percentage)", xlab="Date", ylab="Return(%)", type="l"
     , col=1)
##Time series plot of prices
windows(height=8, width=10)
plot(x=data_3481$Date, y=data_3481$Adj.Close, main="3481 prices", xlab="Date"
     , ylab="Adjusted close prices", type="l", lwd=2)
##Descriptive statistics of returns
result_ret_3481<-c(length(data_3481$ret), min(data_3481$ret), median(data_3481$ret), max(data_3481$ret),
                   mean(data_3481$ret), sd(data_3481$ret), my_skewness(data_3481$ret), my_kurtosis(data_3481$ret),
                   my_acf1(data_3481$ret))
result_ret_3481[2:8]<-result_ret_3481[2:8]*c(rep(252,4), sqrt(252), 1/sqrt(252), 1/252)
names(result_ret_3481)<-c("number of observations", "min", "median", "max", "mean", "std", "skewness"
                          , "kurtosis", "acf1")
result_ret_3481<-round(result_ret_3481, 3)
result_ret_3481

##6505
##Time series plot of returns
windows(height=4, width=10)
plot(x=data_6505$Date, y=data_6505$ret, main="6505 returns (as percentage)", xlab="Date", ylab="Return(%)", type="l"
     , col=2)
##Time series plot of prices
windows(height=8, width=10)
plot(x=data_6505$Date, y=data_6505$Adj.Close, main="1101 prices", xlab="Date"
     , ylab="Adjusted close prices", type="l", lwd=2)
##Descriptive statistics of returns
result_ret_6505<-c(length(data_6505$ret), min(data_6505$ret), median(data_6505$ret), max(data_6505$ret),
                   mean(data_6505$ret), sd(data_6505$ret), my_skewness(data_6505$ret), my_kurtosis(data_6505$ret),
                   my_acf1(data_6505$ret))
result_ret_6505[2:8]<-result_ret_6505[2:8]*c(rep(252,4), sqrt(252), 1/sqrt(252), 1/252)
names(result_ret_6505)<-c("number of observations", "min", "median", "max", "mean", "std", "skewness"
                          , "kurtosis", "acf1")
result_ret_6505<-round(result_ret_6505, 3)
result_ret_6505

##8039
##Time series plot of returns
windows(height=4, width=10)
plot(x=data_8039$Date, y=data_8039$ret, main="8039 returns (as percentage)", xlab="Date", ylab="Return(%)", type="l"
     , col=3)
##Time series plot of prices
windows(height=8, width=10)
plot(x=data_8039$Date, y=data_8039$Adj.Close, main="8039 prices", xlab="Date"
     , ylab="Adjusted close prices", type="l", lwd=2)
##Descriptive statistics of returns
result_ret_8039<-c(length(data_8039$ret), min(data_8039$ret), median(data_8039$ret), max(data_8039$ret),
                   mean(data_8039$ret), sd(data_8039$ret), my_skewness(data_8039$ret), my_kurtosis(data_8039$ret),
                   my_acf1(data_8039$ret))
result_ret_8039[2:8]<-result_ret_8039[2:8]*c(rep(252,4), sqrt(252), 1/sqrt(252), 1/252)
names(result_ret_8039)<-c("number of observations", "min", "median", "max", "mean", "std", "skewness"
                          , "kurtosis", "acf1")
result_ret_8039<-round(result_ret_8039, 3)
result_ret_8039

------------------------------------------------------
##cumulative gross return compare
data_1101$cum.ret<-cumprod(1+(data_1101$ret/100))
data_1216$cum.ret<-cumprod(1+(data_1216$ret/100))
data_1303$cum.ret<-cumprod(1+(data_1303$ret/100))
data_1434$cum.ret<-cumprod(1+(data_1434$ret/100))
data_1504$cum.ret<-cumprod(1+(data_1504$ret/100))
data_1612$cum.ret<-cumprod(1+(data_1612$ret/100))
data_1732$cum.ret<-cumprod(1+(data_1732$ret/100))
data_1734$cum.ret<-cumprod(1+(data_1734$ret/100))
data_1810$cum.ret<-cumprod(1+(data_1810$ret/100))
data_1909$cum.ret<-cumprod(1+(data_1909$ret/100))
data_2002$cum.ret<-cumprod(1+(data_2002$ret/100))
data_2105$cum.ret<-cumprod(1+(data_2105$ret/100))
data_2201$cum.ret<-cumprod(1+(data_2201$ret/100))
data_2317$cum.ret<-cumprod(1+(data_2317$ret/100))
data_2330$cum.ret<-cumprod(1+(data_2330$ret/100))
data_2357$cum.ret<-cumprod(1+(data_2357$ret/100))
data_2412$cum.ret<-cumprod(1+(data_2412$ret/100))
data_2430$cum.ret<-cumprod(1+(data_2430$ret/100))
data_2480$cum.ret<-cumprod(1+(data_2480$ret/100))
data_2505$cum.ret<-cumprod(1+(data_2505$ret/100))
data_2603$cum.ret<-cumprod(1+(data_2603$ret/100))
data_2614$cum.ret<-cumprod(1+(data_2614$ret/100))
data_2731$cum.ret<-cumprod(1+(data_2731$ret/100))
data_2884$cum.ret<-cumprod(1+(data_2884$ret/100))
data_3481$cum.ret<-cumprod(1+(data_3481$ret/100))
data_6505$cum.ret<-cumprod(1+(data_6505$ret/100))
data_8039$cum.ret<-cumprod(1+(data_8039$ret/100))

y.range<-c(min(data_1101$cum.ret, data_1216$cum.ret, data_1303$cum.ret, data_1434$cum.ret, data_1504$cum.ret
               , data_1612$cum.ret, data_1732$cum.ret, data_1734$cum.ret, data_1810$cum.ret, data_1909$cum.ret
               , data_2002$cum.ret, data_2105$cum.ret, data_2201$cum.ret, data_2317$cum.ret, data_2330$cum.ret
               , data_2357$cum.ret, data_2412$cum.ret, data_2430$cum.ret, data_2480$cum.ret, data_2505$cum.ret
               , data_2603$cum.ret, data_2614$cum.ret, data_2731$cum.ret, data_2884$cum.ret, data_3481$cum.ret
               , data_6505$cum.ret, data_8039$cum.ret)
           , max(data_1101$cum.ret, data_1216$cum.ret, data_1303$cum.ret, data_1434$cum.ret, data_1504$cum.ret
                 , data_1612$cum.ret, data_1732$cum.ret, data_1734$cum.ret, data_1810$cum.ret, data_1909$cum.ret
                 , data_2002$cum.ret, data_2105$cum.ret, data_2201$cum.ret, data_2317$cum.ret, data_2330$cum.ret
                 , data_2357$cum.ret, data_2412$cum.ret, data_2430$cum.ret, data_2480$cum.ret, data_2505$cum.ret
                 , data_2603$cum.ret, data_2614$cum.ret, data_2731$cum.ret, data_2884$cum.ret, data_3481$cum.ret
                 , data_6505$cum.ret, data_8039$cum.ret))

windows(height=10, width=20)
plot(x=data_1101$Date, y=data_1101$cum.ret, ylim=y.range, main="Cumulative returns", xlab="Date"
     , ylab="cumulative return", type="l", lwd=2, lty=1, col=1)
lines(x=data_1216$Date, y=data_1216$cum.ret, lwd=2, lty=1, col=2)
lines(x=data_1303$Date, y=data_1303$cum.ret, lwd=2, lty=1, col=3)
lines(x=data_1434$Date, y=data_1434$cum.ret, lwd=2, lty=1, col=4)
lines(x=data_1504$Date, y=data_1504$cum.ret, lwd=2, lty=1, col=5)
lines(x=data_1612$Date, y=data_1612$cum.ret, lwd=2, lty=1, col=6)
lines(x=data_1732$Date, y=data_1732$cum.ret, lwd=2, lty=1, col=7)
lines(x=data_1734$Date, y=data_1734$cum.ret, lwd=2, lty=1, col=8)
lines(x=data_1810$Date, y=data_1810$cum.ret, lwd=2, lty=2, col=1)
lines(x=data_1909$Date, y=data_1909$cum.ret, lwd=2, lty=2, col=2)
lines(x=data_2002$Date, y=data_2002$cum.ret, lwd=2, lty=2, col=3)
lines(x=data_2105$Date, y=data_2105$cum.ret, lwd=2, lty=2, col=4)
lines(x=data_2201$Date, y=data_2201$cum.ret, lwd=2, lty=2, col=5)
lines(x=data_2317$Date, y=data_2317$cum.ret, lwd=2, lty=2, col=6)
lines(x=data_2330$Date, y=data_2330$cum.ret, lwd=2, lty=2, col=7)
lines(x=data_2357$Date, y=data_2357$cum.ret, lwd=2, lty=2, col=8)
lines(x=data_2412$Date, y=data_2412$cum.ret, lwd=2, lty=3, col=1)
lines(x=data_2430$Date, y=data_2430$cum.ret, lwd=2, lty=3, col=2)
lines(x=data_2480$Date, y=data_2480$cum.ret, lwd=2, lty=3, col=3)
lines(x=data_2505$Date, y=data_2505$cum.ret, lwd=2, lty=3, col=4)
lines(x=data_2603$Date, y=data_2603$cum.ret, lwd=2, lty=3, col=5)
lines(x=data_2614$Date, y=data_2614$cum.ret, lwd=2, lty=3, col=6)
lines(x=data_2731$Date, y=data_2731$cum.ret, lwd=2, lty=3, col=7)
lines(x=data_2884$Date, y=data_2884$cum.ret, lwd=2, lty=3, col=8)
lines(x=data_3481$Date, y=data_3481$cum.ret, lwd=2, lty=4, col=1)
lines(x=data_6505$Date, y=data_6505$cum.ret, lwd=2, lty=4, col=2)
lines(x=data_8039$Date, y=data_8039$cum.ret, lwd=2, lty=4, col=3)
legend("topleft", legend=c('1101', '1216', '1303', '1434', '1504', '1612', '1732', '1734', '1810', '1909', '2002'
                           , '2105', '2201', '2317', '2330', '2357', '2412', '2430', '2480', '2505', '2603', '2614'
                           , '2731', '2884', '3481', '6505', '8039')
       , lwd=c(rep(2, 27)), lty=c(rep(1, 8), rep(2, 8), rep(3, 8), rep(4, 3))
       , col=c(rep(1:8, 3), 1, 2, 3), ncol=3)

-------------------------------------------------------------
##collect return data
ret_data<-data.frame(matrix(0,nrow(data_1101),28))
ret_data[,1]<-data_1101$Date
ret_data[,2:ncol(ret_data)]<-cbind(data_1101$ret, data_1216$ret, data_1303$ret, data_1434$ret, data_1504$ret
                                   , data_1612$ret, data_1732$ret, data_1734$ret, data_1810$ret, data_1909$ret
                                   , data_2002$ret, data_2105$ret, data_2201$ret, data_2317$ret, data_2330$ret
                                   , data_2357$ret, data_2412$ret, data_2430$ret, data_2480$ret, data_2505$ret
                                   , data_2603$ret, data_2614$ret, data_2731$ret, data_2884$ret, data_3481$ret
                                   , data_6505$ret, data_8039$ret)
colnames(ret_data)<-c('Date', '1101', '1216', '1303', '1434', '1504', '1612', '1732', '1734', '1810', '1909'
                      , '2002', '2105', '2201', '2317', '2330', '2357', '2412', '2430', '2480', '2505', '2603'
                      , '2614', '2731', '2884', '3481', '6505', '8039')

##using rolling window
##window length
kx<-252*3
##out of sample length
hx<-nrow(ret_data)-kx
##risk free rate (annualized interest is 0.38%)
rf<-0.0038/252

---------------------------------------------------------------------
##fixed weight portfolio
##each weight 1/27
wx<-c(rep(1/27, 27))

##out of sample returns
fw_oos_r<-numeric(hx)

##turn over rate
fw_tor<-numeric(hx)

##HHI
fw_hhi<-numeric(hx)

##SLR
fw_slr<-numeric(hx)

##portfolio weight in period t-1
wx_mat<-matrix(0, hx+1, ncol(ret_data)-1)

for(i in 1:hx){
        ##data in the rolling window
        datax<-ret_data[i:(i+kx-1), 2:ncol(ret_data)]
        
        ##return of period i+kx
        rx<-ret_data[i+kx, 2:ncol(ret_data)]
        ##return of period i+kx-1
        rx_lag<-datax[nrow(datax), ]
        
        ##out of sample portfolio returns
        fw_oos_r[i]<-sum(wx*rx)
        
        ##turnover rate
        ##individual
        tor_ind<-abs(wx-wx_mat[i, ]*(1+(rx_lag/100))/(1+sum(wx_mat[i, ]*(rx_lag/100))))
        ##portfolio
        fw_tor[i]<-sum(tor_ind)
        
        ##HHI
        fw_hhi[i]<-sum(wx^2)/(sum(abs(wx))^2)
        
        ##SLR
        fw_slr[i]<-sum(abs(wx[wx<0]))/sum(abs(wx[wx>0]))
        
        ##store portfolio weight at this period
        wx_mat[i+1, ]<-wx
        
        print(i)
}

##plot out of sample portfolio return
windows(height=4, width=10)
plot(x=ret_data[(kx+1):nrow(ret_data), ]$Date, y=fw_oos_r, main='Fixed weight (1/N) out of sample portfolio return'
     , xlab='Date', ylab='Return (%)', type='l', col=1)

##plot out of sample portfolio cumulative gross return
fw_oos_cumr<-cumprod(1+(fw_oos_r/100))
windows(height=8, width=10)
plot(x=ret_data[(kx+1):nrow(ret_data), ]$Date, y=fw_oos_cumr 
     , main='Fixed weight (1/N) out of sample porfolio cumulative gross return', xlab='Date'
     , ylab='Cumulative gross return', type='l', lwd=2)

##Descriptive statistics of out of sample portfolio return
result_oos_ret_fw<-c(length(fw_oos_r), min(fw_oos_r), median(fw_oos_r), max(fw_oos_r), mean(fw_oos_r), sd(fw_oos_r)
                     , my_skewness(fw_oos_r), my_kurtosis(fw_oos_r), my_acf1(fw_oos_r))
result_oos_ret_fw[2:8]<-result_oos_ret_fw[2:8]*c(rep(252,4), sqrt(252), 1/sqrt(252), 1/252)
names(result_oos_ret_fw)<-c("number of observations", "min", "median", "max", "mean", "std", "skewness"
                            , "kurtosis", "acf1")
result_oos_ret_fw<-round(result_oos_ret_fw, 3)
result_oos_ret_fw

##Annualized Sharpe ratio
(mean(fw_oos_r)-rf*100)/sd(fw_oos_r)*sqrt(252)

##turnover rate
result_tor_fw<-c(min(fw_tor), median(fw_tor), max(fw_tor), mean(fw_tor), sd(fw_tor))
names(result_tor_fw)<-c('min', 'median', 'max', 'mean', 'std')
result_tor_fw<-round(result_tor_fw, 3)
result_tor_fw

##HHI
result_hhi_fw<-c(min(fw_hhi), median(fw_hhi), max(fw_hhi), mean(fw_hhi), sd(fw_hhi))
names(result_hhi_fw)<-c('min', 'median', 'max', 'mean', 'std')
result_hhi_fw<-round(result_hhi_fw, 3)
result_hhi_fw

##SLR
result_slr_fw<-c(min(fw_slr), median(fw_slr), max(fw_slr), mean(fw_slr), sd(fw_slr))
names(result_slr_fw)<-c('min', 'median', 'max', 'mean', 'std')
result_slr_fw<-round(result_slr_fw, 3)
result_slr_fw

##Suppose initial investment $1000000
##VaR
##99%
VaR_samplex(fw_oos_r/100, 1000000, 0.01)
##95%
VaR_samplex(fw_oos_r/100, 1000000, 0.05)

##ES
##99%
ES_samplex(fw_oos_r/100, 1000000, 0.01)
##95%
ES_samplex(fw_oos_r/100, 1000000, 0.05)

##LPSD
LPSDx(fw_oos_r/100, rf)

---------------------------------------------------------
##mvp
##out of sample returns
mvp_oos_r<-numeric(hx)

##turn over rate
mvp_tor<-numeric(hx)

##HHI
mvp_hhi<-numeric(hx)

##SLR
mvp_slr<-numeric(hx)

##portfolio weight in period t-1
wx_mat<-matrix(0, hx+1, ncol(ret_data)-1)

##target daily return 1%
mu_targ<-1/100

for(i in 1:hx){
        ##data in the rolling window
        datax<-ret_data[i:(i+kx-1), 2:ncol(ret_data)]
        
        ##weight in this period
        wx<-as.vector(mvp_wx(datax, mu_targ))
        
        ##return of period i+kx
        rx<-ret_data[i+kx, 2:ncol(ret_data)]
        ##return of period i+kx-1
        rx_lag<-datax[nrow(datax), ]
        
        ##out of sample portfolio returns
        mvp_oos_r[i]<-sum(wx*rx)
        
        ##turnover rate
        ##individual
        tor_ind<-abs(wx-wx_mat[i, ]*(1+(rx_lag/100))/(1+sum(wx_mat[i, ]*(rx_lag/100))))
        ##portfolio
        mvp_tor[i]<-sum(tor_ind)
        
        ##HHI
        mvp_hhi[i]<-sum(wx^2)/(sum(abs(wx))^2)
        
        ##SLR
        mvp_slr[i]<-sum(abs(wx[wx<0]))/sum(abs(wx[wx>0]))
        
        ##store portfolio weight at this period
        wx_mat[i+1, ]<-wx
        
        print(i)
}

##plot out of sample portfolio return
windows(height=4, width=10)
plot(x=ret_data[(kx+1):nrow(ret_data), ]$Date, y=mvp_oos_r, main='MVP out of sample portfolio return'
     , xlab='Date', ylab='Return (%)', type='l', col=2)

##plot out of sample portfolio cumulative gross return
mvp_oos_cumr<-cumprod(1+(mvp_oos_r/100))
windows(height=8, width=10)
plot(x=ret_data[(kx+1):nrow(ret_data), ]$Date, y=mvp_oos_cumr 
     , main='MVP out of sample porfolio cumulative gross return', xlab='Date'
     , ylab='Cumulative gross return', type='l', lwd=2)

##Descriptive statistics of out of sample portfolio return
result_oos_ret_mvp<-c(length(mvp_oos_r), min(mvp_oos_r), median(mvp_oos_r), max(mvp_oos_r), mean(mvp_oos_r)
                      , sd(mvp_oos_r), my_skewness(mvp_oos_r), my_kurtosis(mvp_oos_r), my_acf1(mvp_oos_r))
result_oos_ret_mvp[2:8]<-result_oos_ret_mvp[2:8]*c(rep(252,4), sqrt(252), 1/sqrt(252), 1/252)
names(result_oos_ret_mvp)<-c("number of observations", "min", "median", "max", "mean", "std", "skewness"
                            , "kurtosis", "acf1")
result_oos_ret_mvp<-round(result_oos_ret_mvp, 3)
result_oos_ret_mvp

##Annualized Sharpe ratio
(mean(mvp_oos_r)-rf*100)/sd(mvp_oos_r)*sqrt(252)

##turnover rate
result_tor_mvp<-c(min(mvp_tor), median(mvp_tor), max(mvp_tor), mean(mvp_tor), sd(mvp_tor))
names(result_tor_mvp)<-c('min', 'median', 'max', 'mean', 'std')
result_tor_mvp<-round(result_tor_mvp, 3)
result_tor_mvp

##HHI
result_hhi_mvp<-c(min(mvp_hhi), median(mvp_hhi), max(mvp_hhi), mean(mvp_hhi), sd(mvp_hhi))
names(result_hhi_mvp)<-c('min', 'median', 'max', 'mean', 'std')
result_hhi_mvp<-round(result_hhi_mvp, 3)
result_hhi_mvp

##SLR
result_slr_mvp<-c(min(mvp_slr), median(mvp_slr), max(mvp_slr), mean(mvp_slr), sd(mvp_slr))
names(result_slr_mvp)<-c('min', 'median', 'max', 'mean', 'std')
result_slr_mvp<-round(result_slr_mvp, 3)
result_slr_mvp

##Suppose initial investment $1000000
##VaR
##99%
VaR_samplex(mvp_oos_r/100, 1000000, 0.01)
##95%
VaR_samplex(mvp_oos_r/100, 1000000, 0.05)

##ES
##99%
ES_samplex(mvp_oos_r/100, 1000000, 0.01)
##95%
ES_samplex(mvp_oos_r/100, 1000000, 0.05)

##LPSD
LPSDx(mvp_oos_r/100, rf)

------------------------------------------------------
##gmvp
##out of sample returns
gmvp_oos_r<-numeric(hx)

##turn over rate
gmvp_tor<-numeric(hx)

##HHI
gmvp_hhi<-numeric(hx)

##SLR
gmvp_slr<-numeric(hx)

##portfolio weight in period t-1
wx_mat<-matrix(0, hx+1, ncol(ret_data)-1)

for(i in 1:hx){
        ##data in the rolling window
        datax<-ret_data[i:(i+kx-1), 2:ncol(ret_data)]
        
        ##weight in this period
        wx<-as.vector(gmvp_wx(datax))
        
        ##return of period i+kx
        rx<-ret_data[i+kx, 2:ncol(ret_data)]
        ##return of period i+kx-1
        rx_lag<-datax[nrow(datax), ]
        
        ##out of sample portfolio returns
        gmvp_oos_r[i]<-sum(wx*rx)
        
        ##turnover rate
        ##individual
        tor_ind<-abs(wx-wx_mat[i, ]*(1+(rx_lag/100))/(1+sum(wx_mat[i, ]*(rx_lag/100))))
        ##portfolio
        gmvp_tor[i]<-sum(tor_ind)
        
        ##HHI
        gmvp_hhi[i]<-sum(wx^2)/(sum(abs(wx))^2)
        
        ##SLR
        gmvp_slr[i]<-sum(abs(wx[wx<0]))/sum(abs(wx[wx>0]))
        
        ##store portfolio weight at this period
        wx_mat[i+1, ]<-wx
        
        print(i)
}

##plot out of sample portfolio return
windows(height=4, width=10)
plot(x=ret_data[(kx+1):nrow(ret_data), ]$Date, y=gmvp_oos_r, main='GMVP out of sample portfolio return'
     , xlab='Date', ylab='Return (%)', type='l', col=3)

##plot out of sample portfolio cumulative gross return
gmvp_oos_cumr<-cumprod(1+(gmvp_oos_r/100))
windows(height=8, width=10)
plot(x=ret_data[(kx+1):nrow(ret_data), ]$Date, y=gmvp_oos_cumr 
     , main='GMVP out of sample porfolio cumulative gross return', xlab='Date'
     , ylab='Cumulative gross return', type='l', lwd=2)

##Descriptive statistics of out of sample portfolio return
result_oos_ret_gmvp<-c(length(gmvp_oos_r), min(gmvp_oos_r), median(gmvp_oos_r), max(gmvp_oos_r), mean(gmvp_oos_r)
                      , sd(gmvp_oos_r), my_skewness(gmvp_oos_r), my_kurtosis(gmvp_oos_r), my_acf1(gmvp_oos_r))
result_oos_ret_gmvp[2:8]<-result_oos_ret_gmvp[2:8]*c(rep(252,4), sqrt(252), 1/sqrt(252), 1/252)
names(result_oos_ret_gmvp)<-c("number of observations", "min", "median", "max", "mean", "std", "skewness"
                             , "kurtosis", "acf1")
result_oos_ret_gmvp<-round(result_oos_ret_gmvp, 3)
result_oos_ret_gmvp

##Annualized Sharpe ratio
(mean(gmvp_oos_r)-rf*100)/sd(gmvp_oos_r)*sqrt(252)

##turnover rate
result_tor_gmvp<-c(min(gmvp_tor), median(gmvp_tor), max(gmvp_tor), mean(gmvp_tor), sd(gmvp_tor))
names(result_tor_gmvp)<-c('min', 'median', 'max', 'mean', 'std')
result_tor_gmvp<-round(result_tor_gmvp, 3)
result_tor_gmvp

##HHI
result_hhi_gmvp<-c(min(gmvp_hhi), median(gmvp_hhi), max(gmvp_hhi), mean(gmvp_hhi), sd(gmvp_hhi))
names(result_hhi_gmvp)<-c('min', 'median', 'max', 'mean', 'std')
result_hhi_gmvp<-round(result_hhi_gmvp, 3)
result_hhi_gmvp

##SLR
result_slr_gmvp<-c(min(gmvp_slr), median(gmvp_slr), max(gmvp_slr), mean(gmvp_slr), sd(gmvp_slr))
names(result_slr_gmvp)<-c('min', 'median', 'max', 'mean', 'std')
result_slr_gmvp<-round(result_slr_gmvp, 3)
result_slr_gmvp

##Suppose initial investment $1000000
##VaR
##99%
VaR_samplex(gmvp_oos_r/100, 1000000, 0.01)
##95%
VaR_samplex(gmvp_oos_r/100, 1000000, 0.05)

##ES
##99%
ES_samplex(gmvp_oos_r/100, 1000000, 0.01)
##95%
ES_samplex(gmvp_oos_r/100, 1000000, 0.05)

##LPSD
LPSDx(gmvp_oos_r/100, rf)
----------------------------------------------------------------
##mvp with a risk-free asset
##out of sample returns
mvprf_oos_r<-numeric(hx)

##turn over rate
mvprf_tor<-numeric(hx)

##HHI
mvprf_hhi<-numeric(hx)

##SLR
mvprf_slr<-numeric(hx)

##portfolio weight in period t-1
wx_mat<-matrix(0, hx+1, ncol(ret_data))

##target daily return 1%
mu_targ<-1/100

for(i in 1:hx){
        ##data in the rolling window
        datax<-ret_data[i:(i+kx-1), 2:ncol(ret_data)]
        
        ##weight in this period
        wx<-as.vector(rf_mvp_wx(datax, mu_targ, rf))
        
        ##return of period i+kx
        rx<-cbind(rf*100, ret_data[i+kx, 2:ncol(ret_data)])
        ##return of period i+kx-1
        rx_lag<-cbind(rf*100, datax[nrow(datax), ])
        
        ##out of sample portfolio returns
        mvprf_oos_r[i]<-sum(wx*rx)
        
        ##turnover rate
        ##individual
        tor_ind<-abs(wx-wx_mat[i, ]*(1+(rx_lag/100))/(1+sum(wx_mat[i, ]*(rx_lag/100))))
        ##portfolio
        mvprf_tor[i]<-sum(tor_ind)
        
        ##HHI
        mvprf_hhi[i]<-sum(wx^2)/(sum(abs(wx))^2)
        
        ##SLR
        mvprf_slr[i]<-sum(abs(wx[wx<0]))/sum(abs(wx[wx>0]))
        
        ##store portfolio weight at this period
        wx_mat[i+1, ]<-wx
        
        print(i)
}

##plot out of sample portfolio return
windows(height=4, width=10)
plot(x=ret_data[(kx+1):nrow(ret_data), ]$Date, y=mvprf_oos_r
     , main='MVP with a risk free asset out of sample portfolio return'
     , xlab='Date', ylab='Return (%)', type='l', col=4)

##plot out of sample portfolio cumulative gross return
mvprf_oos_cumr<-cumprod(1+(mvprf_oos_r/100))
windows(height=8, width=10)
plot(x=ret_data[(kx+1):nrow(ret_data), ]$Date, y=mvprf_oos_cumr 
     , main='MVP with a risk free asset out of sample porfolio cumulative gross return', xlab='Date'
     , ylab='Cumulative gross return', type='l', lwd=2)

##Descriptive statistics of out of sample portfolio return
result_oos_ret_mvprf<-c(length(mvprf_oos_r), min(mvprf_oos_r), median(mvprf_oos_r), max(mvprf_oos_r)
                        , mean(mvprf_oos_r), sd(mvprf_oos_r), my_skewness(mvprf_oos_r), my_kurtosis(mvprf_oos_r)
                        , my_acf1(mvprf_oos_r))
result_oos_ret_mvprf[2:8]<-result_oos_ret_mvprf[2:8]*c(rep(252,4), sqrt(252), 1/sqrt(252), 1/252)
names(result_oos_ret_mvprf)<-c("number of observations", "min", "median", "max", "mean", "std", "skewness"
                              , "kurtosis", "acf1")
result_oos_ret_mvprf<-round(result_oos_ret_mvprf, 3)
result_oos_ret_mvprf

##Annualized Sharpe ratio
(mean(mvprf_oos_r)-rf*100)/sd(mvprf_oos_r)*sqrt(252)

##turnover rate
result_tor_mvprf<-c(min(mvprf_tor), median(mvprf_tor), max(mvprf_tor), mean(mvprf_tor), sd(mvprf_tor))
names(result_tor_mvprf)<-c('min', 'median', 'max', 'mean', 'std')
result_tor_mvprf<-round(result_tor_mvprf, 3)
result_tor_mvprf

##HHI
result_hhi_mvprf<-c(min(mvprf_hhi), median(mvprf_hhi), max(mvprf_hhi), mean(mvprf_hhi), sd(mvprf_hhi))
names(result_hhi_mvprf)<-c('min', 'median', 'max', 'mean', 'std')
result_hhi_mvprf<-round(result_hhi_mvprf, 3)
result_hhi_mvprf

##SLR
result_slr_mvprf<-c(min(mvprf_slr), median(mvprf_slr), max(mvprf_slr), mean(mvprf_slr), sd(mvprf_slr))
names(result_slr_mvprf)<-c('min', 'median', 'max', 'mean', 'std')
result_slr_mvprf<-round(result_slr_mvprf, 3)
result_slr_mvprf

##Suppose initial investment $1000000
##VaR
##99%
VaR_samplex(mvprf_oos_r/100, 1000000, 0.01)
##95%
VaR_samplex(mvprf_oos_r/100, 1000000, 0.05)

##ES
##99%
ES_samplex(mvprf_oos_r/100, 1000000, 0.01)
##95%
ES_samplex(mvprf_oos_r/100, 1000000, 0.05)

##LPSD
LPSDx(mvprf_oos_r/100, rf)

--------------------------------------------------------
##tangency portfolio
##out of sample returns
tan_oos_r<-numeric(hx)

##turn over rate
tan_tor<-numeric(hx)

##HHI
tan_hhi<-numeric(hx)

##SLR
tan_slr<-numeric(hx)

##portfolio weight in period t-1
wx_mat<-matrix(0, hx+1, ncol(ret_data)-1)

for(i in 1:hx){
        ##data in the rolling window
        datax<-ret_data[i:(i+kx-1), 2:ncol(ret_data)]
        
        ##weight in this period
        wx<-as.vector(tan_wx(datax, rf))
        
        ##return of period i+kx
        rx<-ret_data[i+kx, 2:ncol(ret_data)]
        ##return of period i+kx-1
        rx_lag<-datax[nrow(datax), ]
        
        ##out of sample portfolio returns
        tan_oos_r[i]<-sum(wx*rx)
        
        ##turnover rate
        ##individual
        tor_ind<-abs(wx-wx_mat[i, ]*(1+(rx_lag/100))/(1+sum(wx_mat[i, ]*(rx_lag/100))))
        ##portfolio
        tan_tor[i]<-sum(tor_ind)
        
        ##HHI
        tan_hhi[i]<-sum(wx^2)/(sum(abs(wx))^2)
        
        ##SLR
        tan_slr[i]<-sum(abs(wx[wx<0]))/sum(abs(wx[wx>0]))
        
        ##store portfolio weight at this period
        wx_mat[i+1, ]<-wx
        
        print(i)
}

##plot out of sample portfolio return
windows(height=4, width=10)
plot(x=ret_data[(kx+1):nrow(ret_data), ]$Date, y=tan_oos_r
     , main='Tangancy portfolio out of sample portfolio return', xlab='Date', ylab='Return (%)', type='l', col=5)

##plot out of sample portfolio cumulative gross return
tan_oos_cumr<-cumprod(1+(tan_oos_r/100))
windows(height=8, width=10)
plot(x=ret_data[(kx+1):nrow(ret_data), ]$Date, y=tan_oos_cumr 
     , main='Tangency portfolio out of sample porfolio cumulative gross return', xlab='Date'
     , ylab='Cumulative gross return', type='l', lwd=2)

##Descriptive statistics of out of sample portfolio return
result_oos_ret_tan<-c(length(tan_oos_r), min(tan_oos_r), median(tan_oos_r), max(tan_oos_r), mean(tan_oos_r)
                      , sd(tan_oos_r), my_skewness(tan_oos_r), my_kurtosis(tan_oos_r), my_acf1(tan_oos_r))
result_oos_ret_tan[2:8]<-result_oos_ret_tan[2:8]*c(rep(252,4), sqrt(252), 1/sqrt(252), 1/252)
names(result_oos_ret_tan)<-c("number of observations", "min", "median", "max", "mean", "std", "skewness"
                               , "kurtosis", "acf1")
result_oos_ret_tan<-round(result_oos_ret_tan, 3)
result_oos_ret_tan

##Annualized Sharpe ratio
(mean(tan_oos_r)-rf*100)/sd(tan_oos_r)*sqrt(252)

##turnover rate
result_tor_tan<-c(min(tan_tor), median(tan_tor), max(tan_tor), mean(tan_tor), sd(tan_tor))
names(result_tor_tan)<-c('min', 'median', 'max', 'mean', 'std')
result_tor_tan<-round(result_tor_tan, 3)
result_tor_tan

##HHI
result_hhi_tan<-c(min(tan_hhi), median(tan_hhi), max(tan_hhi), mean(tan_hhi), sd(tan_hhi))
names(result_hhi_tan)<-c('min', 'median', 'max', 'mean', 'std')
result_hhi_tan<-round(result_hhi_tan, 3)
result_hhi_tan

##SLR
result_slr_tan<-c(min(tan_slr), median(tan_slr), max(tan_slr), mean(tan_slr), sd(tan_slr))
names(result_slr_tan)<-c('min', 'median', 'max', 'mean', 'std')
result_slr_tan<-round(result_slr_tan, 3)
result_slr_tan

##Suppose initial investment $1000000
##VaR
##99%
VaR_samplex(tan_oos_r/100, 1000000, 0.01)
##95%
VaR_samplex(tan_oos_r/100, 1000000, 0.05)

##ES
##99%
ES_samplex(tan_oos_r/100, 1000000, 0.01)
##95%
ES_samplex(tan_oos_r/100, 1000000, 0.05)

##LPSD
LPSDx(tan_oos_r/100, rf)

--------------------------------------------------------------
##no-shortsales mvp
##out of sample returns
nsmvp_oos_r<-numeric(hx)

##turn over rate
nsmvp_tor<-numeric(hx)

##HHI
nsmvp_hhi<-numeric(hx)

##SLR
nsmvp_slr<-numeric(hx)

##portfolio weight in period t-1
wx_mat<-matrix(0, hx+1, ncol(ret_data)-1)

##target daily return 1%
mu_targ<-1/100

for(i in 1:hx){
        ##data in the rolling window
        datax<-ret_data[i:(i+kx-1), 2:ncol(ret_data)]
        
        ##weight in this period
        wx<-nsmvp_wx_quad(datax, mu_targ)$solution
        
        ##return of period i+kx
        rx<-ret_data[i+kx, 2:ncol(ret_data)]
        ##return of period i+kx-1
        rx_lag<-datax[nrow(datax), ]
        
        ##out of sample portfolio returns
        nsmvp_oos_r[i]<-sum(wx*rx)
        
        ##turnover rate
        ##individual
        tor_ind<-abs(wx-wx_mat[i, ]*(1+(rx_lag/100))/(1+sum(wx_mat[i, ]*(rx_lag/100))))
        ##portfolio
        nsmvp_tor[i]<-sum(tor_ind)
        
        ##HHI
        nsmvp_hhi[i]<-sum(wx^2)/(sum(abs(wx))^2)
        
        ##SLR
        nsmvp_slr[i]<-sum(abs(wx[wx<0]))/sum(abs(wx[wx>0]))
        
        ##store portfolio weight at this period
        wx_mat[i+1, ]<-wx
        
        print(i)
}

##plot out of sample portfolio return
windows(height=4, width=10)
plot(x=ret_data[(kx+1):nrow(ret_data), ]$Date, y=nsmvp_oos_r
     , main='No-shortsales MVP out of sample portfolio return', xlab='Date', ylab='Return (%)', type='l', col=6)

##plot out of sample portfolio cumulative gross return
nsmvp_oos_cumr<-cumprod(1+(nsmvp_oos_r/100))
windows(height=8, width=10)
plot(x=ret_data[(kx+1):nrow(ret_data), ]$Date, y=nsmvp_oos_cumr 
     , main='No-shortsales MVP out of sample porfolio cumulative gross return', xlab='Date'
     , ylab='Cumulative gross return', type='l', lwd=2)

##Descriptive statistics of out of sample portfolio return
result_oos_ret_nsmvp<-c(length(nsmvp_oos_r), min(nsmvp_oos_r), median(nsmvp_oos_r), max(nsmvp_oos_r)
                        , mean(nsmvp_oos_r), sd(nsmvp_oos_r), my_skewness(nsmvp_oos_r), my_kurtosis(nsmvp_oos_r)
                        , my_acf1(nsmvp_oos_r))
result_oos_ret_nsmvp[2:8]<-result_oos_ret_nsmvp[2:8]*c(rep(252,4), sqrt(252), 1/sqrt(252), 1/252)
names(result_oos_ret_nsmvp)<-c("number of observations", "min", "median", "max", "mean", "std", "skewness"
                             , "kurtosis", "acf1")
result_oos_ret_nsmvp<-round(result_oos_ret_nsmvp, 3)
result_oos_ret_nsmvp

##Annualized Sharpe ratio
(mean(nsmvp_oos_r)-rf*100)/sd(nsmvp_oos_r)*sqrt(252)

##turnover rate
result_tor_nsmvp<-c(min(nsmvp_tor), median(nsmvp_tor), max(nsmvp_tor), mean(nsmvp_tor), sd(nsmvp_tor))
names(result_tor_nsmvp)<-c('min', 'median', 'max', 'mean', 'std')
result_tor_nsmvp<-round(result_tor_nsmvp, 3)
result_tor_nsmvp

##HHI
result_hhi_nsmvp<-c(min(nsmvp_hhi), median(nsmvp_hhi), max(nsmvp_hhi), mean(nsmvp_hhi), sd(nsmvp_hhi))
names(result_hhi_nsmvp)<-c('min', 'median', 'max', 'mean', 'std')
result_hhi_nsmvp<-round(result_hhi_nsmvp, 3)
result_hhi_nsmvp

##SLR
result_slr_nsmvp<-c(min(nsmvp_slr), median(nsmvp_slr), max(nsmvp_slr), mean(nsmvp_slr), sd(nsmvp_slr))
names(result_slr_nsmvp)<-c('min', 'median', 'max', 'mean', 'std')
result_slr_nsmvp<-round(result_slr_nsmvp, 3)
result_slr_nsmvp

##Suppose initial investment $1000000
##VaR
##99%
VaR_samplex(nsmvp_oos_r/100, 1000000, 0.01)
##95%
VaR_samplex(nsmvp_oos_r/100, 1000000, 0.05)

##ES
##99%
ES_samplex(nsmvp_oos_r/100, 1000000, 0.01)
##95%
ES_samplex(nsmvp_oos_r/100, 1000000, 0.05)

##LPSD
LPSDx(nsmvp_oos_r/100, rf)

-------------------------------------------------------
##no-shortsales gmvp
##out of sample returns
nsgmvp_oos_r<-numeric(hx)

##turn over rate
nsgmvp_tor<-numeric(hx)

##HHI
nsgmvp_hhi<-numeric(hx)

##SLR
nsgmvp_slr<-numeric(hx)

##portfolio weight in period t-1
wx_mat<-matrix(0, hx+1, ncol(ret_data)-1)

for(i in 1:hx){
        ##data in the rolling window
        datax<-ret_data[i:(i+kx-1), 2:ncol(ret_data)]
        
        ##weight in this period
        wx<-nsgmvp_wx_quad(datax)$solution
        
        ##return of period i+kx
        rx<-ret_data[i+kx, 2:ncol(ret_data)]
        ##return of period i+kx-1
        rx_lag<-datax[nrow(datax), ]
        
        ##out of sample portfolio returns
        nsgmvp_oos_r[i]<-sum(wx*rx)
        
        ##turnover rate
        ##individual
        tor_ind<-abs(wx-wx_mat[i, ]*(1+(rx_lag/100))/(1+sum(wx_mat[i, ]*(rx_lag/100))))
        ##portfolio
        nsgmvp_tor[i]<-sum(tor_ind)
        
        ##HHI
        nsgmvp_hhi[i]<-sum(wx^2)/(sum(abs(wx))^2)
        
        ##SLR
        nsgmvp_slr[i]<-sum(abs(wx[wx<0]))/sum(abs(wx[wx>0]))
        
        ##store portfolio weight at this period
        wx_mat[i+1, ]<-wx
        
        print(i)
}

##plot out of sample portfolio return
windows(height=4, width=10)
plot(x=ret_data[(kx+1):nrow(ret_data), ]$Date, y=nsgmvp_oos_r
     , main='No-shortsales GMVP out of sample portfolio return', xlab='Date', ylab='Return (%)', type='l', col=7)

##plot out of sample portfolio cumulative gross return
nsgmvp_oos_cumr<-cumprod(1+(nsgmvp_oos_r/100))
windows(height=8, width=10)
plot(x=ret_data[(kx+1):nrow(ret_data), ]$Date, y=nsgmvp_oos_cumr 
     , main='No-shortsales GMVP out of sample porfolio cumulative gross return', xlab='Date'
     , ylab='Cumulative gross return', type='l', lwd=2)

##Descriptive statistics of out of sample portfolio return
result_oos_ret_nsgmvp<-c(length(nsgmvp_oos_r), min(nsgmvp_oos_r), median(nsgmvp_oos_r), max(nsgmvp_oos_r)
                        , mean(nsgmvp_oos_r), sd(nsgmvp_oos_r), my_skewness(nsgmvp_oos_r), my_kurtosis(nsgmvp_oos_r)
                        , my_acf1(nsgmvp_oos_r))
result_oos_ret_nsgmvp[2:8]<-result_oos_ret_nsgmvp[2:8]*c(rep(252,4), sqrt(252), 1/sqrt(252), 1/252)
names(result_oos_ret_nsgmvp)<-c("number of observations", "min", "median", "max", "mean", "std", "skewness"
                               , "kurtosis", "acf1")
result_oos_ret_nsgmvp<-round(result_oos_ret_nsgmvp, 3)
result_oos_ret_nsgmvp

##Annualized Sharpe ratio
(mean(nsgmvp_oos_r)-rf*100)/sd(nsgmvp_oos_r)*sqrt(252)

##turnover rate
result_tor_nsgmvp<-c(min(nsgmvp_tor), median(nsgmvp_tor), max(nsgmvp_tor), mean(nsgmvp_tor), sd(nsgmvp_tor))
names(result_tor_nsgmvp)<-c('min', 'median', 'max', 'mean', 'std')
result_tor_nsgmvp<-round(result_tor_nsgmvp, 3)
result_tor_nsgmvp

##HHI
result_hhi_nsgmvp<-c(min(nsgmvp_hhi), median(nsgmvp_hhi), max(nsgmvp_hhi), mean(nsgmvp_hhi), sd(nsgmvp_hhi))
names(result_hhi_nsgmvp)<-c('min', 'median', 'max', 'mean', 'std')
result_hhi_nsgmvp<-round(result_hhi_nsgmvp, 3)
result_hhi_nsgmvp

##SLR
result_slr_nsgmvp<-c(min(nsgmvp_slr), median(nsgmvp_slr), max(nsgmvp_slr), mean(nsgmvp_slr), sd(nsgmvp_slr))
names(result_slr_nsgmvp)<-c('min', 'median', 'max', 'mean', 'std')
result_slr_nsgmvp<-round(result_slr_nsgmvp, 3)
result_slr_nsgmvp

##Suppose initial investment $1000000
##VaR
##99%
VaR_samplex(nsgmvp_oos_r/100, 1000000, 0.01)
##95%
VaR_samplex(nsgmvp_oos_r/100, 1000000, 0.05)

##ES
##99%
ES_samplex(nsgmvp_oos_r/100, 1000000, 0.01)
##95%
ES_samplex(nsgmvp_oos_r/100, 1000000, 0.05)

##LPSD
LPSDx(nsgmvp_oos_r/100, rf)

--------------------------------------------------------------
##oos cumulative return plot
y.range=c(min(fw_oos_cumr, mvp_oos_cumr, gmvp_oos_cumr, mvprf_oos_cumr, tan_oos_cumr, nsmvp_oos_cumr
              , nsgmvp_oos_cumr)
          , max(fw_oos_cumr, mvp_oos_cumr, gmvp_oos_cumr, mvprf_oos_cumr, tan_oos_cumr, nsmvp_oos_cumr
                , nsgmvp_oos_cumr))

windows(height=10, width=20)
plot(x=ret_data[(kx+1):nrow(ret_data), ]$Date, y=fw_oos_cumr
     , main="Out of sample cumulative gross returns of portfolios", xlab="Date", ylab="Cumulative gross returns"
     , ylim=y.range, type="l", lwd=2, col=1)
lines(x=ret_data[(kx+1):nrow(ret_data), ]$Date, y=mvp_oos_cumr, lwd=2, col=2)
lines(x=ret_data[(kx+1):nrow(ret_data), ]$Date, y=gmvp_oos_cumr, lwd=2, col=3)
lines(x=ret_data[(kx+1):nrow(ret_data), ]$Date, y=mvprf_oos_cumr, lwd=2, col=4)
lines(x=ret_data[(kx+1):nrow(ret_data), ]$Date, y=tan_oos_cumr, lwd=2, col=5)
lines(x=ret_data[(kx+1):nrow(ret_data), ]$Date, y=nsmvp_oos_cumr, lwd=2, col=6)
lines(x=ret_data[(kx+1):nrow(ret_data), ]$Date, y=nsgmvp_oos_cumr, lwd=2, col=7)
legend("topleft", legend=c("fixed weight", "MVP", "GMVP", "MVP with a risk free asset", "tangency portfolio"
                           , "no-shortsales MVP", "no-shortsales GMVP")
       , lwd=c(rep(2, 7)), col=c(1:7))