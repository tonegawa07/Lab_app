tukey_table = function(data, level){
  
  # colname
  names(data)[c(1,2,3)] = c("CLASS", "treat", "n")
  
  class_list = unique(data$CLASS)
  
  output_table = data.frame()
  
  for (class_element in class_list) {
    #print(part)
    for (i in 4:(ncol(data))) {
      pheno <- colnames(data[i])
      #print(pheno)
      #print(class_element)
      output_table = tryCatch({rbind(output_table,tukey(target = pheno, class = class_element, level = level, data = data))},
                              error=function(e){
                                output_table
                              })
    }
  }
  
  return(output_table)
}
