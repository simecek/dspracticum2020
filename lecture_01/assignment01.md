# Assignment 01

**Due to**: Oct 12, 11:00  

The main goal of this assignment is to get ready for future lectures.

## Kaggle

Sign up for [Kaggle](https://www.kaggle.com/) account and download *train.csv* of [House Prices](https://www.kaggle.com/c/house-prices-advanced-regression-techniques/data) dataset. 

Get familiar with the data and make a basic exploratory analysis. It could be a table with mean prices per some grouping, correlations between variables, density plot of the sold price... Nothing complicated, be creative! If you really do not know, check what [other people did](https://www.kaggle.com/c/house-prices-advanced-regression-techniques/notebooks) at Kaggle.

## GitHub

Learn to use GitHub (and sign up for the account if you do not have one yet). 

Working with git (open-source tool to manage source-code) and GitHub (a cloud-based hosting service that lets you manage git repositories) can be frustrating for the beginners but it is important to be able to share your work with the others.

Start small. Look around the internet. 

* GitHub desktop client, https://desktop.github.com/
* Simple guide for getting started with command line tool, https://rogerdudler.github.io/git-guide/
* If you like RStudio, you can push to GitHub from RStudio, https://happygitwithr.com/new-github-first.html, or from [VScode](https://code.visualstudio.com/docs/editor/github) or most of other code editors

Take your script with House Prices exploratory analysis and **push it to GitHub** (create a new repository for it).

## Feedback

Do not forget to send me a form with your Kaggle & Git names and other feedback.

## Set up your R or Python environment with TensorFlow & Keras

You can install TensorFlow for your local [Python](https://www.tensorflow.org/install) or [R](https://tensorflow.rstudio.com/installation/). However, I recommend to use one of the cloud services mentioned in the lecture.


### Colaboratory (Python)

**Link:** https://colab.research.google.com/

TensorFlow is already pre-installed, so all you have to do is to put `import tensorflow as tf` and `import keras` into the first cell of your notebook.

If you want to use GPU, go to the menu and select `Runtime -> Change runtime type -> Hardware accelerator -> GPU`

### RStudio Cloud (R)

**Link:** https://rstudio.cloud/

First install R packages as follows

```
install.packages('reticulate')
install.packages('keras')
```

Next, install Keras itself 
```
library(reticulate)
library(keras)
virtualenv_create("myenv")

use_virtualenv("myenv", required=TRUE)
install_tensorflow(method="virtualenv", envname="myenv", version="2.0.0")
```
Finally, test that everything was set up correctly 

```
library(tensorflow)
use_virtualenv("myenv", required=TRUE)
tf$constant("Hello Tensorflow")
```

There are no GPUs in RStudio Cloud.

### Kaggle (R & Python)

**Link:** https://www.kaggle.com/c/house-prices-advanced-regression-techniques/notebooks

Click on "New Notebook" button. Select R or Python. If you need GPU, select it in the advanced setting.

Kaggle kernels have TensorFlow preinstalled, so `library(tensorflow)` or `install tensorflow as tf` is all you need to do.

### GSuite (Optional)

**Link:** https://www.kaggle.com/c/house-prices-advanced-regression-techniques/notebooks

I recommend you to sign up for the Masaryk University GSuite account, particularly if you work with Colaboratory. It comes with (almost) unlimited [Google Drive](https://drive.google.com/) to store all your data. 