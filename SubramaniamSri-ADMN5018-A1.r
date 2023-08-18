library(dplyr)

#install.packages('nycflights13')

library('nycflights13')



df <- flights
colnames(df)


# Question 1: Find all flights that (5 marks)
# 1.	Had an arrival delay of two or more hours
filter(df, arr_delay>=2)

# 2.	Flew to Houston (IAH or HOU)
filter(df, dest=="IAH" | dest=="HOU" )

# 3.	Were operated by United, American, or Delta
filter(df, carrier== "UA"  | carrier== "AA" | carrier=="DA" )

# 4.	Departed in summer (July, August, and September)
filter(df, month == 7 | month== 8 | month==9)

# 5.	Arrived more than two hours late, but didn’t leave late
filter(df, arr_delay>=2 & dep_delay==0 )


# Question 2 (3 marks)
# 1.	Sort flights to find the most delayed flights (arrival delays).
df %>% arrange(desc(arr_delay))

# 2.	Which flights travelled the farthest? Which travelled the shortest? Answer by sorting the flights dataset is descending order of flight distance. 
print("Flight travelling Farthest:") 
head(df %>% arrange(desc(distance)),1) # Flight Travelled the farthest -> head(..., 1 ) gives the first value
print("Flight travelling Shortest:") 
tail(df %>% arrange(desc(distance)),1) # Flight Travelled the shortest -> tail(..., 1) gives the last value

# Question 3 (2 marks) 
# 1.	Create a new variable and call it Computed_Speed. This new variable will show flight speed in distance/minute unit.  
df <- mutate(df, Computed_Speed = distance / air_time )
head(df$Computed_Speed)
