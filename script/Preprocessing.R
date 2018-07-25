################################## For  Preprocessing ##################################

### function list
# CheckMissingValue: データのfactor列に対して, table関数を実行する. 欠損値の確認
# dfSummarySplit: factor value -> numeric valueの順に変更して, dfSummary 関数を適用する
# CheckBinaryColumn: binary value を factor type に変更する(連続値としての情報はない)

########################################################################################

# CheckMissingValue
CheckMissingValue <- function(data){
  # Extract factor column
  data <- data %>% select_if(is.factor)
  # table function
  func <- function(col) {
    table(col,exclude = NULL) %>% 
      as.data.frame() %>% 
      kable() %>% print() # print table
  }
  apply(data, 2, func)
}

# dfSummarySplit
dfSummarySplit <- function(data){
  # split factor and non-factor,  
  cbind(data %>%
          select_if(is.factor),
        data %>% 
          select_if(negate(is.factor))) %>% 
    dfSummary() %>% 
      view(method = "render")
}

# CheckBinaryColumn
CheckBinaryColumn <- function(col){
  tmp <- col %>% na.omit() %>% unique()
  # check the binary
  if(length(tmp)==2) return(TRUE)
  else return(FALSE)
}



