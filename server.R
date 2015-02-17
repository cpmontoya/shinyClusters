library(shiny)
palette("default")
palette(adjustcolor(1:8,alpha.f=0.5))

# Define server logic required to plot various variables against mpg
shinyServer(function(input, output) {
     clusterData <- reactive({if (input$Actual){
               iris$Species
          }else {
               kmeans(dataInput(), centers = input$kguess,nstart = 25)$cluster
          }})
     dataInput <- reactive({data.frame(iris[input$selectX],iris[input$selectY])})
     output$newPlot<-renderPlot({plot(dataInput()[,1],dataInput()[,2],col=clusterData(),pch=19,main="Plot of Selected Iris Data",xlab=colnames(dataInput())[1],ylab=colnames(dataInput())[2])})
    output$text1<-renderText({paste("You have selected ",input$kguess," clusters")})
    
    output$wssPlot<-renderPlot({plot(c(1:10),sapply(c(1:10),function(x) kmeans(dataInput(),center=x,nstart=10)$tot.withinss),type='o',xlab="Number of Clusters",ylab="Total deviations within clusters",main= "Choosing the number of Clusters")})
})