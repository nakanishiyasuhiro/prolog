# README

# prolog DB設計

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


# Name（リポジトリ/プロジェクト/OSSなどの名前）
 
Prolog
 
# Features
 
このアプリは、初心者から中級者の方が、qiitaよりも気軽にプログラミングの知識やエラー解決方法などを記録するアプリです。
 
# Requirement
 
* Rails 5.2.4.1
* ruby 2.5.1
 
# Author
 
作成情報を列挙する
 
* nakanishi yasuhiro
* o70.nakanishi.yasuhiro@gmail.com
 
 # function

 # TOPページ
 新規登録・ログインの前段階にTOPページを作成しました。
 シンプルなデザインを心がけました。

 # ユーザー登録・ログイン機能
 gemのdeviseを使用しました。
 SNSのAPIを用いてユーザーの新規登録とログインを作成しました。（まだ開発環境のみ）

# 投稿一覧ページ
ヘッダーとフッダーを利用して、コルクボードのようなデザインにしました。
それぞれの投稿には、画像・名前・ユーザー画像・タグ・いいね機能が表示されています。

各ページについて簡単に説明します。

* 検索機能
JQueryを用いたインクリメンタルサーチ機能を実装しました。

* 新規投稿
左上のボタンから新規投稿していただけます。


* ユーザー一覧
登録してくださるユーザー様を一覧表示させていただいてます。


* いいねランキング！
いいねの数が上位の投稿から順番に表示されるように実装しました。

* コメント機能
投稿の詳細ページからその投稿にコメントをしていただけます。

