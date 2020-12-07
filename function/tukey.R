tukey = function(target, class, level, data){
  
  # colname
  names(data)[c(1,2,3)] = c("CLASS", "treat", "n")
  
  selected_data =
    data %>%
    gather(4:ncol(data), key = key, value = value) %>%
    filter(key == target, CLASS == class) %>%
    dplyr::select(1:3,value)
  
  anova_result = aov(value~treat, data = selected_data)
  #print(anova(anova_result))
  
  tukey_result = cld(glht(anova_result, linfct = mcp(treat= "Tukey")), level = level)
  letters = tukey_result$mcletters$Letters
  
  info_df = data.frame(class, target)
  letters_df = as.data.frame(t(letters))
  output_df = cbind(info_df, letters_df)
  
  return(output_df)
}