Developing Data Products Peer Assignment
=========================================
Write a shiny application with associated supporting documentation.<br /> 
The documentation should be thought of as whatever a user will need to get started using your application.<br />
Deploy the application on Rstudio's shiny server.<br />
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
When run from computer, this project requires two additional packages:

* shiny
* igraph

It has been tested with R version 3.0.2 (2013-09-25), platform i386-w64-mingw32/i386 (32-bit).

When run on-line, additional packages are not needed, just browse to:

[ShinyApps.io](http://digistam.shinyapps.io/GraphExplorer)

## Scripts
There are three scripts: 

* __ui.R__
* __server.R__
* __global.R__

Download the scripts from this repo.<br /> 
Store the three scripts in your working directory.<br />
Use the ___runApp()___ command to start GraphExplorer

## Dataset
An example dataset is available [on GitHub](https://raw.githubusercontent.com/digistam/ShinyProject/master/GraphExplorer/testgraph.csv)<br />
Save the contents of this example dataset in a (CSV) file and use it as input for Graph Explorer.

