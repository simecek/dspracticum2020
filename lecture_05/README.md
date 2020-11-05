# Lecture 05

**Date**: Nov 2, 2020

**Slides**: https://docs.google.com/presentation/d/1Cwq4G0EHxLUaOlKT3loy5rtImFhl8zODjnRPPwJ_664/edit?usp=sharing

* Wrap-up of Transfer Learning
* You have trained your model, what's next? (deployment)
* GitHub Pages + TensorFlow JS (TFjs)
* Other possibilities (ipywidget+voila, R/Shiny, Flask, ...)
* Back to the basics: Backpropagation

## Examples

* Updated [transfer learning notebook](Transfer_Learning_DogsAndCats.ipynb) on dogs and cats data. 
* The exported model has been copied into [docs/export_model](../docs/export_model) folder
* The app is available at [simecek.github.io/dspracticum2020](http://simecek.github.io/dspracticum2020)

## How to create image dataset from the web?
* For Bing Image Seach, get Azure account and [Bing Search API](https://www.microsoft.com/en-us/bing/apis/bing-web-search-api) key for *Bing Image Search* (it is free for 7 days but you need to provide a credit card). Fill in the api key into [Image_Downloader.ipynb](Image_Downloader.ipynb) and run it.
* Alternatively, [SerpAPI](https://serpapi.com/) seems also interesting and for hundereds of images seems to be possible to use it in a [playground](https://serpapi.com/playground) mode.

## Asignment 05

Take the dataset you have created last time, train the model and deploy the app. Try to find examples your app misclasified and explain why.

If you want to use TFjs + GitHubPages, then copy [docs](docs/) into your repo and then...

* Replace all files in [export_model](docs/export_model/) subfolder by [your TFjs model](https://www.tensorflow.org/js/tutorials/conversion/import_keras). Push your repo to GitHub.
* Modify [index.js](docs/index.js) to load your model and use your label names.
* In settings of your repo, find GitHub Pages. Set them to the master branch and `\docs` folder.
* Wait a minute and test. The URL of your app is in the settings (it shoud be YOURNAME.github.io/YOUR_REPO_NAME)

**Deadline**: Nov 9, 11:00   