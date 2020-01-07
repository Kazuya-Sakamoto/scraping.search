# Environment
- Ruby 2.5.1
- Rails 5.2.4
- Haml
- SCSS
- JavaScript 
- MySQL

## 使用gem
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

## category
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

