* User
-------------------------------------------------
| Colume          | Type     | 
| :-------------: | -------- | 
| id              | integer  | 
| email           | string   | 
| password_digest | string   | 
| name            | string   | 

* Task 
-------------------------------------------------
| Column   | Type     | 
| -------- | -------- | 
| id       | integer  | 
| title    | string   | 
| content  | string   | 
| deadline | integer  | 
| priority | integer  | 
| user_id  | integer  | 

* Label
-------------------------------------------------
| Column      | Type     | 
| ----------- | -------- | 
| id          | integer  | 
| explanation | text     | 

* Connect
-------------------------------------------------
| Column   | Type     | 
| -------- | -------- | 
| task_id  | integer  | 
| label_id | integer  | 