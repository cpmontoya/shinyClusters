library(shiny)

# Define UI for miles per gallon application
shinyUI(fluidPage(

     # Application title
     titlePanel("Let's find some Clusters"),
     sidebarLayout(
          sidebarPanel(
               selectInput("selectY",label="Select the data to plot on the y-axis",choices=colnames(iris),selected="Sepal.Width"),
               selectInput("selectX",label="Select the data to plot on the x-axis",choices=colnames(iris),selected="Petal.Length")
          ),
          mainPanel(
               plotOutput('newPlot'),
               textOutput("text1")
          )
     )
))