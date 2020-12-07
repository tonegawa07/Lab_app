# Lab App

### App that improve work efficiency in the Lab.
### Labでの作業効率を向上させるアプリケーション
### 起動方法

##### 1. 以下のURLからアクセス
※ 25 hour/monthのみアクティブ  
※ csvファイルに日本語が入っているとエラーが起きるので注意してください．  
https://lab-app.shinyapps.io/Lab-App/

##### 2. 以下のコマンドをRコンソールで実行して下さい．  
※ shinyパッケージをインストールしてある必要があります．

```R
library(shiny)
runGitHub("Lab_app", "tonegawa07")
```

## 1. Calculation of HPLC data

#### Consept

#### 煩雑なコピー＆ペーストが不要なため，人為的ミスの防止と迅速な計算が可能です．

### How to use

#### 1. 以下の形式のcsvファイルを用意する必要があります．

- 必須条件
  - 1列目が"STD", "UNK"を含むサンプルIDであること  
  - 2列目以降には定量に使用する値が入っていること
  - 最終列が秤量値であること

### In case of Catechins & Caffeine

| ID | C         | EC        | GC        | EGC       | EGCG      | Caf.      | ECG       | CG        | DW           |
|-------|-----------|-----------|-----------|-----------|-----------|-----------|-----------|-----------|--------------|
| STD-0001 | peak area | peak area | peak area | peak area | peak area | peak area | peak area | peak area |              |
| STD-0002 | peak area | peak area | peak area | peak area | peak area | peak area | peak area | peak area |              |
| STD-0003 | peak area | peak area | peak area | peak area | peak area | peak area | peak area | peak area |              |
| UNK-0001 | peak area | peak area | peak area | peak area | peak area | peak area | peak area | peak area | start weight |
| UNK-0002 | peak area | peak area | peak area | peak area | peak area | peak area | peak area | peak area | start weight |
| UNK-0003 | peak area | peak area | peak area | peak area | peak area | peak area | peak area | peak area | start weight |

### In case of FAAs

| ID    | Asp             | Glu             | Asn             | Ser             | Gln             | IS              | Arg             | Ala             | Thea            | GABA            | DW           |
|----------|-----------------|-----------------|-----------------|-----------------|-----------------|-----------------|-----------------|-----------------|-----------------|-----------------|--------------|
| STD-0001 | peak area ratio | peak area ratio | peak area ratio | peak area ratio | peak area ratio | peak area ratio | peak area ratio | peak area ratio | peak area ratio | peak area ratio |              |
| STD-0002 | peak area ratio | peak area ratio | peak area ratio | peak area ratio | peak area ratio | peak area ratio | peak area ratio | peak area ratio | peak area ratio | peak area ratio |              |
| STD-0003 | peak area ratio | peak area ratio | peak area ratio | peak area ratio | peak area ratio | peak area ratio | peak area ratio | peak area ratio | peak area ratio | peak area ratio |              |
| UNK-0001 | peak area ratio | peak area ratio | peak area ratio | peak area ratio | peak area ratio | peak area ratio | peak area ratio | peak area ratio | peak area ratio | peak area ratio | start weight |
| UNK-0002 | peak area ratio | peak area ratio | peak area ratio | peak area ratio | peak area ratio | peak area ratio | peak area ratio | peak area ratio | peak area ratio | peak area ratio | start weight |
| UNK-0003 | peak area ratio | peak area ratio | peak area ratio | peak area ratio | peak area ratio | peak area ratio | peak area ratio | peak area ratio | peak area ratio | peak area ratio | start weight |

#### 2. "Choose CSV File"の欄から用意したcsvファイルをupします．
"rawdata"タブでupしたデータを確認することができます．  
"std plt"タブでSTDのばらつきがないかを確認することができます．

#### 3. "std conc. (ppm)", "Dilution", "Extraction (mL)"の3つのパラメータを設定し，"Calculation"ボタンをクリックします．
"result"タブにmg/g換算後のデータが追加されたテーブルが表示されています．

#### 4. "Download"ボタンをクリックします．
“result"タブに表示されていたテーブルがダウンロードされます．

## 2. Statistical test
#### Consept

#### 統計検定の結果を表形式データで保存することが可能です．

### 2-1. Tukey
### How to use

#### 1. 以下の形式のcsvファイルを用意する必要があります．

- 必須条件
  - 1列目がクラス (部位など) であること
  - 2列目がTukeyにより比較したい処理区であること
  - 3列目が処理区ごとのn数であること
  - 4列目以降にTukeyで比較したい値が入っていること

### For example

| class | treat       | n | K     | Ca    | Mg    |
|-------|-------------|---|-------|-------|-------|
| leaf  | treatment A | 1 | value | value | value |
| leaf  | treatment A | 2 | value | value | value |
| leaf  | treatment A | 3 | value | value | value |
| leaf  | treatment B | 1 | value | value | value |
| leaf  | treatment B | 2 | value | value | value |
| leaf  | treatment B | 3 | value | value | value |
| leaf  | treatment C | 1 | value | value | value |
| leaf  | treatment C | 2 | value | value | value |
| leaf  | treatment C | 3 | value | value | value |
| root  | treatment A | 1 | value | value | value |
| root  | treatment A | 2 | value | value | value |
| root  | treatment A | 3 | value | value | value |
| root  | treatment B | 1 | value | value | value |
| root  | treatment B | 2 | value | value | value |
| root  | treatment B | 3 | value | value | value |
| root  | treatment C | 1 | value | value | value |
| root  | treatment C | 2 | value | value | value |
| root  | treatment C | 3 | value | value | value |

#### 2. "Choose CSV File"の欄から用意したcsvファイルをupします．
"rawdata"タブでupしたデータを確認することができます．

#### 3. "Significancelevel (p-value)"で有意水準を設定し，"Make tukey table"ボタンをクリックします．
"tukey table"タブにテーブルが表示されています．

#### 4. "Download"ボタンをクリックします．
“tukey table"タブに表示されていたテーブルがダウンロードされます．