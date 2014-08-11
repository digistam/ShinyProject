library(shiny)
shinyUI(fluidPage(
  headerPanel( "Demand Forecast", "Flowserve"),
  sidebarPanel(
    fileInput('file1', 'Select csv file',
              accept=c('text/csv')
    ),
    checkboxInput('header', 'Header', TRUE),
    radioButtons('sep', 'Separator',
                 c(Comma=',', Tab='\t', Semicolon=';' )
    ),
    h3('connected Nodes'),
    sliderInput('nodes', 'select minimum indegree', 1, min =0, max = 4, step = 1),
    br(),
    br()
    ##tags$hr(),
    ##selectInput("product", "Select Product","")
  ),
  mainPanel(
    plotOutput('newGraph', height = 600, width = 600),
    tableOutput('contents'),
    tableOutput("zollie"),
    tableOutput("dollie")
  )
  
))