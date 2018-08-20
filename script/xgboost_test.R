# kuroki's parameter
file_name <- "best_data_top_50_para_kuroki"
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

file_name <- "best_data_top_50_dep_6_para_kuroki"
xgb_params <- list(objective = "binary:logistic",
                   booster = "gbtree",
                   eval_metric = "auc",
                   nthread = 8,
                   eta = 0.05,
                   max_depth = 6,
                   min_child_weight = 30,
                   gamma = 0,
                   subsample = 0.85,
                   colsample_bytree = 0.65,
                   alpha = 0,
                   lambda = 0,
                   nrounds = 2000)
