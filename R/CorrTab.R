#' Takes a dataset with all numeric vectors and calculates the correlation between each pair
#'
#' @param data a dataset of numeric columns
#' @return a table of correlation values
#' @examples
#' mock_data <- data.frame(pred1 = rep(1:4,10),pred2=rep(1:5,8),missvar=as.numeric(c("NA",rep(1:2,19),"NA")))
#' CorrTab(mock_data)

CorrTab<-function(data){
  numvars<-dim(data)[2]
  mat = matrix(NA, nrow = numvars, ncol = numvars)
  cortab<-as.data.frame(mat)
  rownames(cortab) <- colnames(data)
  colnames(cortab) <- colnames(data)

  for (i in 1:numvars){
    for(j in i:numvars){
      cortab[i,j]<-cor(data[,i],data[,j],use='complete.obs')
    }
  }

  cortab
}
