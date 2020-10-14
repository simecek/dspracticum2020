library(tidyverse)
library(keras)

# Data --------------------------------------------------------------------

url = 'http://archive.ics.uci.edu/ml/machine-learning-databases/auto-mpg/auto-mpg.data'
column_names = c('MPG', 'Cylinders', 'Displacement', 'Horsepower', 'Weight',
                'Acceleration', 'Model Year', 'Origin')

raw_dataset = read_delim(url, na='?', comment='\t', delim=' ', 
                         trim_ws = TRUE, col_names=column_names)

dataset = drop_na(raw_dataset)
tail(dataset)

# split the dataset into two parts (train & test)
smp_size <- round(0.8 * nrow(dataset))
train_ind <- sample(seq_len(nrow(dataset)), size = smp_size)
train_dataset = dataset[train_ind, ]
test_dataset = dataset[-train_ind, ]

dim(train_dataset)
dim(test_dataset)

# there is no tf.keras.layers.experimental.preprocessing
# but we can normalize manually
label_col = column_names[1]  # MPG
feature_cols = column_names[-1] # everything except MPG

train_means = apply(train_dataset[feature_cols], 2, mean)
train_sds = apply(train_dataset[feature_cols], 2, sd)

train_features = scale(train_dataset[feature_cols], 
                       center = train_means,
                       scale = train_sds)
test_features = scale(test_dataset[feature_cols], 
                       center = train_means,
                       scale = train_sds)
train_labels = train_dataset[label_col]
test_labels = test_dataset[label_col]

# Predict MPG (miles per gallon) from Horsepower --------------------------

ggplot(dataset, aes(x=Horsepower, y=MPG)) + 
  geom_point() +
  theme_bw()

horsepower_model = keras_model_sequential() 
horsepower_model %>%
  layer_dense(units = 1, input_shape = c(1))
summary(horsepower_model)

horsepower_model %>% compile(
  loss = 'mean_absolute_error',
  optimizer = optimizer_adam(lr = 0.1)
)

history = horsepower_model %>% 
  fit(train_features[, "Horsepower", drop=FALSE], 
      as.matrix(train_labels),
      epochs=100,
      # suppress logging
      verbose=0,
      # Calculate validation results on 20% of the training data
      validation_split = 0.2)
history
plot(history, smooth = FALSE)

# plot test predictions
test_data_predictions = horsepower_model %>% 
  predict(test_features[, "Horsepower", drop=FALSE])
cbind(test_features, test_labels, test_data_predictions) %>%
  ggplot() +
    geom_point(aes(x = Horsepower, y = MPG)) +
    geom_line(aes(x = Horsepower, y = test_data_predictions), color="red")

# evaluation on the test set
horsepower_model %>% 
  evaluate(test_features[, "Horsepower", drop=FALSE],
           as.matrix(test_labels), verbose=0)


# Predict MPG (miles per gallon) from Other Features ----------------------

pairs(dataset[,1:4])
t(summary(dataset))

# model definition
linear_model = keras_model_sequential() 
linear_model %>%
  layer_dense(units = 1, input_shape = c(ncol(train_features)))
summary(linear_model)

# you can even do prediction from (untrained) model or look what is his weights
predict(linear_model, as.matrix(test_features[1:10,,drop=FALSE]))

# parameters (weights and bias)
linear_model[['layers']][[1]]['kernel']
linear_model[['layers']][[1]]['bias']

linear_model %>% compile(
  loss = 'mean_absolute_error',
  optimizer = optimizer_adam(lr = 0.1)
)

history = linear_model %>% 
  fit(as.matrix(train_features),
      as.matrix(train_labels),
      epochs=100,
      # suppress logging
      verbose=0,
      # Calculate validation results on 20% of the training data
      validation_split = 0.2)
history
plot(history, smooth=FALSE)
