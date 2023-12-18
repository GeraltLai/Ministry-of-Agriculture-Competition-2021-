### start
rm(list=ls())
library(lubridate)####時間package
library(ggplot2)
library(xlsx)

### load data
train_data=read.csv("C:/Users/LAI/Desktop/train_data.csv",header=T)
head(train_data)
str(train_data)
time=as.POSIXct(train_data[,2])
name=c("temperature_A","temperature_B","humidity_A","humidity_B","photometric","CO2","soil_temperature","soil_humidity","soil_EC","soil_PH","outside_photometric","outside_temperature","outside_humidity","wind_speed","wind_direction","radiometric","rainfall_detect","rainfall")
for(i in 1:18){
  yourfilname = paste("作圖",i,".jpg",sep="") # paste拼接字串功能
  photo = ggplot(train_data,aes(x=time,y=train_data[,(i+2)]))+
    geom_line(colour="green")+
    labs(x ="時間", y = name[i])+
    ggsave(filename = yourfilname)
  print(photo)
}