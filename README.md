<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
**Table of Contents**  *generated with [DocToc](https://github.com/thlorenz/doctoc)*

- [Home_Credit_Kaggle](#home_credit_kaggle)
  - [Rmd.file](#rmdfile)
  - [Script.file](#scriptfile)
  - [submit.file](#submitfile)
  - [about_column.numbers](#about_columnnumbers)
- [Layered Directory](#layered-directory)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

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

## about_column.numbers

- csv dataの各カラムの説明, およびメモ
- ROW name and memo (青色): 欠損値かつ無処理
- ROW name (青色): 欠損値かつ処理したカラムを追加済み

# Layered Directory
 
```
├── EDA.Rmd
├── EDA.html
├── XGBoost.Rmd
├── XGBoost.html
├── Home_Credit_Kaggle.Rproj
├── about_column.numbers
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
