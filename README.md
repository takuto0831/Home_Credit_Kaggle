<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
**Table of Contents**  *generated with [DocToc](https://github.com/thlorenz/doctoc)*

- [Home_Credit_Kaggle](#home_credit_kaggle)
  - [Rmd.file](#rmdfile)
  - [script.file](#scriptfile)
  - [submit.file](#submitfile)
  - [about_column.numbers](#about_columnnumbers)
  - [csv.file](#csvfile)
  - [csv_imp.file](#csv_impfile)
- [Layered Directory](#layered-directory)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

# Home_Credit_Kaggle

## Rmd.file

- 0_EDA.Rmd: Checking data simply and searching problem
- 1_Preprocess_app.Rmd: Preprocessing for application_{train|test}.csv
- 1_Preprocess_bureau.Rmd: Preprocessing for bureau.csv and bureau_balance.csv
- 1_Preprocess_pre_app.Rmd: Preprocessing for previous_applications.csv
- 1_Preprocess_ins_pay.Rmd: Preprocessing for installments_payment.csv
- 1_Preprocess_pos_cash.Rmd: Preprocessing for POS_CASH_balance.csv
- 1_Preprocess_credit.Rmd: Preprocessing for credit_card_balance.csv
- 2_Combine.Rmd: Combining all data and Checking for data
- 3_XGBoost.Rmd: xgboostによるモデル構築, 予測, 提出ファイルの作成

## script.file
 
- function.R: 各関数の詳細を記述
- makedummies.R: factor値をダミー変数化する関数
	 
## submit.file

- ファイル名: [file_name] + [submit_date].csv
- file_name: データの詳細な構造
- submit_data: 作成日

## about_column.numbers

- csv dataの各カラムの説明, およびメモ
- ROW name and memo (青色): 欠損値かつ無処理
- ROW name (青色): 欠損値かつ処理したカラムを追加済み

## csv.file

- 配布データ

## csv_imp.file

- 欠損処理等を実行したもの(1_Preprocess)
- 配布データを結合したもの(2_Combine)

# Layered Directory
 
```
├── Home_Credit_Kaggle.Rproj
├── README.md
├── about_column.numbers
├── Rmd
│   ├── 0_EDA.Rmd
│   ├── 1_Preprocess_app.Rmd
│   ├── 1_Preprocess_app.html
│   ├── 1_Preprocess_bureau.Rmd
│   ├── 1_Preprocess_credit.Rmd
│   ├── 1_Preprocess_ins_pay.Rmd
│   ├── 1_Preprocess_pos_cash.Rmd
│   ├── 1_Preprocess_pre_app.Rmd
│   ├── 2_Combine.Rmd
│   ├── 3_XGBoost.Rmd
│   └── EDA.html
├── csv
│   ├── HomeCredit_columns_description.csv
│   ├── POS_CASH_balance.csv
│   ├── application_test.csv
│   ├── application_train.csv
│   ├── bureau.csv
│   ├── bureau_balance.csv
│   ├── credit_card_balance.csv
│   ├── installments_payments.csv
│   ├── previous_application.csv
│   └── sample_submission.csv
├── csv_imp
├── script
│   ├── 
│   └── function.R
└── submit

```

