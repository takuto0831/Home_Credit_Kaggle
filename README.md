# Home_Credit_Kaggle

## Rmd.file

- EDA.Rmd: データ概要, 基礎集計
- XGBoost.Rmd: xgboostによるモデル構築, 予測, 提出ファイルの作成
	- パラメータの調整
	- xgboostに関する学習

## Script.file
 
- function: 作業工程ごとに分割, 関数の詳細を記述
	- Preprocessing.R: 前処理
	 
## submit.file

- ファイル名: [file_name] + [submit_date].csv
- file_name: データの詳細な構造
- submit_data: 作成日

# ディレクトリ
 
```
├── EDA.Rmd
├── EDA.html
├── XGBoost.Rmd
├── XGBoost.html
├── Home_Credit_Kaggle.Rproj
├── csv
│   ├── HomeCredit_columns_description.csv
│   ├── POS_CASH_balance.csv
│   ├── application_test.csv
│   ├── application_train.csv
│   ├── bureau.csv
│   ├── bureau_balance.csv
│   ├── credit_card_balance.csv
│   ├── installments_payments.csv
│  ├── previous_application.csv
│   └── sample_submission.csv
└── function
│    └── Preprocessing.R
└── submit
    └── test-submit-xgb2018-07-21
``
