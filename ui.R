library(shiny)
library(ggplot2)

# Define UI for shinyClusters application
shinyUI(fluidPage(

     # Application title
     titlePanel("Let's find some Clusters"),
     conditionalPanel("input.Help==0",helpText("Use the two drop down selectors to choose the iris data to plot on the x and y axes, then decide how many clusters, between 1 and 10, should be found and move the slider accordingly. You can compare the kmeans cluster algorithm to the actual species clusters by clicking the actual checkbox. The top plot shows the iris data with the various identified clusters indicated by different colors. The bottom plot shows the total within cluster sum of squares as the number of clusters increases. A leveling out of this plot can typically indicate a good cluster choice around the elbow"),helpText("For more information see",a("Shiny Clusters",href="http://cpmontoya.github.io/ClusterPitch",target="_blank"))),
     sidebarLayout(
          sidebarPanel(
               checkboxInput("Help", label = "Hide the help text?", value = FALSE),
               selectInput("selectY",label="Select the data to plot on the y-axis",choices=colnames(iris)[-length(colnames(iris))],selected="Sepal.Width"),
               selectInput("selectX",label="Select the data to plot on the x-axis",choices=colnames(iris)[-length(colnames(iris))],selected="Petal.Length"),
               sliderInput("kguess", label = "Enter the number of clusters to find",min = 1,max = 10, value = 1),
               checkboxInput("Actual", label = "Show Actual Clusters", value = FALSE)
          ),
          mainPanel(
               plotOutput('newPlot'),
               textOutput("text1"),
               plotOutput('wssPlot')
          )
     )
))