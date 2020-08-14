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

- has_many :items
- has_many :purchases
- has_many :orders
- has_many :comments


## items テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| item_name          | string     | null: false                    |
| product_text       | text       | null: false                    |
| category_code      | integer    | null: false                    |
| status_code        | integer    | null: false                    |
| postage_code       | integer    | null: false                    |
| prefecture_code    | integer    | null: false                    |
| delivery_days_code | integer    | null: false                    |
| price              | integer    | null: false                    |
| user_id            | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :purchase
- has_one :orders
- has_many :comments


## orders テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| user_id         | references | null: false, foreign_key: true |
| item_id         | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item

## deliverys テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| postcode        | string     | null: false                    |
| prefecture_code | integer    | null: false                    |
| city            | string     | null: false                    |
| block           | string     | null: false                    |
| building        | string     |                                |
| phone_number    | string     | null: false                    |
| user_id         | references | null: false, foreign_key: true |
| item_id         | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item

## comments テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| comment_text    | text       |                                |
| user_id         | references | null: false, foreign_key: true |
| item_id         | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item