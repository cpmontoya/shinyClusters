library(shiny)
palette("default")
palette(adjustcolor(1:8,alpha.f=0.5))

# Define server logic required to plot various variables against mpg
shinyServer(function(input, output) {
     output$newPlot<-renderPlot({plot(iris[,input$selectX],iris[,input$selectY],col=iris$Species,pch=19,main="Plot of Selected Data",xlab=input$selectX,ylab=input$selectY)})
     output$text1<-renderText({paste("You have selected this",input$selectY,"and",input$selectY)})
})