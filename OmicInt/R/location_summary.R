#' @title location_summary

#' @description location_summary  function provides information on main cellular locations. Barplot also helps to visualise  the location data distribution.
#'
#' @param data Requires a  data frame generated by score_genes; class - data frame
#' @return barplot; class - plot
#' @import  methods
#' @importFrom ggplot2 aes
#' @importFrom ggplot2 theme
#' @ImpportFrom ggplot2 element_text
#' @ImportFrom ggplot2 geom_col
#' @ImportFrom ggplot2 ggplot
#' @import RColorBrewer
#' @importFrom  RCurl getURL
#' @import utils
#' @examples
#' \dontrun{
#' path_to_test_data<- system.file("extdata", "test_data.tabular", package="OmicInt")
#' # basic usage of location_summary
#' df<-utils::read.table(path_to_test_data)
#' location_summary(df)}
#' @export
location_summary<-function(data){

  #plot structures
  #access data
  #download the data from curated databases
  location_url <- RCurl::getURL("https://gitlab.com/Algorithm379/databases/-/raw/main/Subcellular.locationmerged_protein_data.csv")
  location_df <- utils::read.csv(text = location_url)


  #add associations

  data$"Location"<-ifelse(data$"Symbol"%in%location_df$"Symbol",location_df$"Subcellular.location","NA")
  #rename NAs
  data$"Location"<-ifelse( is.na(data$"Location"),"NA", data$"Location")
  #extract features
  df<-table(data$"Location")
  df<-as.data.frame(sort(df,decreasing = TRUE))
  colnames(df)<-c("Location","Freq")
  print(df)

  # to avoid conflicts and warning messages
  Freq<-df$"Freq"
  Location<-df$"Location"


  p1<-ggplot2::ggplot(df)+ggplot2::geom_col(ggplot2::aes(x=Location,y=Freq, fill=Location))+ggplot2::theme(axis.text.x = ggplot2::element_text(angle = 90, vjust = 0.5, hjust=1))
  methods::show(p1)


}
