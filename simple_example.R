reticulate::use_condaenv("neural_prophet", required = TRUE)

library(reticulate)
library(tidyverse)

df = read_csv('C:/Users/Surface/Documents/neural_prophet/example_data/retail_sales.csv')

train <- df %>% 
  filter(ds < '2014-01-01')

test <- df %>%
  filter(ds >= '2014-01-01')

neuralprophet <- import('neuralprophet')
np <- import('numpy')

m <- neuralprophet$NeuralProphet()

m$fit(train, freq = "M")

future <- m$make_future_dataframe(df, periods = 10L)
