library(tidyverse) # metapackage of all tidyverse packages
library(keras)

list.files(path = "../input/fashionmnist")

train.data <- read_csv("../input/fashionmnist/fashion-mnist_train.csv",
                       col_types = cols(.default = "i"))
test.data <- read_csv("../input/fashionmnist/fashion-mnist_test.csv",
                      col_types = cols(.default = "i"))

names(train.data)

dim(train.data)
dim(test.data)

# Data is 28 pixels big in width and height
img_rows <- img_cols <- 28

#' Data is transformed to matrix (because they are easier indexable) and  pixels
#' are separated from labels.
x_train <- as.matrix(train.data[, 2:dim(train.data)[2]])
y_train <- as.matrix(train.data[, 1])
# Unflattening the data.
dim(x_train) <- c(nrow(x_train), img_rows, img_cols, 1) 

# The same for test set.
x_test <- as.matrix(test.data[, 2:dim(train.data)[2]])
y_test <- as.matrix(test.data[, 1])
dim(x_test) <- c(nrow(x_test), img_rows, img_cols, 1)

clothes.labels <- c("T-shirt/top", "Trouser", "Pullover", "Dress", "Coat",
                    "Sandal", "Shirt", "Sneaker", "Bag", "Ankle boot")

# Function to rotate matrices
rotate <- function(x) t(apply(x, 2, rev))

# Function to plot image from a matrix x
plot_image <- function(x, title = "", title.color = "black") {
  dim(x) <- c(img_rows, img_cols)
  image(rotate(rotate(x)), axes = FALSE,
        col = grey(seq(0, 1, length = 256)),
        main = list(title, col = title.color))
}

# We plot 16 cherry-picked images from the training set
par(mfrow=c(4, 4), mar=c(0, 0.2, 1, 0.2))
for (i in 1:16) {
  nr <- i * 10
  plot_image(x_train[nr,,,1],
             clothes.labels[as.numeric(train.data[nr, 1] + 1)])
}

# Normalize values from [0, 255] to [0, 1] interval
x_train <- x_train / 255
x_test <- x_test / 255

# Convert class vectors to binary class matrices
num_classes <- 10
y_train <- to_categorical(y_train, num_classes)
y_test <- to_categorical(y_test, num_classes)

# model definition
model <- keras_model_sequential()

model %>%
  layer_flatten(input_shape = c(28, 28)) %>%
  layer_dense(units = 128, activation = 'relu') %>%
  layer_dense(units = 64, activation = 'relu') %>%
  layer_dense(units = 10, activation = 'softmax')

model %>% compile(
  loss = loss_categorical_crossentropy, # if label is given as an integer, use loss_sparse_categorical_crossentropy
  optimizer = optimizer_adam(),
  metrics = c('accuracy')
)

model

history = model %>% fit(
  x_train, y_train,
  batch_size = 256,
  epochs = 20,
  validation_data = list(x_test, y_test)
)

plot(history)

history

input_shape <- c(img_rows, img_cols, 1)

model <- keras_model_sequential()
model %>%
  layer_conv_2d(filters = 32, kernel_size = c(3,3), activation = 'relu',
                input_shape = input_shape) %>%
  layer_dropout(rate = 0.5) %>%
  layer_conv_2d(filters = 32, kernel_size = c(3,3), activation = 'relu') %>%
  layer_flatten() %>%
  layer_dense(units = 128, activation = 'relu') %>%
  layer_dropout(rate = 0.5) %>%
  layer_dense(units = num_classes, activation = 'softmax')

# compile model
model %>% compile(
  loss = loss_categorical_crossentropy,
  optimizer = optimizer_adam(),
  metrics = c('accuracy')
)

model

# train and evaluate
history <- model %>% fit(
  x_train, y_train,
  batch_size = 256,
  epochs = 20,
  verbose = 1,
  validation_data = list(x_test, y_test)
)

plot(history)

history
