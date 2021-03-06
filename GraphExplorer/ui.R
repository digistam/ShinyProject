if (!require("shiny")) {
  install.packages("shiny", repos="http://cran.rstudio.com/") 
  library("shiny") 
}
shinyUI(pageWithSidebar(
  headerPanel( "GraphExplorer", "GraphExplorer"),
  sidebarPanel(
    HTML('<a target=_blank href="https://raw.githubusercontent.com/digistam/ShinyProject/master/GraphExplorer/testgraph.csv">click here to download a demo csv file</a>'),  
    p(),
    fileInput('file1', 'Select csv file', accept=c('text/csv')),
    #checkboxInput('header', 'Header', TRUE),
    radioButtons('sep', 'CSV separator:',
                 c(Comma=',', Tab='\t', Semicolon=';' )
    ),
    h4('Degree: '),
    sliderInput('nodes', 'select minimum degree', 0, min =0, max = 5, step = 1),
    tableOutput('degreeList')#,
    #h4('Node connections: '),
    #tableOutput('edgeList')
    
  ),
  mainPanel(
    tabsetPanel(
      tabPanel("Introduction",
               
               h4('How does it work ...'),
               HTML('First, click <b>"Choose File"</b> in the left column.'),
               HTML('Take great care of the <b>separator</b> which has been used in the csv file. '),
               HTML('After loading the CSV file, you can select the <b>"Graph"</b> tab to see the Graph output, '),
               HTML('or the "Details" tab to see the Adjacency matrix etc. '),
               p(),
               HTML('You can use the <b>"Degree slider"</b> (see left column) to select nodes with more or less edges.'),
               p(),
               HTML('<img src="graphs.jpg" />')
               
      ),
      tabPanel("Graph",
        plotOutput('newGraph', height = 600, width = 600),
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
               p('Unique nodes in graph: '),
               verbatimTextOutput("nodeCount"),
               p('Unique edges in graph: '),
               verbatimTextOutput("edgeCount"),
               p('Graph density: '),
               verbatimTextOutput("density"),
               p('Adjacency matrix'),
               p(),
               tableOutput('adjacency'),
               HTML('Please use the slider to change the minimum degree value')
               )
      )
  )
))