
# HEROKUデブロイ手順
1.heroku cretate
2.heroku create
3.git add .
4.git commit -m"init"
5.git push heroku step2:master
6.heroku run rails db:maigrate
7.heroku open


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