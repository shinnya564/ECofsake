# サイト名
ECofsake https://ecofsake.com ![スクリーンショット 2020-10-02 16 51 12](https://user-images.githubusercontent.com/65529573/94900434-f3cd6e00-04cf-11eb-806d-d34c365311f7.jpg)

## サイト概要
お酒好きな人がお酒の知識を披露でき、カクテルを作る道具を購入できるサイトです。Google Search Console登録済のため検索ができます。
昨今、対面型の店舗経営が難しい印象を持ったため、ネット通販が簡単に始められたらいいなと思い、ECサイトを作成してみました。
<img height="４00" alt="スクリーンショット 2020-10-02 18 27 39" src="https://user-images.githubusercontent.com/65529573/94908674-07330600-04dd-11eb-93b5-a271f2b89f64.png">

エンドユーザーができる基本機能は、①商品の購入②ログイン後、商品へのコメント③お酒の知識の公開（掲示板機能）
管理者ができる基本機能は、①通信販売商品管理②注文管理③ユーザー情報の管理
会員になるとサイト内でお酒を作る際に役に立つ道具（輸入品は除く）が購入できます。※許可や注意が必要な商品があるため

支払い方法は、クレジットカード支払い、代引きの２択。クレジットカード情報は直接DBに保存せず、jsで暗号化してdbに保存します。
支払い情報に関しては、Pay.jpのAPIで管理します。
※なお、今回はPF用に作成したため、テスト環境で実装し、テスト用クレジットカード情報以外は登録できないよう設定する
テストカードURL：https://pay.jp/docs/testcard
![スクリーンショット 2020-10-02 16 59 19](https://user-images.githubusercontent.com/65529573/94900850-b1586100-04d0-11eb-8008-b86b49eea785.jpg)

### サイトテーマ
オーセンティックなバーをイメージした、高級感のあるサイト

### テーマを選んだ理由
お酒の味や雰囲気を楽しむ人を集めるため

### ターゲットユーザ
お酒が好きな落ち着いた人

### 主な利用シーン
・お酒仲間を作りたい時
・お酒を自分で作ってみたい時

## 設計書
### 機能一覧
<https://docs.google.com/spreadsheets/d/1E1KFWwneQk18MDcBJiwL_Qt9UHGe551Vc5iHeD9HCJQ/edit#gid=0>
### AWS設計図
https://docs.google.com/spreadsheets/d/1Rv3fY1OIhyrJtLWk7B0snEgza_ZzQxPP9LcZ_LCn-C8/edit#gid=1937705996
