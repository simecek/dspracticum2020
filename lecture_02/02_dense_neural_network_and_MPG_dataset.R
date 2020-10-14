library(tidyverse)
library(keras)

# Data --------------------------------------------------------------------

url = 'http://archive.ics.uci.edu/ml/machine-learning-databases/auto-mpg/auto-mpg.data'
column_names = c('MPG', 'Cylinders', 'Displacement', 'Horsepower', 'Weight',
                'Acceleration', 'Model Year', 'Origin')

raw_dataset = read_delim(url, na='?', comment='\t', delim=' ', 
                         trim_ws = TRUE, col_names=column_names)

dataset = raw_dataset %>%
  drop_na() %>%
  mutate(Origin = recode(Origin, `1` = 'USA', `2` = 'Europe', `3` = 'Japan')) %>%
  mutate(Origin = model.matrix(~0+Origin))

# split the dataset into two parts (train & test)
smp_size <- round(0.8 * nrow(dataset))
train_ind <- sample(seq_len(nrow(dataset)), size = smp_size)
train_dataset = dataset[train_ind, ]
test_dataset = dataset[-train_ind, ]

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

dnn_horsepower_model = keras_model_sequential() %>%
  layer_dense(units = 64, activation='relu', input_shape = c(1)) %>%
  layer_dense(units = 64, activation='relu') %>%
  layer_dense(units = 1) 
  
summary(dnn_horsepower_model)

dnn_horsepower_model %>% compile(
  loss = 'mean_absolute_error',
  optimizer = optimizer_adam(lr = 0.001)
)

history = dnn_horsepower_model %>% 
  fit(train_features[, "Horsepower", drop=FALSE], 
      as.matrix(train_labels),
      epochs=100,
      # Calculate validation results on 20% of the training data
      validation_split = 0.2)
history
plot(history, smooth = FALSE)

# plot predictions on the train set
train_data_predictions = dnn_horsepower_model %>% 
  predict(train_features[, "Horsepower", drop=FALSE])
cbind(train_features, train_labels, train_data_predictions) %>%
  ggplot() +
    geom_point(aes(x = Horsepower, y = MPG)) +
    geom_line(aes(x = Horsepower, y = train_data_predictions), color="red")

# evaluation on the test set
dnn_horsepower_model %>% 
  evaluate(test_features[, "Horsepower", drop=FALSE],
           as.matrix(test_labels), verbose=0)

