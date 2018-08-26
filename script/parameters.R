# xgboost fitting with arbitrary parameters1
xgbGrid <- expand.grid(
  objective = "binary:logistic", # binary classification
  booster = "gbtree",
  eval_metric = "auc",
  nthread = c(8),
  max_depth = c(5,6),
  eta = c(0.10,0.15),
  gamma = c(0),
  subsample = c(0.5,0.6,0.7),
  min_child_weight = c(5,10,20),
  colsample_bytree = c(1),
  colsample_bylevel = c(0.65),
  alpha = c(0),
  lambda = c(0.05))

# xgboost fitting with arbitrary parameters2
xgbGrid <- expand.grid(
  objective = "binary:logistic", # binary classification
  booster = "gbtree",
  eval_metric = "auc",
  nthread = c(8),
  max_depth = c(5),
  eta = c(0.10),
  gamma = c(0),
  subsample = c(0.7),
  min_child_weight = c(1,5,10,20,25),
  colsample_bytree = c(0.3,0.7,0.9),
  colsample_bylevel = c(0.3,0.7,0.9),
  alpha = c(0),
  lambda = c(0.05))
