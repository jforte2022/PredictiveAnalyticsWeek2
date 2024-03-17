housing.df <- read.csv("WestRoxbury.csv", header = TRUE) # load data
dim(housing.df) # find the dimension of data frame
head(housing.df) # show the first six rows
# View(housing.df) # show all the data in a new tab

# Practice showing different subsets of the data
# housing.df[1:10, 1] # show the first 10 rows of the first column only
# housing.df[1:10, ] # show the first 10 rows of each of the columns
# housing.df[5, 1:10] # show the fifth row of the first 10 columns
# housing.df[5, c(1:2, 4, 8:10)] # show the fifth row of some columns
# housing.df[, 1] # show the whole first column
# housing.df$TOTAL_VALUE # a different way to show the whole first column
housing.df$TOTAL_VALUE[1:10] # show the first 10 rows of the first column
length(housing.df$TOTAL_VALUE) # find the length of the first column

# I needed to add the following lines to make the next step work properly.
housing.df$TOTAL_VALUE <- gsub(",", "", housing.df$TOTAL_VALUE)
housing.df$TOTAL_VALUE <- as.numeric(housing.df$TOTAL_VALUE)

mean(housing.df$TOTAL_VALUE, na.rm = TRUE) # find the mean of the first column
summary(housing.df) # find summary statistics for each column

# random sample of 5 observations
s <- sample(row.names(housing.df), 5)
housing.df[s,]
# oversample houses with over 10 rooms
s <- sample(row.names(housing.df), 5, prob = ifelse(housing.df$BED_RMS>10, 0.9, 0.01))
housing.df[s,]

housing.df[4:12, 2]

mean(housing.df$FULL_BTH)

mean(housing.df$YR_REMODEL)
