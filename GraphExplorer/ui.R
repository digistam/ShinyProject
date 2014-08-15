library(shiny)
shinyUI(pageWithSidebar(
  headerPanel( "Graph explorer", "Graph"),
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
      tabPanel("Introduction",
               HTML('<img src="graphs.jpg" />'),
               h4('How does it work ...'),
               HTML('First, click <b>"Choose File"</b> in the left column.'),
               HTML('Take great care of the <b>separator</b> which has been used in the csv file. '),
               HTML('If you see this error: <b style="color: red;">"the data frame should contain at least two columns"</b> '),
               HTML('you probably did choose the wrong separator, use the correct one !'),
               HTML('The example file <b>"testgraph.csv"</b>, which you can find in the working directory, is comma separated, '),
               HTML('so check <b>"comma"</b> as CSV separator (see left column) if you would like to explore the example CSV file.'),
               p(),
               HTML('After loading the CSV file, you can select the <b>"Graph"</b> tab to see the Graph output, '),
               HTML('or the Matrix tab to see the Adjacency matrix. '),
               p(),
               HTML('You can use the <b>"Degree slider"</b> (see left column) to select nodes with more or less edges.')
      ),
      tabPanel("Graph",
        plotOutput('newGraph', height = 600, width = 600),
        p('Unique nodes in graph: '),
        verbatimTextOutput("nodeCount"),
        p('Unique edges in graph: '),
        verbatimTextOutput("edgeCount"),
        p('Graph density: '),
        verbatimTextOutput("density"),
        #tableOutput('adjacency'),
        tableOutput("contents")#,
        #h2('Legenda: '),
        #img(src="yellow.png", height = 25, width = 25),
        #img(src="purple.png", height = 25, width = 25),
        #img(src="lblue.png", height = 25, width = 25),
        #img(src="blue.png", height = 25, width = 25),
        #img(src="green.png", height = 25, width = 25),
        #img(src="red.png", height = 25, width = 25),
        #p('degrees: 6, 5, 4, 3, 2, 1')
        ),
      tabPanel("Details",
               HTML('<h4>Adjacency matrix</h4>'),
               p(),
               tableOutput('adjacency')
               )
      )
  )
))