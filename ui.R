#---------------------------------------------------------------------#
#               mtcars k-means Clustering App                               #
#---------------------------------------------------------------------#


library("shiny")

shinyUI(
  fluidPage(
  
    titlePanel("mtcars k-means Clustering"),
  
    sidebarLayout( 
      
      sidebarPanel(  
        
              selectInput('xcol', 'X Variable', names(mtcars)),
              
              selectInput('ycol', 'Y Variable', names(mtcars),
                                       selected=names(mtcars)[[2]]),
              
              numericInput('clusters', 'Cluster count', 3,
                                        min = 1, max = 9)     ),   # end of sidebar panel
    
    
    mainPanel(
      
      tabsetPanel(type = "tabs",
                     tabPanel("Scree plot", 
                                   plotOutput('plot1')),
                      
                      tabPanel("Cluster Summary",
                               tableOutput('clust_summary'),
                               plotOutput('clust_plot')),
                      
                      tabPanel("Data",
                               dataTableOutput('clust_data'))
        
      ) # end of tabsetPanel
          )# end of main panel
            ) # end of sidebarLayout
              )  # end if fluidPage
                ) # end of UI
  


