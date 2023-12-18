### start
rm(list=ls())
library(lubridate)####時間package
library(ggplot2)
library(xlsx)

### load data
train_data=read.csv("C:/Users/LAI/Desktop/train_data.csv",header=T)
actuator01=train_data[,21]
actuator02=train_data[,22]
actuator03=train_data[,23]
actuator04=train_data[,24]
actuator05=train_data[,25]
actuator06=train_data[,26]
actuator07=train_data[,27]
actuator08=train_data[,28]
actuator09=train_data[,29]
actuator10=train_data[,30]
actuator11=train_data[,31]
### 不能用data.frame這樣會變成list而非向量
actuator=data.matrix(cbind(actuator01,actuator02,actuator03,actuator04,actuator05,actuator06,actuator07,actuator08,actuator09,actuator10,actuator11))
### test data
test_data=read.csv("C:/Users/LAI/Desktop/test_data.csv",header=T)

### 迴圈輸出
actuator=data.matrix(cbind(actuator01,actuator02,actuator03,actuator04,actuator05,actuator06,actuator07,actuator08,actuator09,actuator10,actuator11))
A=NULL
for(i in 1:11){
  train_data = read.csv("C:/Users/LAI/Desktop/train_data.csv",header = T)
  y = actuator[,i]
  model = glm(y~as.matrix(train_data[,3:20]),data=train_data,family="binomial")
  train_data = test_data
  result = predict(model,newdata=train_data[,3:20], type = "response")
  new_result = ifelse(result > 0.5,1,0)
  A = cbind(A,new_result)
  write.table(A,file="C:/Users/LAI/Desktop/actuator.csv", sep=",", row.names=F, col.names = F)
}


