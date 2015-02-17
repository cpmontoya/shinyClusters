library(shiny)

# Define UI for miles per gallon application
shinyUI(fluidPage(

     # Application title
     titlePanel("Let's find some Clusters"),
     sidebarLayout(
          sidebarPanel(
               selectInput("selectY",label=h3("Select the data to plot on the y-axis"),choices=colnames(iris),selected="Sepal.Width"),
               selectInput("selectX",label=h3("Select the data to plot on the x-axis"),choices=colnames(iris),selected="Petal.Length"),
               sliderInput("kguess", label = h3("Enter the number of clusters to find"),min = 1,max = 10, value = 1),
               checkboxInput("Actual", label = h3("Show Actual Clusters"), value = FALSE)
          ),
          mainPanel(
               plotOutput('newPlot'),
               textOutput("text1"),
               plotOutput('wssPlot')
          )
     )
))