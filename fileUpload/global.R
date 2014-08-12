library(igraph)
plotMe <- function(x,y) { #,y) {
  #a <- c('a','b','c','d','e','d','e','f','g','k','l')
  #b <- c('d','e','f','g','k','a','b','c','d','e')
  #c <- as.data.frame(cbind(a,b))
  g <- graph.data.frame(x)
  #totalEdges <<- ecount(g) ## telt het aantal edges
  #vcount(g) ## telt het aantal vertices ofwel de punten waar meerdere edges samen komen
  ## set seed to make the layout reproducible
  set.seed(111)
  #layout1 <- layout.fruchterman.reingold(g)
  layout1 <- layout.auto(g)
  #plot(g, layout = layout1)
  bad.vs <- V(g)[degree(g) < y]
  ng <- delete.vertices(g,bad.vs)
  ng <<- simplify(ng)
  V(ng)$size=degree(ng)*5
  V(ng)$color=degree(ng)+1
  V(ng)$label.cex <- degree(ng)*0.8
  #plot(ng)
  plot(ng, layout=layout1)
  #totalNodes <<- vcount(ng)
  #c <- shortest.paths(ng) 
  #shortestPath <<- table(c + 1)
}