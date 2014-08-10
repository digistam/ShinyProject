library(igraph)
plotMe <- function(x) {
  ## undirected
  g <- graph.atlas(600)
  ## directed
  # g <- as.directed(graph.atlas(400))
  V(g)$name <- c("Mark","Lex","Jitse","Bob","Joseph")
  V(g)$label <- V(g)$name
  #totalEdges <<- ecount(g) ## telt het aantal edges
  #vcount(g) ## telt het aantal vertices ofwel de punten waar meerdere edges samen komen
  ## set seed to make the layout reproducible
  set.seed(111)
  layout1 <- layout.fruchterman.reingold(g)
  #plot(g, layout = layout1)
  bad.vs <- V(g)[degree(g) < x]
  ng <- delete.vertices(g,bad.vs)
  V(ng)$size=degree(ng)*5
  V(ng)$color=degree(ng)+1
  V(ng)$label.cex <- degree(ng)
  plot(ng)
  totalNodes <<- vcount(ng)
  c <- shortest.paths(ng) 
  shortestPath <<- table(c + 1)
}