
library(ggplot2)

df <- EuStockMarkets

df<-df[1:100,]


df<-as.data.frame(df, row.names = NULL, optional = FALSE,
              make.names = TRUE,
              stringsAsFactors = default.stringsAsFactors())



################################################################################################

#   BOXPLOT

pl <- ggplot(df, aes(x=as.factor("DAX"),y=DAX)) 
  
pl + geom_boxplot(orientation = ,notch = TRUE, outlier.colour = 'red', outlier.size = 20) +
  labs(title = "EU STOCK MARKET - DAX", 
       x = "DAX", 
       y = "Index - DAX") + coord_flip()

# COMMENTS : 2 ouliers identified from the DAX index (German Stock Maket)
#                 where index levels were below 1550 points
#              And it is a Left Skewed Distribution
################################################################################################

#   Scatter Plot

pl <- ggplot(df, aes(x = DAX, y = FTSE)) 
pl+ geom_point(aes(color=FTSE)) +
  labs(title = "Scatter plot of DAX vs FMI", 
       x = "DAX", 
       y = "FMI")  + scale_color_gradient(high = 'green', low = 'red')

# COMMENT : NO obvious linear relationship - but a +ve slope linear relation identified
#   OUTlier seen w.r.t DAX-FTSE below 1550 levels
################################################################################################

#Histogram

pl <- ggplot(df, aes(x = DAX)) 
pl+ geom_histogram(binwidth = 5, fill = "blue", color = "black", bins = 3) +
  labs(title = "Histogram of DAX")

#   COMMENT : MOST frequent in bins>1600
# LEFT SKEWED
# OUTLIER SEEN at 1500
################################################################################################

# Line-Graph
len = (1:100)

pl<-ggplot(df, aes(x=len,y=DAX))
pl+geom_line()+labs(title = "Line plot of DAX over time range (1-100)", x="time->",y="DAX Points")


# COMMENT : DAX CRASHED on time : 37.5(in X-axis)
# Dipped after 75 but recovered back above 1600
################################################################################################