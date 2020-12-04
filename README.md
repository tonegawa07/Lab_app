# Lab App

### App that improve work efficiency in the Lab.
### Labでの作業効率を向上させるアプリケーション
### 起動方法

##### 1. 以下のURLからアクセス
※ 25 hour/monthのみアクティブ  
https://lab-app.shinyapps.io/Lab-App/

##### 2. 以下のコマンドをRコンソールで実行して下さい．  
※ shinyパッケージをインストールしてある必要があります．

```R
library(shiny)
runGitHub("Lab_app", "tonegawa07")
```

## 1. Calculation of HPLC data

### Consept

#### Since complicated copy and paste is not required, human error prevention and quick calculation are possible.

#### 煩雑なコピー＆ペーストが不要なため，人為的ミスの防止と迅速な計算が可能です．

You need to prepare a csv file in the following format.  
以下の形式のcsvファイルを用意する必要があります．

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