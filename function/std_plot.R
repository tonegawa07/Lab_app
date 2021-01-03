std_plot = function(data) {
  
  data=
    data %>%
    dplyr::mutate_all(~gsub(.,pattern=",",replacement = ""))
  
  for (i in 2:ncol(data)) {
    data[,i]<-as.numeric(data[,i])
  }
  
  # 列名を変換
  names(data)[c(1,ncol(data))] <- c("ID", "DW")

  # STDの値を取得
  std_area <-
    data %>%
    dplyr::select(1:(ncol(data)-1)) %>%
    filter(grepl("STD", ID)) %>%
    dplyr::select(2:(ncol(data)-1))
    
    # STDの値を箱ひげ図でプロットし，返す
    return(boxplot(std_area))
}