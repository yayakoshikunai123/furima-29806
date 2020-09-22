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
|category           | string  | null: false |
|product_name       | string  | null: false |
|price              | string  | null: false |
|product_status     | integer | null: false |
|shipping_fee_burden| integer | null: false |
|shipping_source_area| integer | null: false |
|shipping_days       | integer | null: false |


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
|prefecture    | string      |null:false|
|city          | string      |null:false|
|street_address| string      |null:false|
|building_name | string      |null:false|
|phone_number  | string      |null:false|
|purchase_information|string |null:false|
|order_id      |integer      |null:false, foreign_key: true|

### Association
belong_to :order