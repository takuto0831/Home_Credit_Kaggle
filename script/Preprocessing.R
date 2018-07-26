################################## For  Preprocessing ##################################

### function list
# CheckMissingValue: データのfactor列に対して, table関数を実行する. 欠損値の確認
# dfSummarySplit: factor value -> numeric valueの順に変更して, dfSummary 関数を適用する
# CheckBinaryColumn: binary value を factor type に変更する(連続値としての情報はない)
# ImputeMissingValueRF: Random Forest による欠損値補完(numeric value)
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

# ImputeMissingValueRF
ImputeMissingValueRF <- function(data){
  # remove list
  patterns <- c("SK_ID","TARGET")
  # parallel processing
  cl <- makeCluster(detectCores()-1); registerDoParallel(cl)
  # impute missing values
  imp <- data %>% 
    select_if(!grepl(paste(patterns, collapse="|"),names(.))) %>% # remove contain "SK_ID" or "TARGET"
    select_if(negate(is.factor)) %>% # only numeric value 
    as.data.frame() %>% 
    missForest(
      variablewise = TRUE, ntree = 100,
      parallelize = "forests", verbose = TRUE) 
  stopCluster(cl)
  # combine all data
  ans <- 
    cbind(data %>% 
            select_if(grepl(paste(patterns, collapse="|"),names(.))),
          data %>% 
            select_if(is.factor),
          imp$ximp)
  return(ans)
}


