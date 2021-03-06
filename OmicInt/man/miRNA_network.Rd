% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/miRNA_network.R
\name{miRNA_network}
\alias{miRNA_network}
\title{miRNA_network}
\usage{
miRNA_network(genes)
}
\arguments{
\item{genes}{Requires a  gene list (HGNC gene symbol); class list of strings}
}
\value{
a heatmap plot for found interactions and a list of miRNA and regulated genes. The list output value can be used for downstream analyses. Classes returned - a plot and a list
}
\description{
miRNA_network function allows to assess how many genes are regulated by the same miRNA. Note if you supply too many genes the function will take longer to run.
}
\examples{
\dontrun{
# basic usage of miRNA_network
return_df<-miRNA_network(c("PIP4K2A","MOB1A","PHACTR2","MDM2","YWHAG" ,"RAB31"  ))
head(return_df)
}
}
