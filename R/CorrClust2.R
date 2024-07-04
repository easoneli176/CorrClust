#' Takes a dataset of pre-calculated correlations and groups them in a cluster if their correlation is above k with any other variable in the cluster
#'
#' @param data a dataset of correlations
#' @param k the threshold for grouping correlated variables
#' @return a list of each variable and what group it belongs in
#' @examples
#' mock_data <- data.frame(pred1 = rep(1:4,10),pred2=rep(1:5,8),missvar=as.numeric(c("NA",rep(1:2,19),"NA")))
#' CorrClust2(CorrTab(mock_data),.4)

CorrClust2<-function(data,k){
  numvars<-dim(data)[2]

  corclust<-data.frame(Cluster = 1:numvars)
  rownames(corclust) <- colnames(data)

  for (i in 1:numvars){
    for(j in i:numvars){
      if(abs(data[i,j])>=k & corclust[j,]>corclust[i,])
      {corclust[j,]<-corclust[i,]}
      if(abs(data[i,j])>=k)
      {corclust[i,]<-corclust[j,]}
    }
    #if a variable was reassigned after other variables had been clustered with it, need to ensure those go to the right cluster
    if(corclust[i,]<i){
      for(j in i:numvars){
        if(corclust[j,] == i){
          corclust[j,]<-corclust[i,]
        }
      }
    }
  }
  corclust
}
