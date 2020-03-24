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
 
* 作成者
* 所属
* E-mail
 
