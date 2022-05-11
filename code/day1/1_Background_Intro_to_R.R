# Intro to R for Telemetry Summaries ---------------------------------
# FACT workshop 2022-05
# Instructors: Naomi Tress and  Jon Pye

#install.packages("readxl")
#install.packages("viridis")
#install.packages("lubridate")
#install.packages("ggmap")
#install.packages("plotly")
#install.packages("tidyverse")  

library(tidyverse) # really neat collection of packages! https://www.tidyverse.org/

#make sure to read all "mask" messages

setwd('C:/Users/path/to/data') #set folder you're going to work in
getwd() #check working directory

#Ensure that all the files from setup instructions were UNZIPPED

## Operators ---------------------------------

3 + 5 #maths! including - , *, /

weight_kg <- 55 # assignment operator! for objects/variables. shortcut: alt + - 
weight_kg

weight_lb <- 2.2 * weight_kg # can assign output to an object. can use objects to do calculations

# Challenge 1:
# if we change the value of weight_kg to be 100, does the value of weight_lb also change automatically?
# remember: you can check the contents of an object by simply typing out its name



## Functions ---------------------------------

ten <- sqrt(weight_kg) #contain calculations wrapped into one command to type. 
#functions take "arguments": you have to tell them what to run their script against

round(3.14159) #don't have to assign

args(round) #the args() function will show you the required arguments of another function

?round #will show you the full help page for a function, so you can see what it does, 
#what argument it takes etc.

#Challenge 2: can you round the value 3.14159 to two decimal places?
# using args() should give a clue!



## Vectors and Data Types ---------------------------------

weight_g <- c(21, 34, 39, 54, 55) #use the combine function to join values into a vector object

length(weight_g) #explore vector
class(weight_g) #a vector can only contain one data type
str(weight_g) #find the structure of your object.
#our vector is numeric. 
#other options include: character (words), logical (TRUE or FALSE), integer etc.

animals <- c("mouse", "rat", "dog") #to create a character vector, use quotes


#Challenge 3: what data type will this vector become? You can check using class()
#challenge3 <- c(1, 2, 3, "4")



#R will convert (force) all values in a vector to the same data type.
#for this reason: try to keep one data type in each vector
#a data table / data frame is just multiple vectors (columns)
#this is helpful to remember when setting up your field sheets!

## Subsetting ------------------------------------------

animals #calling your object will print it out
animals[2] #square brackets = indexing. selects the 2nd value in your vector

weight_g > 50 #conditional indexing: selects based on criteria
weight_g[weight_g <=30 | weight_g == 55] #many new operators here!  
#<= less than or equal to, | "or", == equal to
# Also available are >=, greater than or equal to; 
# < and > for less than or greater than (no equals); 
# and & for "and". 
weight_g[weight_g >= 30 & weight_g == 21] #  >=  greater than or equal to, & "and"
# this particular example give 0 results - why?


## Missing Data ---------------------------------

heights <- c(2, 4, 4, NA, 6)
mean(heights) #some functions cant handle NAs
mean(heights, na.rm = TRUE) #remove the NAs before calculating

#other ways to get a dataset without NAs:

heights[!is.na(heights)] #select for values where its NOT NA 
#[] square brackets are the base R way to select a subset of data --> called indexing
#! is an operator that reverses the function

na.omit(heights) #omit the NAs

heights[complete.cases(heights)] #select only complete cases

#Challenge 4: 
#1. Using this vector of heights in inches, create a new vector, heights_no_na, with the NAs removed.
#heights <- c(63, 69, 60, 65, NA, 68, 61, 70, 61, 59, 64, 69, 63, 63, NA, 72, 65, 64, 70, 63, 65)
#2. Use the function median() to calculate the median of the heights vector.
#BONUS: Use R to figure out how many people in the set are taller than 67 inches.


## Exploring Detection Extracts ---------------------------------
# what is a detection extract? https://members.oceantrack.org/data/otn-detection-extract-documentation-matched-to-animals 

#imports file into R. paste the filepath to the unzipped file here!

tqcs_matched_2010 <- read_csv("tqcs_matched_detections_2010.zip", guess_max = 117172)

#read_csv() is from tidyverse's readr package --> you can also use read.csv() from base R but it created a dataframe (not tibble) so loads slower
#see https://link.medium.com/LtCV6ifpQbb 

#Note that the 'guess_max' argument can be useful if you have data that starts with a lot of null values.

head(tqcs_matched_2010) #first 6 rows
View(tqcs_matched_2010) #can also click on object in Environment window
str(tqcs_matched_2010) #can see the type of each column (vector)
glimpse(tqcs_matched_2010) #similar to str()

#summary() is a base R function that will spit out some quick stats about a vector (column)
#the $ syntax is the way base R selects columns from a data frame

summary(tqcs_matched_2010$latitude)

#Challenge 5: 
#1. What is is the class of the station column in tqcs_matched_2010?
#2. How many rows and columns are in the tqcs_matched_2010 dataset?


