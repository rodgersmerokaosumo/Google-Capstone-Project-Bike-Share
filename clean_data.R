##libraries
library(tidyverse)
library(janitor)
library(lubridate)
library(readxl)
library(writexl)

##import data
df_201407 = read_csv("data\\Divvy_Stations_Trips_2014_Q3Q4\\Divvy_Trips_2014-Q3-07.csv")
df_20140809 = read_csv("data\\Divvy_Stations_Trips_2014_Q3Q4\\Divvy_Trips_2014-Q3-0809.csv")

#join to get q3 data
df_q3 = rbind(df_201407, df_20140809)

# get q1q2, q4 data
df_14q1_2 = read_csv("data\\Divvy_Trips_2014_Q1Q2.csv")
df_14q4 = read_csv("data\\Divvy_Stations_Trips_2014_Q3Q4\\Divvy_Trips_2014-Q4.csv")

###bind 2014 data

df_14 = rbind(df_14q1_2, df_q3,df_14q4)

### Get 2015 data --q1,2,4

df_15q1 = read_csv("data\\Divvy_Trips_2015-Q1.csv")
df_15q2 = read_csv("data\\Divvy_Trips_2015-Q2.csv")
df_15q4 = read_csv("data\\Divvy_Trips_2015_Q4.csv")

### get 2015 q3 data
df_150307 = read_csv("data\\Divvy_Trips_2015_07.csv")
df_150308 = read_csv("data\\Divvy_Trips_2015_08.csv")
df_150309 = read_csv("data\\Divvy_Trips_2015_08.csv")
##bind to get q3 data
df_15q3 = rbind(df_150307, df_150308, df_150309)

### bind 2015 data
df_15 = rbind(df_15q1, df_15q2, df_15q3, df_15q4)

### 2016 data
##q1 data
df_16q1 = read_csv("data\\Divvy_Trips_2016_Q1Q2\\Divvy_Trips_2016_Q1.csv")
df_16q3 = read_csv("data\\Divvy_Trips_2016_Q3.csv")
df_16q4 = read_csv("data\\Divvy_Trips_2016_Q4.csv")

## bind q2 data
df_q204 = read_csv("data\\Divvy_Trips_2016_Q1Q2\\Divvy_Trips_2016_04.csv")
df_q205 = read_csv("data\\Divvy_Trips_2016_Q1Q2\\Divvy_Trips_2016_05.csv")
df_q206 = read_csv("data\\Divvy_Trips_2016_Q1Q2\\Divvy_Trips_2016_06.csv")
## bind to get q2 data
df_16q2 = rbind(df_q204, df_q205, df_q206)

## 2016 data

df_16 = rbind(df_16q1, df_16q2, df_16q3, df_16q4)

#2017 data
df_17q1 = read_csv("data\\Divvy_Trips_2017_Q1.csv")
df_17q2 = read_csv("data\\Divvy_Trips_2017_Q2.csv")
df_17q3 = read_csv("data\\Divvy_Trips_2017_Q3.csv")
df_17q4 = read_csv("data\\Divvy_Trips_2017_Q4.csv")

##bind

df_17 = rbind(df_17q1, df_17q2, df_17q3, df_17q4)##There's an error

# 2018 data
df_18q1 = read_csv("data\\Divvy_Trips_2018_Q1.csv")
df_18q2 = read_csv("data\\Divvy_Trips_2018_Q2.csv")
df_18q3 = read_csv("data\\Divvy_Trips_2018_Q3.csv")
df_18q4 = read_csv("data\\Divvy_Trips_2018_Q4.csv")

##rename columns for 2018 q1

df_18q1 %>%
  rename(trip_id = df_18q1$`01 - Rental Details Rental ID`,
         start_time = df_18q1$`01 - Rental Details Local Start Time`,
         end_time = df_18q1$`01 - Rental Details Local End Time`,
         bikeid = df_18q1$`01 - Rental Details Bike ID`,
         tripduration = df_18q1$`01 - Rental Details Duration In Seconds Uncapped`,
         from_station_id = df_18q1$`03 - Rental Start Station ID`,
         from_station_name = df_18q1$`03 - Rental Start Station Name`,
         to_station_id = df_18q1$`02 - Rental End Station ID`,
         to_station_name = df_18q1$`02 - Rental End Station Name`,
         usertype = df_18q1$`User Type`,
         gender = df_18q1$`Member Gender`,
         birthyear = df_18q1$`05 - Member Details Member Birthday Year`)

