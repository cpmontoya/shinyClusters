library(shiny)
library(ggplot2)

# Define server logic required to plot clusters
shinyServer(function(input, output) {
     clusterData <- reactive({if (input$Actual){
               iris$Species
          }else {
               kData<-kmeans(dataInput(), centers = input$kguess,nstart = 25)
               factor(kData$cluster)
          }})
     dataInput <- reactive({data.frame(iris[input$selectX],iris[input$selectY])})
     output$newPlot<-renderPlot({qplot(dataInput()[,1],dataInput()[,2],colour=clusterData(),size=I(8),alpha=I(0.7),main="Plot of Selected Iris Data",xlab=colnames(dataInput())[1],ylab=colnames(dataInput())[2])})
    output$text1<-renderText({paste("You have selected ",input$kguess," clusters")})
    output$wssPlot<-renderPlot({qplot(c(1:10),sapply(c(1:10),function(x) kmeans(dataInput(),center=x,nstart=10)$tot.withinss),geom="point",xlab="Number of Clusters",ylab="Total deviations within clusters",main= "Choosing the number of Clusters",size=I(6))+geom_line(size=2)})
})