# Lecture 09

**Date**: Nov 30, 2020

**Slides**: https://docs.google.com/presentation/d/1fPOV7vU5Lz_-G-rkj-fP95RjM-A_tDt6Kh1YVYvCzUo/edit?usp=sharing

* Recommenders / Collaborative filtering
* Optimizers
* Cloud & docker

## Examples (on the lesson)

* [Collaborative filtering Rmd notebook](https://rstudio-conf-2020.github.io/dl-keras-tf/notebooks/collaborative-filtering.nb.html) (R) from [Brad Boehmke's workshop](https://education.rstudio.com/blog/2020/05/conf20-dl/) at rstudio::conf 2020
* [Collaborative filtering post at RStudio blog](https://blogs.rstudio.com/ai/posts/2018-09-26-embeddings-recommender/) (R) by Sigrid Keydana
* [TF Recommenders tutorial](https://www.tensorflow.org/recommenders/examples/quickstart) (Python)

## Videos

* [Collaborative filtering in Excel](https://youtu.be/qqt3aMPB81c?t=4046)

## Additional materials - optimizers

* [Visual explanation](https://towardsdatascience.com/a-visual-explanation-of-gradient-descent-methods-momentum-adagrad-rmsprop-adam-f898b102325c)
* Chapter 11 in [Hands On ML...](https://github.com/yanshengjia/ml-road/blob/master/resources/Hands%20On%20Machine%20Learning%20with%20Scikit%20Learn%20and%20TensorFlow.pdf)

## Asignment 09

The goal is to train a recommender system. Input data is a table with `N` rows and `M` collumns where `N` is the number of the people evaluating tweets and `M` is the number of the tweets in the dataset. The score scale goes from 1 (worst) to 7 (best), `NA` is used for the missing values (if the person did not evaluated the tweet). The output should be the table of the same size where `NA`s are replaced by the estimates of the score.

First, to collect data, please, fill in http://simecek.xyz/pytips/shiny_app2/?campaign=m7datasp.

Before enough data is collected, you can train on the fake data [here](assignment/). 

