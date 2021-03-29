# テーブル設計

## users テーブル

| Column   | Type    | Options     |
| -------- | ------- | ----------- |
| nickname | string  | null: false |
| email    | string  | null: false |
| password | string  | null: false |
| name     | string  | null: false |
| furigana | string  | null: false |
| birthday | integer | null: false |

### Association

- has_many :items
- has_many :purchases

## items テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| name         | text       | null: false                    |
| explanation  | text       | null: false                    |
| category     | string     | null: false                    |
| quality      | string     | null: false                    |
| delivery_fee | string     | null: false                    |
| area         | string     | null: false                    |
| delivery_day | string     | null: false                    |
| price        | integer    | null: false                    |
| user_id      | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :purchase

## purchase テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| card_number      | integer    | null: false                    |
| card_expiration  | integer    | null: false                    |
| cvc              | integer    | null: false                    |
| postal_code      | integer    | null: false                    |
| prefecture       | string     | null: false                    |
| city             | string     | null: false                    |
| address          | string     | null: false                    |
| building         | string     | null: false                    |
| telephone_number | integer    | null: false                    |
| user_id          | references | null: false, foreign_key: true |
| item_id          | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
