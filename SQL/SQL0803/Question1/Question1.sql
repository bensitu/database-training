#Question1

#学生テーブル
CREATE TABLE studentsA(stu_id int, name VARCHAR(30), sex VARCHAR(1));

#試験結果テーブル
CREATE TABLE testResult(stu_id int, course VARCHAR(20), score INT);

#学生テーブルにデータを入力
INSERT INTO studentsA VALUES(1, '長岡一馬', '男');
INSERT INTO studentsA VALUES(2, '中本知佳', '女');
INSERT INTO studentsA VALUES(3, '松本義文', '男');
INSERT INTO studentsA VALUES(4, '佐竹友香', '女');

#試験結果テーブルにデータを入力
INSERT INTO testResult VALUES(1, '国語', 30);
INSERT INTO testResult VALUES(1, '英語', 30);
INSERT INTO testResult VALUES(2, '国語', 70);
INSERT INTO testResult VALUES(2, '数学', 80);
INSERT INTO testResult VALUES(3, '理科', 92);
INSERT INTO testResult VALUES(4, '社会', 90);
INSERT INTO testResult VALUES(4, '理科', 35);
INSERT INTO testResult VALUES(4, '英語', 22);


#性別が男である生徒の名前を一覧で表示する
SELECT * FROM studentsA WHERE sex='男';

#1教科でも30点以下の点数を取った生徒の名前を一覽で表示する
SELECT distinct name, score
FROM studentsA JOIN testResult
ON studentsA.stu_id = testResult.stu_id
WHERE score <= 30;

#性別ごとに、最も高かった試験の点数を表示する
SELECT sex, MAX(score) 
FROM studentsA JOIN testResult
ON studentsA.stu_id = testResult.stu_id
GROUP BY sex;

#教科ごとの試験の平均点が50点以下である教科を表示する
SELECT course, AVG(score) 
FROM testResult 
GROUP BY course
HAVING AVG(score) <= 50;

#試験結果テーブルの点数に右に、その教科の平均点を表示する
SELECT stu_id, course, score, AVG(score)  
FROM testResult 
GROUP BY stu_id,course, score;

SELECT er1.* (SELECT AVG(testResult.score) FROM textResult WHERE er1.course = er2.course) AS avg_score FROM testResult er1;

#試験結果に理科が含まれない生徒の名前を一覧で表示する
SELECT name
FROM studentsA
WHERE stu_id NOT IN (
SELECT stu_id FROM testResult WHERE course='理科');

