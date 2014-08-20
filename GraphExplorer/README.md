Developing Data Products Peer Assignment
=========================================
Write a shiny application with associated supporting documentation. 

The documentation should be thought of as whatever a user will need to get started using your application.

Deploy the application on Rstudio's shiny server.
Share your server.R and ui.R code on github

The application must include the following:

* Some form of input (widget: textbox, radio button, checkbox, ...)
* Some operation on the ui input in sever.R
* Some reactive output displayed as a result of server calculations
* You must also include enough documentation so that a novice user could use your application.
* The documentation should be at the Shiny website itself. Do not post to an external link.

## Introduction
Social network analysis (SNA) is the use of network theory to analyse social networks. Social network analysis views social relationships in terms of network theory, consisting of nodes, representing individual actors within the network. These networks are often depicted in a Graph, where nodes (or vertices) are represented as points and edges are represented as lines.

__Graph explorer__, a web application running on the Shiny server framework, takes a CSV file with nodes as input. The output is a visual analysis of connections and degrees.

## Requirements
This project requires two additional packages:

* shiny
* igraph

It has been tested with R version 3.0.2 (2013-09-25), platform i386-w64-mingw32/i386 (32-bit).
## Scripts
There is one script: __run_analysis.R__. Download the script from this repo. You can [source the script](http://www.dummies.com/how-to/content/how-to-source-a-script-in-r.html), after which the following functions are available within your R environment.
* _getUCIData()_
* _getUCIDataWin()_
* _run_analysis()_

## Dataset
Execute the function __getUCIData()__ in order to download the 
[dataset (zip file)](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) and have the files extracted into a subfolder named "__dataset__". 
In case of a *"nonzero exit status"* warning (for example on Windows machines), you can use the *__getUCIDataWin()__* function in order to download and unzip the dataset.

## Analysis
__run_analysis.R__ and the "__dataset__" folder have to be stored in the same directory. Set this directory as "__working directory__" in R Gui / RStudio. After the dataset is available, execute the run_analysis() function to do the actual analysis.

## Result
The analysis results in two comma separated files in the working directory:
* __tidydata.txt__ (all values, 10MB)
* __avgdata.txt__ (average values, 12kb)

Read 'm into R with:

> dataset1 <- read.csv("./tidydata.txt"); dataset2 <- read.csv("./avgdata.txt")

Dataset labels are explained in __codeBook.md__.
