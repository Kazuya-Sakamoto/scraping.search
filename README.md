<img src="https://cdn-images-1.medium.com/max/959/1*Qc0XxYm-qAZL-7tjjlNfrg.png" width="100"><img src="http://i2.wp.com/samancha.com/wp-content/uploads/2017/12/rails.png?fit=600%2C600" width="100"><img src="http://f.st-hatena.com/images/fotolife/n/nipe880324/20141001/20141001005928.png?1412092889" width="140"><img src="https://upload.wikimedia.org/wikipedia/commons/thumb/9/96/Sass_Logo_Color.svg/1200px-Sass_Logo_Color.svg.png" width="100"><img src="https://www.mysql.com/common/logos/logo-mysql-170x115.png" width="140">
# Details
スクレイピング検索とDBからの検索を同時に検索できるアプリ。
ニュースの主要トピックをまとめて検索ができる。

# Environment
- Ruby 2.5.1
- Rails 5.2.4
- Haml
- SCSS
- JavaScript 
- MySQL

## gem
- gem 'haml-rails'
- gem 'pry-rails'
- gem 'devise'
- gem 'mechanize'
- gem 'kaminari'

# scraping.search DB設計

## users テーブル
|Column|Type|Options|
|------|----|-------|
|email|string||null: false|
|password|string|null: false|
### Asociation
- has_many :comments
- has_many :posts

## posts テーブル
|Column|Type|Options|
|------|----|-------|
|title|text|null: false|
|user_id|refrences|null: false, foregin_key :true|
### Asociation
- belongs_to :user
- has_many :comments
- has_many :post_categories
- has_many :categories, through: :post_categories

## comments テーブル
|Column|Type|Options|
|------|----|-------|
|text|string||null: false|
|user_id|refrences|null: false, foregin_key :true|
|goal_id|refrences|null: false, foregin_key :true|
### Asociation
- belongs_to :post
- belongs_to :user  

## categories
|Column|Type|Options|
|------|----|-------|
|name|string|
### Asociation
- has_many :post_categories
- has_many :posts, through: :post_categories

## post_categories
|Column|Type|Options|
|------|----|-------|
|user_id|refrences|null: false, foregin_key :true|
|goal_id|refrences|null: false, foregin_key :true|
### Asociation
 - belongs_to :post
 - belongs_to :category

