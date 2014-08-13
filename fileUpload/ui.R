library(shiny)
shinyUI(pageWithSidebar(
  headerPanel( "SNA learning example", "Graph"),
  sidebarPanel(
    fileInput('file1', 'Select csv file', accept=c('text/csv')),
    #checkboxInput('header', 'Header', TRUE),
    radioButtons('sep', 'CSV separator:',
                 c(Comma=',', Tab='\t', Semicolon=';' )
    ),
    h4('Degree: '),
    sliderInput('nodes', 'select minimum degree', 0, min =0, max = 5, step = 1),
    tableOutput('degreeList'),
    h4('Node connections: '),
    tableOutput('edgeList')
    
  ),
  mainPanel(
    tabsetPanel(
      tabPanel("Information",
               h4('How does it work ...'),
               p('First, click "Choose File" in the left column.'),
               #p('select "testgraph.csv" in the working directory'),
               p('Take great care of the separator which has been used in the csv file'),
               p('If you see this error: "the data frame should contain at least two columns"'),
               p('you probably choose the wrong separator, try a different one !'),
               p('The example file "testgraph.csv" in the working directory is comma separated'),
               p('Check "comma" as CSV separator if you use the example CSV file'),
               p('Select the "Graph" tab to see the Graph output'),
               p('Use the "Degree slider" in the left column to select nodes with more or less edges')
      ),
      tabPanel("Graph",
        plotOutput('newGraph', height = 600, width = 600),
        p('Unique nodes in graph: '),
        verbatimTextOutput("nodeCount"),
        p('Unique edges in graph: '),
        verbatimTextOutput("edgeCount"),
        p('Graph density: '),
        verbatimTextOutput("density"),
        tableOutput("contents")#,
        #h2('Legenda: '),
        #img(src="yellow.png", height = 25, width = 25),
        #img(src="purple.png", height = 25, width = 25),
        #img(src="lblue.png", height = 25, width = 25),
        #img(src="blue.png", height = 25, width = 25),
        #img(src="green.png", height = 25, width = 25),
        #img(src="red.png", height = 25, width = 25),
        #p('degrees: 6, 5, 4, 3, 2, 1')
        ) 
      )
  )
))