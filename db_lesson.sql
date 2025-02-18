-- Q1
CREATE TABLE `departments`(
`department_id` INT unsigned AUTO_INCREMENT PRIMARY KEY NOT NULL,
`name` VARCHAR(20) NOT NULL,
`created_at` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
`updated_at` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);
/*
・department_id→部署ID、name→部署名、created_at→作成日時、updated_at→更新日時
・DEFAULTはデフォルト値を定義する。NULLは「データなし」を意味する値
*/

-- Q2
ALTER TABLE `people` ADD `department_id` INT unsigned DEFAULT NULL AFTER `email`;

-- Q3
INSERT INTO departments(name)
values
('営業'),
('開発'),
('経理'),
('人事'),
('情報システム')
;

INSERT INTO people(name, email, age, gender, department_id)
values
('佐藤一郎','satou@gizumo.jp','25','1','1'),
('橋本二郎','hashimoto@gizumo.jp','21','1','1'),
('坂口花子','sakagichi@gizumo.jp','39','2','1'),
('山口和美','sakaguchi@gizumo.jp','22','2','2'),
('山中柔太郎','yamanaka@gizumo.jp','35','1','2'),
('南由紀','minami@gizumo.jp','28','2','2'),
('安沢雄二','yasuzawa@gizumo.jp','45','1','2'),
('小林拓斗','kobayashi@gizumo.jp','28','1','3'),
('柊翔','hiiragi@gizumo.jp','20','1','4'),
('田山けいこ','tayama@gizumo.jp','34','2','5')
;

INSERT INTO reports(person_id, content)
values
(7,'今日は2月17日の月曜日です。'),
(8,'バレンタインデーにチョコをもらいました。'),
(9,'今月から一生懸命頑張ります。'),
(10,'帰ったらすぐにお風呂に入ります。'),
(11,'明日はきっと7時起きです。'),
(12,'弟が大学卒業しました。'),
(13,'最近はサウナにハマっています。'),
(14,'最近はよくライブに行ってます。'),
(15,'「ひいらぎ」って読めないですよね'),
(16,'新しい趣味を見つけました。')
;

-- Q4
UPDATE people SET department_id = '2' WHERE person_id = 1;
UPDATE people SET department_id = '4' WHERE person_id = 2;
UPDATE people SET department_id = '1' WHERE person_id = 3;
UPDATE people SET department_id = '5' WHERE person_id = 4;
UPDATE people SET department_id = '3' WHERE person_id = 6;

-- Q5
SELECT name,age FROM people WHERE gender = 1 ORDER BY age DESC;

-- Q6
/*
peopleテーブルのname、email、ageカラムを作った時間でレコードを並び変えている。
*/

-- Q7
SELECT name FROM people WHERE age BETWEEN 20 AND 29 AND gender = 2;
SELECT name FROM people WHERE age BETWEEN 40 AND 49 AND gender = 1;

-- Q8
SELECT name FROM people WHERE department_id = 1 ORDER BY age ASC;

-- Q9
SELECT AVG(age) AS average_age FROM people WHERE department_id = 2 AND gender = 2;

-- Q10　名前と部署名とその人が提出した日報
  -- peopleのnameとdepartmentsのnameとreportsのcontentを取得したい
  -- departmentsのnameとpeopleのdepartment_idを紐づける
  /*
  SELECT * FROM people INNER JOIN departments ON people.department_id = departments.department_id; 
  SELECT * FROM people INNER JOIN reports ON people.person_id = reports.person_id;
  SELECT name,content FROM people;
  */
SELECT people.name, departments.name, reports.content FROM people
INNER JOIN departments ON people.department_id = departments.department_id
INNER JOIN reports ON people.person_id = reports.person_id;

-- Q11
SELECT people.name FROM people
LEFT OUTER JOIN reports ON people.person_id = reports.person_id WHERE reports.content IS ;