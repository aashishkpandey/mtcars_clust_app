

shinyServer(function(input, output) {
  
Dataset <- reactive({
    return(mtcars)
  })

selectedData <- reactive({
  Dataset()[, c(input$xcol, input$ycol)]
})

output$plot1 = renderPlot({ 
    data.pca <- prcomp(Dataset(),center = TRUE,scale. = TRUE)
    plot(data.pca, type = "l"); abline(h=1)    
})

clusters <- reactive({
    kmeans(Dataset(), input$clusters)
  })
  
output$clust_summary = renderTable({
  clusters()$centers
})

output$clust_plot = renderPlot({
  plot(selectedData(),col=clusters()$cluster, pch = 20, cex = 3)
  points(clusters()$center[,c(input$xcol, input$ycol)],pch=4,cex=4)
  
})

output$clust_data = renderDataTable({
  return(data.frame(car = row.names(mtcars),mtcars,Cluster = clusters()$cluster))
})
  
})
