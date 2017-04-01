# Exercise 5: DPLYR Grouped Operations

# Install the `nycflights13` package. Load (`library()`) the package.
# You'll also need to load `dplyr`
#install.packages("nycflights13")  # should be done already
library(nycflights13)
library(dplyr)

# What was the average department delay in each month?
# Save this as a data frame `dep.delay.by.month`
# Hint: you'll have to perform a grouping operation before summarizing your data
dep.delay.by.month <- group_by(flights, month) %>%
                      summarize(avg_dept_delay = mean(dep_delay, na.rm = TRUE))

# Which month had the greatest average departure delay?
greatest.month.delay <- filter(dep.delay.by.month, avg_dept_delay == max(avg_dept_delay)) %>%
                        select(month)

# If your above data frame contains the columns "month", and "delay", you can create
# a scatterplot by passing that data frame to the 'plot()' function
plot(dep.delay.by.month)

# To which destinations were the average arrival delays the highest?
# Hint: you'll have to perform a grouping operation before summarizing your data
destination.arr.delay <- group_by(flights, dest) %>%
                         summarize(avg_arr_delay = mean(arr_delay, na.rm = TRUE))
                         
destination.highest.delay <- filter(destination.arr.delay, avg_arr_delay == !is.nan(avg_arr_delay) && avg_arr_delay == max(avg_arr_delay))
# You can look up these airports in the `airports` data frame!


### Bonus ###
# Which city was flown to with the highest average speed?