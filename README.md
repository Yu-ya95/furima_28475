# テーブル設計

## users テーブル

| Column          | Type   | Options     |
| --------------- | ------ | ----------- |
| nickname        | string | null: false |
| email           | string | null: false |
| password        | string | null: false |
| last_name       | string | null: false |
| first_name      | string | null: false |
| last_name_kana  | string | null: false |
| first_name_kana | string | null: false |
| birthday        | date   | null: false |

### Association

- has_many :products
- has_many :purchases
- has_many :comments

## products テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| product         | string     | null: false                    |
| product_text    | text       | null: false                    |
| category        | string     | null: false                    |
| status          | string     | null: false                    |
| postage         | string     | null: false                    |
| area            | string     | null: false                    |
| delivery_days   | string     | null: false                    |
| price           | integer    | null: false                    |
| user            | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :purchase
- has_many :comments

## purchases テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| postcode        | string     | null: false                    |
| prefecture      | string     | null: false                    |
| city            | string     | null: false                    |
| block           | string     | null: false                    |
| building        | string     |                                |
| phone_number    | string     | null: false                    |
| user            | references | null: false, foreign_key: true |
| product         | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :product

## comments テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| comment_text    | text       |                                |
| user            | references | null: false, foreign_key: true |
| product         | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :product