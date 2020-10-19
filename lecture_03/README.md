# Lecture 03

**Date**: Oct 19, 2020

**Slides**: https://docs.google.com/presentation/d/1pO3INv_cQAKr1Hz7KBEgIYDYW4gxIn1EWQZec3rQCmQ/edit?usp=sharing

* Introduction to Image Analysis, Fashion MNIST dataset
* New layers: Conv2D layer, MaxPooling layer and Dropout
* Underfitting, Overfitting
* Large models, brief intro into fine tuning

**Recommended materials**:

* CNN explained, https://medium.com/technologymadeeasy/the-best-explanation-of-convolutional-neural-networks-on-the-internet-fbb8b1ad5df8

* Introducing convolutional neural networks (ML Zero to Hero video),  https://www.youtube.com/watch?v=x_VrgWTKkiM

## Examples

* DNN and CNN applied to [Fashion MNIST](https://github.com/zalandoresearch/fashion-mnist) dataset [[Python](mnist_fashion_keras.ipynb)], [[R](mnist-fashion-keras.r)], [[IPython Notebook](mnist_fashion_keras.py)], [[R Notebook](mnist-fashion-keras-r.ipynb)]

The example got a lot of inspiration and code from [Dokato's Gist](https://gist.github.com/dokato/823eb947989d5203205788d50f769766) and this [Tensorflow tutorial](https://www.tensorflow.org/tutorials/keras/classification).

## Asignment 03

* Play a bit with the model architecture, learning rate and other parameters. Train only for 10 epochs but try to get as high accuracy as possible. (Do not waste too much time on this step)

* Calculate the [confusion matrix](https://en.wikipedia.org/wiki/Confusion_matrix) for your model. Which pair of fashion items is the most often misclassified.

* Plot top 16 predictions that are wrong but the model is very sure about them (e.g. model is almost sure the image is T-shirt but actually those are trousers). Do they share a common pattern?

* *Extra credit*: Train a classifier that is not a neural network (kNN, correlation to averaged image, ...).  
 
**Deadline**: Oct 26, 11:00   
**Slack channel**: https://app.slack.com/client/T01C518R2S0/C01CS5Z0DCM/thread/C01BZ2DKPMZ-1603107037.013600