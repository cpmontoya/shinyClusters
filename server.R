library(shiny)

# Define server logic required to plot various variables against mpg
shinyServer(function(input, output) {
     output$newPlot<-renderPlot(plot(iris$Petal.Length,iris$sepal.Width,col=iris$Species))
})