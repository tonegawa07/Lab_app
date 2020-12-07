std_plot = function(data) {

  rawdata = data
  
  # colname
  names(rawdata)[c(1,ncol(rawdata))] <- c("ID", "DW")

  # show std data
  std_area <-
    rawdata %>%
    dplyr::select(1:(ncol(rawdata)-1)) %>%
    filter(grepl("STD", ID)) %>%
    dplyr::select(2:(ncol(rawdata)-1))
    
    return(boxplot(std_area))
}