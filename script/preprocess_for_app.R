### app_train and app_test 

#### CODE_GENDER 

#### NAME_TYPE_SUITE

app_train <- app_train %>% 
  mutate(NAME_TYPE_SUITE_imp = replace(NAME_TYPE_SUITE, is.na(NAME_TYPE_SUITE),"Unaccompanied")) 
app_test <- app_test %>% 
  mutate(NAME_TYPE_SUITE_imp = replace(NAME_TYPE_SUITE, is.na(NAME_TYPE_SUITE),"Unaccompanied")) 

#### OCCUPATION_TYPE

app_train <- app_train %>% 
  mutate(OCCUPATION_TYPE_imp = ifelse(!is.na(OCCUPATION_TYPE),OCCUPATION_TYPE %>% as.character(),
                                      ifelse(is.na(ORGANIZATION_TYPE),"Unemployed","other"))) %>% 
  mutate(OCCUPATION_TYPE_imp = OCCUPATION_TYPE_imp %>% as.factor())

app_test <- app_test %>% 
  mutate(OCCUPATION_TYPE_imp = ifelse(!is.na(OCCUPATION_TYPE),OCCUPATION_TYPE %>% as.character(),
                                      ifelse(is.na(ORGANIZATION_TYPE),"Unemployed","other"))) %>% 
  mutate(OCCUPATION_TYPE_imp = OCCUPATION_TYPE_imp %>% as.factor())

#### ORGANIZATION_TYPE 

app_train <- app_train %>% 
  mutate(ORGANIZATION_TYPE_imp = ifelse(!is.na(ORGANIZATION_TYPE),ORGANIZATION_TYPE %>% as.character(),
                                        ifelse(is.na(OCCUPATION_TYPE),"Unemployed","Other"))) %>% 
  mutate(ORGANIZATION_TYPE_imp = ORGANIZATION_TYPE_imp %>% as.factor())

app_test <- app_test %>% 
  mutate(ORGANIZATION_TYPE_imp = ifelse(!is.na(ORGANIZATION_TYPE),ORGANIZATION_TYPE %>% as.character(),
                                        ifelse(is.na(OCCUPATION_TYPE),"Unemployed","other"))) %>% 
  mutate(ORGANIZATION_TYPE_imp = ORGANIZATION_TYPE_imp %>% as.factor())

#### AMT_???

# AMT_INCOME_TOTAL: 総収入
# AMT_CREDIT: ローンのクレジット額
# AMT_ANNUITY: 年金ローン
# AMT_GOODS_PRICE: 消費者ローン

# 補完に使用するデータ
data1 <- app_train %>% select(AMT_CREDIT, AMT_ANNUITY, AMT_GOODS_PRICE) 
data2 <- app_test %>% select(AMT_CREDIT, AMT_ANNUITY, AMT_GOODS_PRICE) 
# 欠損値を含むデータ
patterns <- c("AMT_ANNUITY","AMT_GOODS_PRICE")

# 欠損値補完 (1 iter : 2000 second)
tmp1 <- ImputeMissingValueMI(data1,patterns)
tmp2 <- ImputeMissingValueMI(data2,patterns)

# データ結合
app_train <- cbind(app_train,tmp1)
app_test <- cbind(app_test,tmp2)

#### OWN_CAR_AGE

#### CNT_FAM_MEMBERS

app_train <- app_train %>% 
  mutate(CNT_FAM_MEMBERS_imp = ifelse(is.na(CNT_FAM_MEMBERS),1,CNT_FAM_MEMBERS )) 
app_test <- app_test %>% 
  mutate(CNT_FAM_MEMBERS_imp = ifelse(is.na(CNT_FAM_MEMBERS),1,CNT_FAM_MEMBERS )) 

#### EXT_SOURCE_??

#### ???_AVG

# APARTMENTS_AVG
# BASEMENTAREA_AVG
# YEARS_BEGINEXPLUATATION_AVG
# YEARS_BUILD_AVG
# COMMONAREA_AVG
# ELEVATORS_AVG
# ENTRANCES_AVG
# FLOORSMAX_AVG
# FLOORSMIN_AVG
# LANDAREA_AVG
# LIVINGAPARTMENTS_AVG
# LIVINGAREA_AVG
# NONLIVINGAPARTMENTS_AVG
# NONLIVINGAREA_AVG

# data
data1 <- app_train %>% select_if(grepl("_AVG",names(.)))
data2 <- app_test %>% select_if(grepl("_AVG",names(.)))
# str_c(a,collapse = "', '")  
patterns <- c("APARTMENTS_AVG", "BASEMENTAREA_AVG", "YEARS_BEGINEXPLUATATION_AVG", "YEARS_BUILD_AVG", "COMMONAREA_AVG",
              "ELEVATORS_AVG", "ENTRANCES_AVG", "FLOORSMAX_AVG", "FLOORSMIN_AVG", "LANDAREA_AVG","LIVINGAPARTMENTS_AVG",
              "LIVINGAREA_AVG", "NONLIVINGAPARTMENTS_AVG", "NONLIVINGAREA_AVG") 
# 欠損値補完 
tmp1 <- ImputeMissingValueMI(data1,patterns)
tmp2 <- ImputeMissingValueMI(data2,patterns)

# データ結合
app_train <- cbind(app_train,tmp1)
app_test <- cbind(app_test,tmp2)

#### ???_MEDI