## Data Manipulation with dplyr --------------------------------------

library(dplyr) #can use tidyverse package dplyr to do exploration on dataframes in a nicer way

# %>% is a "pipe" which allows you to join functions together in sequence. 
#it can be read as "and then". shortcut: ctrl + shift + m

tqcs_matched_2010 %>% dplyr::select(6) #selects column 6

# dplyr::select this syntax is to specify that we want the select function from the dplyr package. 
#often functions are named the same but do diff things

tqcs_matched_2010 %>% slice(1:5) #selects rows 1 to 5 in the dplyr way
# Take tqcs_matched_2010 AND THEN slice rows 1 through 5.

tqcs_matched_2010 %>% 
  distinct(detectedby) %>% nrow #number of arrays that detected my fish in dplyr!

tqcs_matched_2010 %>% 
  distinct(catalognumber) %>% 
  nrow #number of animals that were detected 

tqcs_matched_2010 %>% filter(catalognumber=="TQCS-1049258-2008-02-14") #filtering in dplyr!

tqcs_matched_2010 %>% filter(monthcollected >= 10) #all dets in/after October of 2010
#get the mean value across a column using GroupBy and Summarize

tqcs_matched_2010 %>%
  group_by(catalognumber) %>%  #we want to find meanLat for each animal
  summarise(MeanLat=mean(latitude)) #uses pipes and dplyr functions to find mean latitude for each fish. 
#we named this new column "MeanLat" but you could name it anything

#Challenge 6: 
#1. find the max lat and max longitude for animal "TQCS-1049258-2008-02-14".
#2. find the min lat/long of each animal for detections occurring in July.

## Joining Detection Extracts

tqcs_matched_2011 <- read_csv("tqcs_matched_detections_2011.zip", guess_max = 41880) #Import 2011 detections

tqcs_matched_10_11_full <- rbind(tqcs_matched_2010, tqcs_matched_2011) #join the two files

#release records for animals often appear in >1 year, this will remove the duplicates

tqcs_matched_10_11_full <- tqcs_matched_10_11_full %>% distinct()

View(tqcs_matched_10_11_full) 

tqcs_matched_10_11 <- tqcs_matched_10_11_full %>% slice(1:100000)  #subset our example data to help this workshop run smoother!

## Dealing with Datetimes in lubridate ---------------------------------

library(lubridate) 

tqcs_matched_10_11 %>% mutate(datecollected=ymd_hms(datecollected)) #Tells R to treat this column as a date, not number numbers

#as.POSIXct(tqcs_matched_10_11$datecollected) #this is the base R way - if you ever see this function

#lubridate is amazing if you have a dataset with multiple datetime formats / timezone
#the function parse_date_time() can be used to specify multiple date formats if you have a dataset with mixed rows
#the function with_tz() can change timezone. accounts for daylight savings too!

#example code to change timezone:
#My_Data_Set %>% mutate(datetime = ymd_hms(datetime, tz = "America/Nassau")) #change your column to a datetime format, specifying TZ (eastern)
#My_Data_Set %>% mutate(datetime_utc = with_tz(datetime, tzone = "UTC")) #make new column called datetime_utc which is datetime converted to UTC


## Plotting with ggplot2 ---------------------------------

# basic formula:
# ggplot(data = <DATA>, mapping = aes(<MAPPINGS>)) +  <GEOM_FUNCTION>()

library(ggplot2) #tidyverse-style plotting, a very customizable plotting package


# Assign plot to a variable
tqcs_10_11_plot <- ggplot(data = tqcs_matched_10_11,
                                     mapping = aes(x = latitude, y = longitude)) #can assign a base plot to data

# Draw the plot 
tqcs_10_11_plot + 
  geom_point(alpha=0.1, 
             colour = "blue") 
#layer whatever geom you want onto your plot template
#very easy to explore diff geoms without re-typing
#alpha is a transparency argument in case points overlap

tqcs_matched_10_11 %>%  
  ggplot(aes(latitude, longitude)) + #aes = the aesthetic/mappings. x and y etc.
  geom_point() #geom = the type of plot

tqcs_matched_10_11 %>%  
  ggplot(aes(latitude, longitude, colour = receiver_group)) + #colour by receiver group! specify in the aesthetic
  geom_point()

#anything you specify in the aes() is applied to the actual data points/whole plot, 
#anything specified in geom() is applied to that layer only (colour, size...). sometimes you have >1 geom layer so this makes more sense!

#Challenge 7: try making a scatterplot showing the lat/long for animal "TQCS-1049258-2008-02-14", 
# coloured by detection array

tqcs_matched_10_11  %>%  
  filter(catalognumber=="TQCS-1049258-2008-02-14") %>% 
  ggplot(aes(latitude, longitude, colour = receiver_group)) + 
  geom_point()

#Question: what other geoms are there? Try typing `geom_` into R to see what it suggests!
