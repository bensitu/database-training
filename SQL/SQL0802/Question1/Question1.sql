USE db1;

SHOW TABLES FROM db1;

#创建表
CREATE TABLE characters(id int, age int, sex VARCHAR(1), name VARCHAR(20), job VARCHAR(20), level int);

#添加数据
INSERT INTO characters VALUES(1, 20, 'm', 'Tom', '戦士', '50');
INSERT INTO characters VALUES(2, 30, 'm', 'Ken', '刺客', '40');
INSERT INTO characters VALUES(3, 40, 'f', 'Mary', '魔法使い', '60');
INSERT INTO characters VALUES(4, 25, 'f', 'Lucy', '刺客', '80');
INSERT INTO characters VALUES(5, 22, 'm', 'Ben', '戦士', '90');
INSERT INTO characters VALUES(6, 43, 'f', 'Mia', '賢者', '90');
INSERT INTO characters VALUES(7, 60, 'f', '佐藤', '天使', '30');
INSERT INTO characters VALUES(8, 18, 'm', '風間', '魔法使い', '100');
INSERT INTO characters VALUES(9, 16, 'f', '黒田', '戦士', '90');
INSERT INTO characters VALUES(10, 75, 'f', '凯特琳', '賢者', '20');
INSERT INTO characters VALUES(11, 25, 'm', '李', '魔法使い', '20');
INSERT INTO characters VALUES(12, 16, 'm', '王', '戦士', '55');
INSERT INTO characters VALUES(13, 21, 'f', '石原さとみ', '天使', '65');
INSERT INTO characters VALUES(14, 21, 'f', '藤田ニコル', '初心者', '10');
INSERT INTO characters VALUES(15, 21, 'm', '东方不败', '射手', '55');

SELECT * FROM characters;

#以性别分组
SELECT sex,count(*) FROM characters GROUP BY sex;

#按年龄排序
SELECT * FROM characters ORDER BY age;

#以年龄分组
SELECT age,count(*) FROM characters GROUP BY age;

#年龄20岁以上
SELECT * FROM characters WHERE age>=20;

#50岁以下不是战士职业
SELECT * FROM characters WHERE age<50 AND job <> '戦士';

#30岁以上等级不满30
SELECT * FROM characters WHERE age>30 AND level<30;