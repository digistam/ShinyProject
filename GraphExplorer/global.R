if (!require("igraph")) {
  install.packages("igraph", repos="http://cran.rstudio.com/") 
  library("igraph") 
}
plotMe <- function(x,y) {
  g <- graph.data.frame(x, directed=F)
  ## set seed to make the layout reproducible
  set.seed(111)
  layout1 <- layout.auto(g)
  bad.vs <- V(g)[degree(g) < as.numeric(y)]
  ng <- delete.vertices(g, bad.vs)
  V(ng)$size=degree(ng)*5
  V(ng)$color=degree(ng)+1
  V(ng)$label.cex <- degree(ng)*0.8
  V(ng)$weight=degree(ng)
  ng <<- simplify(ng)
}