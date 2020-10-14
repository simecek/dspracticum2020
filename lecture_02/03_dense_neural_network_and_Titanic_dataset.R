library(tidyverse)
library(keras)

# Data --------------------------------------------------------------------

url = 'https://web.stanford.edu/class/archive/cs/cs109/cs109.1166/stuff/titanic.csv'
raw_dataset = read_csv(url)
tail(raw_dataset)

features = c('Pclass', 'Sex', 'Age', 'Fare')
label = 'Survived'

dataset = raw_dataset[c(features, label)]
# convert Sex from string to 0/1
dataset[['Sex']] = as.numeric(factor(dataset[['Sex']]))

tail(dataset)

# split the dataset into two parts (train & test)
smp_size <- round(0.8 * nrow(dataset))
train_ind <- sample(seq_len(nrow(dataset)), size = smp_size)
train_dataset = dataset[train_ind, ]
test_dataset = dataset[-train_ind, ]

# there is no tf.keras.layers.experimental.preprocessing
# but we can normalize manually
train_means = apply(train_dataset[features], 2, mean)
train_sds = apply(train_dataset[features], 2, sd)

train_features = scale(train_dataset[features], 
                       center = train_means,
                       scale = train_sds)
test_features = scale(test_dataset[features], 
                       center = train_means,
                       scale = train_sds)
train_labels = train_dataset[label]
test_labels = test_dataset[label]


# Predict Survival from Pclass, Sex, Age and Fare -------------------------

dnn_model = keras_model_sequential() %>%
  layer_dense(units = 100, activation='relu', input_shape = c(4)) %>%
  layer_dense(units = 1) 
  
summary(dnn_model)

dnn_model %>% compile(
  loss = 'binary_crossentropy',
  optimizer = optimizer_adam(lr = 0.001),
  metrics = c('accuracy')
)

history = dnn_model %>% 
  fit(as.matrix(train_features), 
      as.matrix(train_labels),
      epochs=100,
      verbose=0,
      validation_split = 0.2)
history
plot(history, metrics = "accuracy")

# plot predictions on the train set
train_data_predictions = dnn_horsepower_model %>% 
  predict(train_features[, "Horsepower", drop=FALSE])
cbind(train_features, train_labels, train_data_predictions) %>%
  ggplot() +
    geom_point(aes(x = Horsepower, y = MPG)) +
    geom_line(aes(x = Horsepower, y = train_data_predictions), color="red")

# evaluation on the test set
dnn_model  %>% 
  evaluate(as.matrix(test_features),
           as.matrix(test_labels), verbose=0)

