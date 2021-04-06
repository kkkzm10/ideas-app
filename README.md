# テーブル設計

## categories テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| id       | bigint | null: false |
| name     | string | null: false, unique: true |

### Association

- has_many :ideas


## ideas テーブル

| Column          | Type       | Options     |
| --------        | ------     | ----------- |
| id              | bigint     | null: false |
| category_id     | references | null: false, foreign-key: true |
| body            | text       | null: false |

### Association

- belongs_to :category