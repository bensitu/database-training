USE db1;

#表を作る
CREATE TABLE students(stu_id int, sex VARCHAR(1), name VARCHAR(20), course VARCHAR(20), score int);

#データを入力
INSERT INTO students VALUES(001, '男', '長岡一馬', '國語', 30);
INSERT INTO students VALUES(001, '男', '長岡一馬', '英語', 30);
INSERT INTO students VALUES(002, '女', '中本知佳', '國語', 70);
INSERT INTO students VALUES(002, '女', '中本知佳', '数学', 80);
INSERT INTO students VALUES(003, '男', '松本義文', '理科', 92);
INSERT INTO students VALUES(003, '男', '松本義文', '社会', 90);
INSERT INTO students VALUES(004, '女', '佐竹友香', '理科', 35);
INSERT INTO students VALUES(004, '女', '佐竹友香', '英語', 22);

#1教科でも30点以下の点数を取った生徒の名前を一覽で表示する
SELECT * FROM students WHERE score<30;

#国語参加された学生を一覽で表示する
SELECT * FROM students WHERE course='國語';

#理科または数学のテストを参加された学生を一覽で表示する
SELECT * FROM students WHERE course='理科' OR course='数学';

#英語テスト参加されてない学生を一覽で表示する
SELECT * FROM students WHERE course<>'英語';

#点数を高い順番で表示する
SELECT * FROM students ORDER BY score DESC;

#すべでの科目テストを参加した人数を表示する
SELECT * FROM students WHERE course='國語' AND course='英語' AND course='理科' AND course='数学' AND course='社会';
