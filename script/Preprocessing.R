################################## For  Preprocessing ##################################

### function list
# CheckMissingValue: データのfactor列に対して, table関数を実行する. 欠損値の確認
# dfSummarySplit: factor value -> numeric valueの順に変更して, dfSummary 関数を適用する
# CheckBinaryColumn: binary value を factor type に変更する(連続値としての情報はない)
# CheckCategoryColumn: uniqueな値が100(要考察)以下の場合, カテゴリカル変数とする
# ImputeMissingValueRF: Random Forest による欠損値補完
# ImputeMissingValueRF: Multiple imputing による欠損値補完

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
# CheckCategoryColumn
CheckCategoryColumn <- function(col){
  tmp <- col %>% na.omit() %>% unique()
  # check the binary
  if(length(tmp) < 100) return(TRUE)
  else return(FALSE)
}

# ImputeMissingValueRF (要修正)
ImputeMissingValueRF <- function(data,patterns){
  # parallel processing
  len <- min( dim(data)[2], detectCores()-1)
  cl <- makeCluster(len); registerDoParallel(cl)
  # impute missing values
  imp <- data %>% 
    as.data.frame() %>% 
    missForest(
      variablewise = TRUE, ntree = 100,
      parallelize = "forests", verbose = TRUE) 
  stopCluster(cl)
  # reaname data
  ans <- imp$ximp %>% 
    select_if(grepl(paste(patterns, collapse="|"),names(.)))
  colnames(ans) <- paste(patterns,"_imp",sep = "")
  return(ans)
}

# ImputeMissingValueMI
ImputeMissingValueMI <- function(data,patterns){
  # impute missing value
  options(mc.cores = 4)
  imp <- data %>% 
    as.data.frame() %>% 
    missing_data.frame() %>% 
    mi(n.iter = 100, n.chains = 4, max.minutes = 20)
  tmp <- complete(imp,1:4)
  ans <- data.frame( (tmp$`chain:1` + tmp$`chain:2` + tmp$`chain:3` + tmp$`chain:4`) / 4 ) %>% 
    select_if(!grepl("missing",names(.))) %>% 
    select_if(grepl(paste(patterns, collapse="|"),names(.)))
  # rename data
  colnames(ans) <- paste(patterns,"_imp",sep = "")
  return(ans)
}



