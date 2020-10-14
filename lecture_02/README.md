# Lecture 02

**Date**: Oct 12, 2020

**Slides**: https://docs.google.com/presentation/d/1GYLFhC92AAlAJF_iOilUF-K-UnQn-ebPUxgXTxOl2J8/edit?usp=sharing

* Linear regression (one neuron)
* TF/Keras code template
* What to do with cathegorical features (one-hot encoding)
* NN. Activation function. How to add another layer of neurons?
* How to change linear regression to logistic regression? What about multiclass classification? (softmax, cross-entropy loss)

## Examples

* One neuron, MPG data [[Python](01_one_neuron_and_MPG_dataset.ipynb)], [[R](01_one_neuron_and_MPG_dataset.R)]
* DNN, MPG data [[Python](02_dense_neural_network_and_MPG_dataset.ipynb)], [[R](02_dense_neural_network_and_MPG_dataset.R)]
* DNN, Titanic data [[Python](03_dense_neural_network_and_Titanic_dataset.ipynb)], [[R](03_dense_neural_network_and_Titanic_dataset.R)]

## Asignment 02

Look into [Palmer Archipelago (Antarctica) penguin data](https://www.kaggle.com/parulpandey/palmer-archipelago-antarctica-penguin-data) for `penguins_size.csv`. 

(If you do not like the penguin dataset, try to look for another Kaggle tabular data with a categorical variable to predict.)

Your goal is the following:

* Choose a categorical variable (species, island or sex) as a label
* Split data into training and test sets
* Fit the neural network, plot the evolution of loss and/or accuracy as a number of epoch increases
* Do the final evaluation on the test set
* Upload your code to GitHub and send me the link in the feedback form

**Soft deadline**: Oct 19, 11:00  
**Hard deadline**: Oct 26, 11:00   
**Slack channel**: https://app.slack.com/client/T01C518R2S0/C01CXFG0W9X
