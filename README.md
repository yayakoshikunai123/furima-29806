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
| name     | string | null: false |
| email    | string | null: false |
| password | string | null: false | 

### Association

has_many :items
has_one :order

## itemsテーブル

|Column |Type     |Options|
|-------|---------|-------|
|user_id| integer | null: false, foreign_key: true |
|text   | string  | null: false |
|image  | string  | null: false |

### Association

belongs_to :user
has_one :order

## ordersテーブル

|Column |Type   |Options|
|-------|-------|-------|
|user_id|integer|null: false, foreign_key: true|
|item_id|integer|null: false, foreign_key: true|

### Association
belongs_to :user
belongs_to :item


