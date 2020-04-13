# アプリ名  「Prolog」

# 概要

* TOPページ
新規登録・ログインの前段階にTOPページを作成しました。

シンプルなデザインを心がけました。

* ユーザー登録・ログイン機能

gemのdeviseを使用しました。
SNSのAPIを用いてユーザーの新規登録とログインを作成しました。

* 投稿一覧ページ

ヘッダーとフッダーを利用して、コルクボードのようなデザインにしました。
また、各ページともに背景はコルクボードで統一しています。
それぞれの投稿には、画像・名前・ユーザー画像・タグ・いいね機能等が表示されています。

* 検索機能

JQueryを用いたインクリメンタルサーチ機能を実装しました。
タイトルとユーザーの名前での検索が可能です。

* 新規投稿

その日に解決したエラーや、得た知識などを投稿してすることができます。

* ユーザー一覧

登録してくださるユーザー様を一覧表示することができます。

* いいねランキング！

いいねの数が上位の投稿から順番に表示されるように実装しました。

* 初めての方へ

初めてアプリを使用される方に、使い方の説明ページを設けました。

* コメント機能

投稿の詳細ページからその投稿にコメントをができます。

* テスト実施

RSpec・factory_bot・Fakerを用いたテストを行いました。

* SSL化

SSL化によるWebサイトのセキュリティ向上を行いました。

# 本番環境(デプロイ先 テストアカウント＆ID)

* デプロイ先

https://www.programminglogs.tech/

* テストアカウント

メールアドレス
test-user@gmail.com

パスワード
000000

テストアカウントを使用してログインしてください。

# 制作背景(意図)

　私がプログラミング学習の際、エラー解決ができた時や新しい知識を調べた時にメモなどに書いたりしていましたが、それを一つにまとめて、空き時間などで見て復習したいと考えたことが作成理由です。
現在、プログラミングスクールの同期数人にテスト的に使ってもらって、欲しい機能や改善点をフィードバックしてもらっています。


# DEMO
* TOPページ
[![Image from Gyazo](https://i.gyazo.com/6d2c9c36952e6771bb6600c8f2d3e070.png)](https://gyazo.com/6d2c9c36952e6771bb6600c8f2d3e070)

* ユーザー登録・ログイン機能
[![Image from Gyazo](https://i.gyazo.com/c5eaee83c130275b79a7b6385cd9f290.png)](https://gyazo.com/c5eaee83c130275b79a7b6385cd9f290)
[![Image from Gyazo](https://i.gyazo.com/857f7a155161f8673cb2aadab23a8b75.png)](https://gyazo.com/857f7a155161f8673cb2aadab23a8b75)

* 投稿一覧ページ
[![Image from Gyazo](https://i.gyazo.com/1efd142d039c9ad676f684afd140147f.jpg)](https://gyazo.com/1efd142d039c9ad676f684afd140147f)

* 検索機能
[![Image from Gyazo](https://i.gyazo.com/f992834d20112cdda94f093eed76f517.gif)](https://gyazo.com/f992834d20112cdda94f093eed76f517)

* 新規投稿
[![Image from Gyazo](https://i.gyazo.com/f2dc4acc9f703bbadc21ac54644f8753.jpg)](https://gyazo.com/f2dc4acc9f703bbadc21ac54644f8753)

* ユーザー一覧
[![Image from Gyazo](https://i.gyazo.com/71c12b694b7ba6b793d5615fdfe478be.jpg)](https://gyazo.com/71c12b694b7ba6b793d5615fdfe478be)

* いいねランキング！
[![Image from Gyazo](https://i.gyazo.com/218c7087e2c5b6378cbc8c334c8a8bad.jpg)](https://gyazo.com/218c7087e2c5b6378cbc8c334c8a8bad)

* 初めて使う方へ
[![Image from Gyazo](https://i.gyazo.com/ed3397450aea358fcc3310ff2d75c759.jpg)](https://gyazo.com/ed3397450aea358fcc3310ff2d75c759)

* コメント機能
[![Image from Gyazo](https://i.gyazo.com/6b7e6c208069b8f637d4c0c5556122bd.png)](https://gyazo.com/6b7e6c208069b8f637d4c0c5556122bd)

# 工夫したポイント
色々機能をつけると、本来の目的の使い方から離れる可能性があるため、出来るだけ無駄な機能をつけないことを心がけました。
ログインの際、APIのSNS認証機能を実装して、ユーザー登録をストレスなくしていただくことができます。

# 使用技術(開発環境)
Ruby・Ruby on Rails・JavaScript・jQuery・GitHub・AWS

# 課題や今後実装したい機能
タグ機能はgemで導入した簡易的なものなので、改善してタグをseedを導入予定です。

# DB設計

## programminglogsテーブル
|Column|Type|Options|
|------|----|-------|
|title|string|null: false|
|text|text|null: false|
|user_id|integer|null: false|
|image|text|null: false|
### Association
- belongs_to :user
- has_many :comments
- has_many :likes, dependent: :destroy

## usersテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|email|string|null: false|
|password|string|null: false|
|image|string|
### Association
- has_many :programminglogs, dependent: :destroy
- has_many :comments
- has_many :likes, dependent: :destroy
- has_many :liked_programminglogs, through: :likes, source: :programminglog

## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|text|text|null: false|
|user_id|integer|
|programminglog_id|integer|
### Association
- belongs_to :programminglog, optional: true
- belongs_to :user  

## likesテーブル
|Column|Type|Options|
|------|----|-------|
|programminglog_id|bigint|
|user_id|bigint|
### Association
- belongs_to :programminglog, counter_cache: :likes_count
- belongs_to :user

## sns_credentialsテーブル
|Column|Type|Options|
|------|----|-------|
|provider|string|
|uid|string|
|user_id|bigint|
### Association
- belongs_to :user, optional: true

## taggingsテーブル
|Column|Type|Options|
|------|----|-------|
|tag_id|integer|
|taggable_type|string|
|taggable_id|integer|
|tagger_type|string|
|tagger_id|integer|
|context|string|

## tagsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|
|taggings_count|integer|


