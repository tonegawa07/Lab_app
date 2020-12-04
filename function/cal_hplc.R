cal_hplc = function(std_conc, Dil, Ext_vol, data){
  # Parameters
  #std_conc : std濃度
  #Dil : 希釈倍率
  #Ext_vol : 抽出時溶媒量(mL)
  
  f <- std_conc*Dil*(Ext_vol/1000)
  
  rawdata = data
  
  # colname
  names(rawdata)[c(1,ncol(rawdata))] <- c("ID", "DW")
  
  
  # Calculation std_area mean
  std_mean <-
    rawdata %>%
    select(1:(ncol(rawdata)-1)) %>%
    filter(grepl("STD", ID)) %>%
    gather(key = key, value = value, 2:(ncol(rawdata)-1), factor_key = T) %>%
    group_by(key) %>%
    summarise(Mean = mean(value)) %>%
    spread(key = key, value = Mean)
  
  # show std_mean
  #print(std_mean)
  
  
  # Calculation sample_conc(mg/g)
  sample <-
    rawdata %>%
    filter(grepl("UNK", ID))
  
  for (i in 2:(ncol(sample)-1)) {
    item <- colnames(sample[i])
    #print(item)
    col <- paste0(item, "(mg/g DW)")
    #print(col)
    std <- as.numeric(std_mean[item])
    #print(std)
    
    #print(sample[,i])
    sample <-
      sample %>%
      mutate(!!col := (sample[,i]*f) / (std*DW*0.001))
  }
  
  return(sample)
}