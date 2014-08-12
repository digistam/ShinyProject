library(shiny)
shinyUI(pageWithSidebar(
  headerPanel( "SNA learning example", "Graph"),
  sidebarPanel(
    fileInput('file1', 'Select csv file', accept=c('text/csv')),
    checkboxInput('header', 'Header', TRUE),
    radioButtons('sep', 'Separator',
                 c(Comma=',', Tab='\t', Semicolon=';' )
    ),
    h3('Degree: '),
    sliderInput('nodes', 'select minimal degree', 1, min =1, max = 3, step = 1),
    h3('Connections: '),
    tableOutput('edgeList'),
    tableOutput('degreeList')
  ),
  mainPanel(
    plotOutput('newGraph', height = 600, width = 600),
    h3('Legenda: '),
    img(src="yellow.png", height = 25, width = 25),
    img(src="purple.png", height = 25, width = 25),
    img(src="lblue.png", height = 25, width = 25),
    img(src="blue.png", height = 25, width = 25),
    img(src="green.png", height = 25, width = 25),
    img(src="red.png", height = 25, width = 25),
    p('degrees: 6, 5, 4, 3, 2, 1'),
    p('Unique nodes in graph: '),
    verbatimTextOutput("nodeCount"),
    p('Unique edges in graph: '),
    verbatimTextOutput("edgeCount"),
    p('Graph density: '),
    verbatimTextOutput("density"),
    #tableOutput('contents'),
    tableOutput("contents")
  )
  
))