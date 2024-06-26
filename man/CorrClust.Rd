% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/CorrClust.R
\name{CorrClust}
\alias{CorrClust}
\title{Takes a dataset with all numeric vectors and groups them in a cluster if their correlation is above k with any other variable in the cluster}
\usage{
CorrClust(data, k)
}
\arguments{
\item{data}{a dataset of numeric columns}

\item{k}{the threshold for grouping correlated variables}
}
\value{
a list of each variable and what group it belongs in
}
\description{
Takes a dataset with all numeric vectors and groups them in a cluster if their correlation is above k with any other variable in the cluster
}
\examples{
mock_data <- data.frame(pred1 = rep(1:4,10),pred2=rep(1:5,8),missvar=as.numeric(c("NA",rep(1:2,19),"NA")))
CorrClust(mock_data,.4)
}