df_18q1 = df_18q1 %>% clean_names() %>% head()

df_18q1 = rename(df_18q1, c(trip_id = x01_rental_details_rental_id, start_time = x01_rental_details_local_start_time,
                            end_time = df_18q1$`01 - Rental Details Local End Time`,
                            bikeid = df_18q1$`01 - Rental Details Bike ID`,
                            tripduration = df_18q1$`01 - Rental Details Duration In Seconds Uncapped`,
                            from_station_id = df_18q1$`03 - Rental Start Station ID`,
                            from_station_name = df_18q1$`03 - Rental Start Station Name`,
                            to_station_id = df_18q1$`02 - Rental End Station ID`,
                            to_station_name = df_18q1$`02 - Rental End Station Name`,
                            usertype = df_18q1$`User Type`,
                            gender = df_18q1$`Member Gender`,
                            birthyear = df_18q1$`05 - Member Details Member Birthday Year`))

## bind
df_18 = rbind(df_18q1, df_18q2, df_18q3, df_18q4)


#2019 data
df_19q1 = read_csv("data\\Divvy_Trips_2019_Q1.csv")
df_19q2 = read_csv("data\\Divvy_Trips_2019_Q2.csv")
df_19q3 = read_csv("data\\Divvy_Trips_2019_Q3.csv")
df_19q4 = read_csv("data\\Divvy_Trips_2019_Q4.csv")

## bind
df_19 = rbind(df_19q1, df_19q2, df_19q3, df_19q4) ##There's an error

#2020 data
df_20q1 = read_csv("data\\Divvy_Trips_2020_Q1.csv")

df_2004 = read_csv("data\\202004-divvy-tripdata.csv")
df_2005 = read_csv("data\\202005-divvy-tripdata.csv")
df_2006 = read_csv("data\\202006-divvy-tripdata.csv")
df_2007 = read_csv("data\\202007-divvy-tripdata.csv")
df_2008 = read_csv("data\\202008-divvy-tripdata.csv")
df_2009 = read_csv("data\\202009-divvy-tripdata.csv")
df_2010 = read_csv("data\\202010-divvy-tripdata.csv")
df_2011 = read_csv("data\\202011-divvy-tripdata.csv")
df_2012 = read_csv("data\\202012-divvy-tripdata.csv")

##2021 data
df_2101 = read_csv("data\\202101-divvy-tripdata.csv")
df_2102 = read_csv("data\\202102-divvy-tripdata.csv")
df_2103 = read_csv("data\\202103-divvy-tripdata.csv")
df_2104 = read_csv("data\\202104-divvy-tripdata.csv")
df_2105 = read_csv("data\\202105-divvy-tripdata.csv")
df_2106 = read_csv("data\\202106-divvy-tripdata.csv")
df_2107 = read_csv("data\\202107-divvy-tripdata.csv")
df_2108 = read_csv("data\\202108-divvy-tripdata.csv")
df_2109 = read_csv("data\\202109-divvy-tripdata.csv")
df_2110 = read_csv("data\\202110-divvy-tripdata.csv")
df_2111 = read_csv("data\\202111-divvy-tripdata.csv")
df_2112 = read_csv("data\\202112-divvy-tripdata.csv")
#bind
df_21  =rbind(df_2101, df_2102, df_2103, df_2104,df_2105, df_2106, df_2107, 
              df_2108, df_2109, df_2110, df_2111, df_2112)

## 2022 data
df_2201 = read_csv("data\\202201-divvy-tripdata.csv")
df_2202 = read_csv("data\\202202-divvy-tripdata.csv")
df_2203 = read_csv("data\\202203-divvy-tripdata.csv")
df_2204 = read_csv("data\\202204-divvy-tripdata.csv")
df_2205 = read_csv("data\\202205-divvy-tripdata.csv")

df_22 = rbind(df_2201, df_2202, df_2203, df_2204, df_2205)

