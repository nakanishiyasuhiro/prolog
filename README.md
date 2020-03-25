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


* ユーザー登録・ログイン機能


* 投稿一覧ページ


* 検索機能


* 新規投稿


* ユーザー一覧


* いいねランキング！


* コメント機能


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

