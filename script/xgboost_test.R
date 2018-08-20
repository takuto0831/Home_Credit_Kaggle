# kuroki's parameter this is best !!!!!
file_name <- "best_para_all_data_dep5"
xgb_params <- list(objective = "binary:logistic",
                   booster = "gbtree",
                   eval_metric = "auc",
                   nthread = 8,
                   eta = 0.05,
                   max_depth = 5,
                   min_child_weight = 30,
                   gamma = 0,
                   subsample = 0.85,
                   colsample_bytree = 0.65,
                   alpha = 0,
                   lambda = 0,
                   nrounds = 2000)

# file_name <- "best_data_top_50_dep_6_para_kuroki"
# xgb_params <- list(objective = "binary:logistic",
#                    booster = "gbtree",
#                    eval_metric = "auc",
#                    nthread = 8,
#                    eta = 0.05,
#                    max_depth = 6,
#                    min_child_weight = 30,
#                    gamma = 0,
#                    subsample = 0.85,
#                    colsample_bytree = 0.65,
#                    alpha = 0,
#                    lambda = 0,
#                    nrounds = 2000)

########## xgboost all parameter #############
# library
library(tidyverse)
library(readr) # for csv
library(xgboost)
library(caret)
library(doParallel)

# for windows
app_train <- read_csv("C:/Users/shiohama/Desktop/Home_Credit_Kaggle/csv_imp/all_data_train.csv", na = c("XNA","NA","","NaN","?","Inf","-Inf")) %>%
    mutate_if(is.character, funs(factor(.)))
app_test <- read_csv("C:/Users/shiohama/Desktop/Home_Credit_Kaggle/csv_imp/all_data_test.csv", na = c("XNA","NA","","NaN","?","Inf","-Inf")) %>%
    mutate_if(is.character, funs(factor(.)))

# train and test data
train_data <- app_train %>% select(-SK_ID_CURR)
test_data <- app_test

# set data
train <- train_data %>% select(-TARGET) %>%  data.matrix()
test <- test_data %>% select(-SK_ID_CURR) %>% data.matrix()
target <- train_data$TARGET

# set seed
set.seed(831)
# xgboost cross validation to choice best parameter
xgb_cv <- 
  xgb.cv(data = xgb.DMatrix(data = train, label = target),
         params = xgb_params,
         missing = NA,
         nfold = 5, 
         nrounds = 2000,
         verbose = TRUE,
         prediction = TRUE,                                           # return the prediction using the final model 
         showsd = TRUE,                                               # standard deviation of loss across folds
         stratified = TRUE, 
         print_every_n = 10,
         early_stopping_rounds = 200 )
# xgboost modeling  
xgb_model <- 
  xgboost(data = xgb.DMatrix(data = train, label = target),
          params = xgb_params,
          nrounds = xgb_cv$best_iteration, # max number of trees to build
          verbose = TRUE,                                         
          print_every_n = 10,
          early_stopping_rounds = 200 )
# Visualize important value
xgb.importance(model = xgb_model) %>% 
  xgb.plot.importance(top_n = 30) %>% print()
# predict
pred_test <- predict(xgb_model,test)

# make submit style
submit <- data.frame(test_data,TARGET = pred_test) %>% 
  select(SK_ID_CURR,TARGET) %>% 
  mutate(SK_ID_CURR = SK_ID_CURR %>% as.integer())

# file name + submit date
path_name <- paste("~/Desktop/Home_Credit_Kaggle/submit/",file_name,Sys.Date(),".csv",sep = "")
# export
write_csv(submit,path = path_name)