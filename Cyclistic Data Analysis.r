# Environment set up
```{r environment set up}
library(tidyverse)
library(readr)
library(dplyr)
library(ggplot2)
library(geosphere)
```

# Prepare:Importing data
```{r importing data}
#import data
path<-"C:/Users/han_0/OneDrive/桌面/divvy_trip_data_csv"
all_files<-list.files(path,pattern="*.csv",full.names=TRUE)
tripData <- data.frame()
for(file in all_files){
  data<-read.csv(file) 
  tripData<-bind_rows(tripData,data)
}

#Check the data
glimpse(tripData)
str(tripData)
```

# Process:Change the data type
```{r change the data type}
tripData$start_dt<-ymd_hms(tripData$started_at)
tripData$end_dt<-ymd_hms(tripData$ended_at)
```

# Process:Calculation
```{R calculation}
#distance
start_point<-cbind(lng=tripData$start_lng,lat=tripData$start_lat)
end_point<-cbind(lng=tripData$end_lng,lat=tripData$end_lat)
tripData$distance<-distHaversine(start_point,end_point,r=6378137)

#weekday and duration
tripData$weekday<-weekdays(tripData$start_dt,abbreviate=TRUE)
tripData$duration<-as.numeric(tripData$end_dt - tripData$start_dt)
```

# Process: Data cleaning
```{r filter}
#Dispose the unnormal data
tripDataFilter<-filter(tripData,duration>0 & distance>0)

#Filter the columns
tripDataNeed<select(tripDataFilter,c("ride_id","rideable_type","weekday","duration","distance","member_casual"))

#check duplicate
duplicated(tripDataNeed$ride_id)

#Replace outlier by NA
for (x in c('duration','distance')){
  value = tripDataNeed[,x][tripDataNeed[,x] %in% boxplot.stats(tripDataNeed[,x])$out]
  tripDataNeed[,x][tripDataNeed[,x] %in% value] = NA
} 

#Check NA
as.data.frame(colSums(is.na(tripDataNeed)))

#Drop NA
tripDataNeed<-na.omit(tripDataNeed)
```

# Analyze:Data Analysis
```{r data analysis}
tripDataNeed%>%
  group_by(member_casual)%>%
  summarize(n=n(),mean_time=mean(duration),min_time=min(duration),
            max_time=max(duration),mean_dis=mean(distance),
            min_dis=min(distance),max_dis=max(distance))
```

# Share:Data Visualization
```{r data visualization}
#Visualization for numeric value
ggplot(tripDataNeed)+geom_bar(aes(member_casual))
ggplot(tripDataNeed)+geom_density(mapping(aes(duration)))+facet_wrap(facet=~member_casual)+labs(title='Trip Duration')
ggplot(tripDataNeed)+geom_histogram(aes(distance))+facet_wrap(facet=~member_casual)+labs(title='Trip Distance')

#Visualization for categorical value
ggplot(tripDataNeed)+geom_bar(aes(rideable_type,fill=rideable_type))+facet_wrap(facet=~member_casual)+labs(title='Riding Type Proportion')
ggplot(tripDataNeed)+geom_bar(aes(weekday,fill=weekday))+facet_wrap(facet=~member_casual)+labs(title='Weekday Proportion')
```
