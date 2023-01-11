
| モデル名 | カラム名 | データ型 |
|----------|----------|----------|
| User     | id       | integer  |
|          | name     | string   |
|          | email    | string   |

| モデル名 | カラム名     | データ型 |
|----------|--------------|----------|
| Task     | id           | integer  |
|          | task_name    | string   |
|          | task_content | string   |
|          | deadline     | string   |
|          | status       | string   |
|          | priority     | string   |


| モデル名 | カラム名   | データ型 |
|----------|------------|----------|
| Label    | id         | integer  |
|          | label_name | string   |

| モデル名   | カラム名 | データ型   |
|------------|----------|------------|
| Task_Label | task_id  | references |
|            | label_id | references |