shinyUI(fluidPage(
  titlePanel("Simple SNA with iGraph"),
  sidebarLayout (
    
    sidebarPanel(
      h3('connected Nodes'),
      sliderInput('nodes', 'select minimum amount of edges between nodes', 1, min = 1, max = 4, step = 1),
      br(),
      br(),
      plotOutput('degreeHist')
    ),
    
    mainPanel(
      tabsetPanel(
        tabPanel("Graph",
          h4('Minimum amount of edges between nodes: '),
          verbatimTextOutput('nodes'),
          h4('How many nodes left: '),
          verbatimTextOutput('totalNodes'),
          plotOutput('newGraph')#,
          #plotOutput('degreeHist')
        ),
        tabPanel("SecondTab"#,
          #plotOutput('degreeHist')#,
          #h4('What is the shortest path'),
          #verbatimTextOutput('shortestPath')
        )
      )
  )
)))
