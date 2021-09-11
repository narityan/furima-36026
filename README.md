# テーブル設計

## users テーブル

| Column             | Type    | Options     |
| ------------------ | ------- | ----------- |
| nickname           | string  | null: false |
| email              | string  | null: false |
| encrypted_password | string  | null: false |
| family_name        | string  | null: false |
| first_name         | string  | null: false |
| family_name_kana   | string  | null: false |
| first_name_kana    | string  | null: false |
| birth_year         | integer | null: false |
| birth_month        | integer | null: false |
| birth_day          | integer | null: false |

### Association

- has_many :item
- has_many :purchase

## items テーブル

| Column             | Type       | Options            |
| ------------------ | ---------- | ------------------ |
| image              | text       |                    |
| item_name          | string     | null: false        |
| introduction       | text       | null: false        |
| category           | text       | null: false        |
| item_condition     | string     | null: false        |
| postage_payer      | string     | null: false        |
| seller_prefectures | string     | null: false        |
| preparation_day    | integer    | null: false        |
| price              | integer    | null: false        |
| user               | references |                    |

### Association

- has_one :purchase
- belongs_to :users

## purchases テーブル

| Column             | Type       | Options     |
| ------------------ | ---------- | ----------- |
| user               | references |             |
| item               | references |             |

### Association

- belongs_to :users
- belongs_to :item
- has_one :address

## addresses テーブル

| Column             | Type       | Options     |
| ------------------ | ---------- | ----------- |
| post_cod           | integer    | null: false |
| prefectures        | string     | null: false |
| city               | string     | null: false |
| house_name         | string     | null: false |
| building_name      | string     | null: false |
| phone_number       | integer    | null: false |
| purchase           | references |             |

### Association

- belongs_to :purchase