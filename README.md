https://app.lucidchart.com/documents/edit/3110518a-dd7e-4a23-bad2-c5f8d91f6b14/0_0#?folder_id=home&browser=icon
↑ER図の記述

DB設計

usersテーブルにはemail,password,nameを用意する

itemsテーブルにはtext,image,user_idを登録する

ordersテーブルにはuser_id,item_idを登録する


# README


↑ER図の記述

DB設計

## usersテーブル

| Column   | Type   | Options |
| -----    | ----   | ------- |
| nickname | string | null: false |
| email    | string | null: false |
| password | string | null: false | 
| last_name | string | null: false |
| first_name | string | null: false |
| last_name_kana | string | null: false |
| first_name_kana | string | null: false |
| birthday        | date    | null: false |

### Association

has_many :items
has_many :orders

## itemsテーブル

|Column             |Type     |Options|
|-------------------|---------|-------|
|user_id            | integer | null: false, foreign_key: true |
|explanation        | text    | null: false |
|category_id        | integer | null: false |
|product_name       | string  | null: false |
|price              | integer | null: false |
|product_status_id  | integer | null: false |
|shipping_fee_burden_id| integer | null: false |
|shipping_source_area_id| integer | null: false |
|shipping_days_id      | integer | null: false |


### Association

belongs_to :user
has_one :order
has_one_attached :image

## ordersテーブル

|Column |Type   |Options|
|-------|-------|-------|
|user_id|integer|null: false, foreign_key: true|
|item_id|integer|null: false, foreign_key: true|

### Association
belongs_to :user
belongs_to :item
has_one :address

## addresses
|Column        | Type        |Options|
|--------------|-------------|-------|
|zip_code      | string      |null:false|
|prefecture_id | integer     |null:false|
|city          | string      |null:false|
|street_address| string      |null:false|
|building_name | string      |          |
|phone_number  | string      |null:false|
|order_id      |integer      |null:false, foreign_key: true|

### Association
belong_to :order