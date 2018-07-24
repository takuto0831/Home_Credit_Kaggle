################################## For  Preprocessing ##################################

### function list
# CheckMissingValue: データのfactor列に対して, table関数を実行する. 欠損値の確認

########################################################################################

# CheckMissingValue
CheckMissingValue <- function(data){
  # Extract factor column
  data <- data %>% select_if(is.factor)
  # table function
  func <- function(col) {
    table(col,exclude = NULL) %>% 
      as.data.frame() %>% 
      kable() %>% print()
  }
  apply(data, 2, func)
}

