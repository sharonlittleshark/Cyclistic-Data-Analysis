# R : Project in Data Cleaning, Data Analysis and Data Visualization

## Cyclistic-Data-Analysis
## Author:Sharon

### Introduction
This is a case project from **Google Data Analytics Capstone** in Coursera. 

### Project Requirement
The project is a business task from Cyclistic, which is a bike-share programs. The manager believes that the increment of annual members is an effective means in order to maximize the company’s profit. For an effective marketing strategy, a data analysis task has been assigned to figure out the differences between casual riders and annual members.
The full project introduction and requirements can be checked in the ***Case Study 1 - Project Intro.pdf***. 

### Data Resource
The [Dataset](https://divvy-tripdata.s3.amazonaws.com/index.html) used in this project is Cyclistic’s historical trip data from 1st July 2022 to 30th June 2023, included information below:
1. User information: user ID and the member types (casual riders or annual members)
2. Riding type: the bike used in the riding trip.
3. Time: the starting and ending time of the riding trip.
4. Location: the starting and ending location (station, latitude, longitude) of the riding trip.

### Project Roadmap
1. **Prepare** : Including data import, data merge
2. **Process** : Including data cleaning(duplicates, outliers and missing values), data calculation
3. **Analysis** : Mainly by grouping the users
4. **Visualization** : Check the pattern between different groups
The full process can be checked in the ***Cyclistic Data Analysis Report.pdf***.

### Result and Findings

<img width="522" alt="image" src="https://github.com/sharonlittleshark/Cyclistic-Data-Analysis/assets/126043660/40e8774a-8720-4c2c-a420-8012a3138490">

<img width="528" alt="image" src="https://github.com/sharonlittleshark/Cyclistic-Data-Analysis/assets/126043660/823f2fb4-429b-4ff8-bddf-bf7d93b035e0">

<img width="334" alt="image" src="https://github.com/sharonlittleshark/Cyclistic-Data-Analysis/assets/126043660/c6a6c2a6-357f-4d9e-a5bf-9c8948e31be5">

<img width="325" alt="image" src="https://github.com/sharonlittleshark/Cyclistic-Data-Analysis/assets/126043660/f5ae09b7-8d0b-4801-9745-ebc4826ef5c9">

#### 1. Different in purpose
As the result showed from the weekday comparison drawn a conclusion that == when people have a daily need in using Cyclistic, they have more probability 
to become a member== . From the given information, only 30% users use Cyclistic to commute to work each day, thus it is a huge potential market 
space.

**Recommendation**: Put into more marketing resources in the daily work scene such as the elevator in an office building and Subway station.

#### 2. Different in rideable type
The docked bike is not popular in casual riders and not useful in members. 

**Recommendation**: Dispose the docked bike line to transfer the resources to other lines. 

The majority of riders opt for electric bike, it may be a trend nowadays. 
The choice of classic bike and electric bike showed less significant difference among the members.

**Recommendation**: Put more attention in the electric bike, but also without ignoring the classic bike.

#### 3. Different in duration and distance
The slight differences of the duration and distance pointed out the casual riders will take a longer trip than members, where consistent to the conclusion above. Casual riders mainly take a leisure trip while members mainly use for the daily purpose. 

**Recommendation**: Povide some packages for the longer trip to attract casual riders become a member.






