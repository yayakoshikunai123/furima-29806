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


