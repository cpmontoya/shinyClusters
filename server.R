library(shiny)
palette("default")
palette(c("#E41A1C", "#377EB8", "#4DAF4A", "#984EA3",
          "#FF7F00", "#FFFF33", "#A65628", "#F781BF", "#999999"))
palette(adjustcolor(1:8,alpha.f=0.5))

# Define server logic required to plot various variables against mpg
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
    output$wssPlot<-renderPlot({qplot(c(1:10),sapply(c(1:10),function(x) kmeans(dataInput(),center=x,nstart=10)$tot.withinss),size=I(5),geom="point",xlab="Number of Clusters",ylab="Total deviations within clusters",main= "Choosing the number of Clusters")})
})