# APARTMENTS_MEDI
# BASEMENTAREA_MEDI
# YEARS_BEGINEXPLUATATION_MEDI
# YEARS_BUILD_MEDI
# COMMONAREA_MEDI
# ELEVATORS_MEDI
# ENTRANCES_MEDI
# FLOORSMAX_MEDI
# FLOORSMIN_MEDI
# LANDAREA_MEDI
# LIVINGAPARTMENTS_MEDI
# LIVINGAREA_MEDI
# NONLIVINGAPARTMENTS_MEDI
# NONLIVINGAREA_MEDI

# data
data1 <- app_train %>% select_if(grepl("_MEDI",names(.)))
data2 <- app_test %>% select_if(grepl("_MEDI",names(.)))
# str_c(a,collapse = "', '")  
patterns <- c("APARTMENTS_MEDI", "BASEMENTAREA_MEDI", "YEARS_BEGINEXPLUATATION_MEDI", "YEARS_BUILD_MEDI", "COMMONAREA_MEDI", 
              "ELEVATORS_MEDI", "ENTRANCES_MEDI", "FLOORSMAX_MEDI", "FLOORSMIN_MEDI", "LANDAREA_MEDI", "LIVINGAPARTMENTS_MEDI",
              "LIVINGAREA_MEDI", "NONLIVINGAPARTMENTS_MEDI", "NONLIVINGAREA_MEDI") 
# 欠損値補完 
tmp1 <- ImputeMissingValueMI(data1,patterns)
tmp2 <- ImputeMissingValueMI(data2,patterns)

# データ結合
app_train <- cbind(app_train,tmp1)
app_test <- cbind(app_test,tmp2)

#### ???_MODE

# factor
# FONDKAPREMONT_MODE (カラムがよくわからない)
# HOUSETYPE_MODE
# WALLSMATERIAL_MODE
# TOTALAREA_MODE (敷地面積?)
# EMERGENCYSTATE_MODE (No or Yes) -> 欠損値 = NOとする
# numeric
# APARTMENTS_MODE
# BASEMENTAREA_MODE
# YEARS_BEGINEXPLUATATION_MODE
# YEARS_BUILD_MODE
# COMMONAREA_MODE
# ELEVATORS_MODE
# ENTRANCES_MODE
# FLOORSMAX_MODE
# FLOORSMIN_MODE
# LANDAREA_MODE
# LIVINGAPARTMENTS_MODE
# LIVINGAREA_MODE
# NONLIVINGAPARTMENTS_MODE
# NONLIVINGAREA_MODE

##### factor value 

## impute 1
# data
data1 <- app_train %>% select(HOUSETYPE_MODE,WALLSMATERIAL_MODE,FONDKAPREMONT_MODE,TOTALAREA_MODE)
data2 <- app_test %>% select(HOUSETYPE_MODE,WALLSMATERIAL_MODE,FONDKAPREMONT_MODE,TOTALAREA_MODE)
patterns <- c("HOUSETYPE_MODE","WALLSMATERIAL_MODE","FONDKAPREMONT_MODE","TOTALAREA_MODE") 
# 欠損値補完 
tmp1 <- ImputeMissingValueRF(data1,patterns)
tmp2 <- ImputeMissingValueRF(data2,patterns)
# データ結合
app_train <- cbind(app_train,tmp1)
app_test <- cbind(app_test,tmp2)

## impute 2
app_train <- app_train %>% 
  mutate(EMERGENCYSTATE_MODE_imp = ifelse(is.na(EMERGENCYSTATE_MODE),"No",EMERGENCYSTATE_MODE %>% as.character())) %>% 
  mutate(EMERGENCYSTATE_MODE_imp = EMERGENCYSTATE_MODE_imp %>% as.factor())
app_test <- app_test %>% 
  mutate(EMERGENCYSTATE_MODE_imp = ifelse(is.na(EMERGENCYSTATE_MODE),"No",EMERGENCYSTATE_MODE %>% as.character())) %>% 
  mutate(EMERGENCYSTATE_MODE_imp = EMERGENCYSTATE_MODE_imp %>% as.factor())

##### numeric value

# exclude
tmp <- c("HOUSETYPE_MODE","WALLSMATERIAL_MODE","FONDKAPREMONT_MODE","TOTALAREA_MODE","EMERGENCYSTATE_MODE")
# data
data1 <- app_train %>% select_if(grepl("_MODE",names(.))) %>% select_if(!grepl(paste(tmp, collapse="|"),names(.))) 
data2 <- app_test %>% select_if(grepl("_MODE",names(.))) %>% select_if(!grepl(paste(tmp, collapse="|"),names(.)))
# str_c(a,collapse = "', '")  
patterns <- c( "APARTMENTS_MODE", "BASEMENTAREA_MODE", "YEARS_BEGINEXPLUATATION_MODE", "YEARS_BUILD_MODE", "COMMONAREA_MODE", 
               "ELEVATORS_MODE", "ENTRANCES_MODE", "FLOORSMAX_MODE", "FLOORSMIN_MODE", "LANDAREA_MODE", "LIVINGAPARTMENTS_MODE",
               "LIVINGAREA_MODE", "NONLIVINGAPARTMENTS_MODE", "NONLIVINGAREA_MODE") 
# 欠損値補完 
tmp1 <- ImputeMissingValueMI(data1,patterns)
tmp2 <- ImputeMissingValueMI(data2,patterns)

# データ結合
app_train <- cbind(app_train,tmp1)
app_test <- cbind(app_test,tmp2)
