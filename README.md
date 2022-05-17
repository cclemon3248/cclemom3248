User
--
| Colume          | Type     | 
| :-------------: | -------- | 
| id              | integer  | 
| email           | string   | 
| password_digest | string   | 
| name            | string   | 

Task 
--
| Column   | Type     | 
| -------- | -------- | 
| id       | integer  | 
| title    | string   | 
| content  | string   | 
| deadline | date     | 
| priority | string   | 
| status   | string   | 
| user_id  | integer  | 

Label
--
| Column   | Type     | 
| ----------- | -------- | 
| id          | integer  | 
| tag         | string   | 

Connect
--
| Column   | Type     | 
| -------- | -------- | 
| task_id  | integer  | 
| label_id | integer  | 

Herokuへのデプロイ方法
--

**新しいアプリケーションを作成**
```新しいアプリケーションを作成
 heroku login
 heroku create
```
**buildpackを追加** 
```buildpackを追加 
heroku buildpacks:set heroku/ruby 
heroku buildpacks:add --index 1 heroku/nodejs
```
**デプロイ** 
```デプロイ 
bundle lock --add-platform x86_64-linux 
git add -a 
git commit -m “bundle lock --add-platform x86_64-linux” 
git push heroku step2:master
```
**データベースの移行**
```データベースの移行 
heroku run rails db:migrate
```