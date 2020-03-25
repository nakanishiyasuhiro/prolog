# README

# アプリ名
「Prolog」

# 概要

* TOPページ
新規登録・ログインの前段階にTOPページを作成しました。
シンプルなデザインを心がけました。

* ユーザー登録・ログイン機能
gemのdeviseを使用しました。
SNSのAPIを用いてユーザーの新規登録とログインを作成しました。（まだ開発環境のみ）

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

* コメント機能
投稿の詳細ページからその投稿にコメントをができます。

# 本番環境(デプロイ先 テストアカウント＆ID)

* デプロイ先

http://52.68.235.100/

* テストアカウント

メールアドレス
test@gmail

パスワード
000000

テストアカウントを使用してログインしてください。

# 制作背景(意図)

自分がエラー解決ができた際にメモなどに書いたりするが、どこかに無くしてその知識を忘れることが多くありました。
それを記録するアプリを作り空き時間などで見て復習したいと考えたことが作成理由です。
現在、プログラミングスクールの同期数人にテスト的に使ってもらって、欲しい機能や改善点をフィードバックしてもらっています。


# DEMO(gifで動画や写真を貼って、ビューのイメージを掴んでもらいます)
* TOPページ
[![Image from Gyazo](https://i.gyazo.com/6d2c9c36952e6771bb6600c8f2d3e070.png)](https://gyazo.com/6d2c9c36952e6771bb6600c8f2d3e070)

* ユーザー登録・ログイン機能
[![Image from Gyazo](https://i.gyazo.com/8720f5c602fbfaa6f95c21040bc3e98e.png)](https://gyazo.com/8720f5c602fbfaa6f95c21040bc3e98e)
[![Image from Gyazo](https://i.gyazo.com/d3444971f50293eb6999a3e3d3c42d60.png)](https://gyazo.com/d3444971f50293eb6999a3e3d3c42d60)

* 投稿一覧ページ
[![Image from Gyazo](https://i.gyazo.com/3782c5482c883c07cdd6388275a0d225.jpg)](https://gyazo.com/3782c5482c883c07cdd6388275a0d225)

* 検索機能
[![Image from Gyazo](https://i.gyazo.com/7b7b4b67fcda760cef67e232b3ad70de.gif)](https://gyazo.com/7b7b4b67fcda760cef67e232b3ad70de)

* 新規投稿
[![Image from Gyazo](https://i.gyazo.com/f2dc4acc9f703bbadc21ac54644f8753.jpg)](https://gyazo.com/f2dc4acc9f703bbadc21ac54644f8753)

* ユーザー一覧
[![Image from Gyazo](https://i.gyazo.com/9813d241d0fc81720098cf7171fa7cf7.jpg)](https://gyazo.com/9813d241d0fc81720098cf7171fa7cf7)

* いいねランキング！
[![Image from Gyazo](https://i.gyazo.com/64a1dc2f6350644bf1b03ea466216120.jpg)](https://gyazo.com/64a1dc2f6350644bf1b03ea466216120)

* コメント機能
[![Image from Gyazo](https://i.gyazo.com/6b7e6c208069b8f637d4c0c5556122bd.png)](https://gyazo.com/6b7e6c208069b8f637d4c0c5556122bd)

# 工夫したポイント
色々機能をつけると、本来の目的の使い方から離れる可能性があるため、出来るだけ無駄な機能をつけないことを心がけました。

# 使用技術(開発環境)
Ruby・Ruby on Rails・JavaScript・jQuery・GitHub・AWS

# 課題や今後実装したい機能
現在、開発環境でのみSNSのAPI登録を実装しているので、本番環境にも反映させたい。
タグ機能はgemで導入した簡易的なものなので、改善してタグをseedを利用したい。

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
### Association

