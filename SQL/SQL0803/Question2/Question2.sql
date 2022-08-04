#Question2

#ユーザーテーブル
CREATE TABLE userA(user_id Int, user_name VARCHAR(30), email VARCHAR(50), age INT);

#フォローテーブル
CREATE TABLE followA(follower_id INT, followee_id Int); 

#ユーザーテーブルにデータを入力
INSERT INTO userA VALUES(1, 'もっくん', 'mokkun@example.com', 19);
INSERT INTO userA VALUES(2, 'みみこ', 'mimiko@example.com', 20);
INSERT INTO userA VALUES(3, 'さくら', 'sakura@example.com', 31);
INSERT INTO userA VALUES(4, 'ひよこ', 'hiyoko@example.com', 23);
INSERT INTO userA VALUES(5, 'すずき', 'suzuki@example.com', 28);

#フォローテーブルにデータを入力
INSERT INTO followA VALUES(1, 2);
INSERT INTO followA VALUES(1, 3);
INSERT INTO followA VALUES(1, 4);
INSERT INTO followA VALUES(1, 5);
INSERT INTO followA VALUES(3, 1);
INSERT INTO followA VALUES(3, 2);
INSERT INTO followA VALUES(4, 5);
INSERT INTO followA VALUES(5, 1);
INSERT INTO followA VALUES(5, 2);
INSERT INTO followA VALUES(5, 3);
INSERT INTO followA VALUES(5, 4);

#さくらがフォローしているユーザーの名前を一覧で表示する
SELECT u2.user_name
FROM userA u1 
INNER JOIN followA f 
ON u1.user_id = f.follower_id 
INNER JOIN userA u2
ON f.followee_id = u2.user_id
WHERE u1.user_id=3;

#誰もフォローしていないユーザーの名前を表示する
SELECT userA.user_name
FROM userA LEFT JOIN followA
ON userA.user_id = followA.follower_id
WHERE followA.follower_id IS NULL;

#10代、20代、30代といった年代別にフォロー数の平均点を表示する
SELECT CONCAT((FLOOR(age/10)*10),'代') AS age_group, 
SUM(CASE WHEN f.follower_id THEN 1 ELSE 0 END) / COUNT(DISTINCT u.user_id) AS avg_count
FROM userA u 
LEFT JOIN followA f
ON u.user_id = f.follower_id
GROUP BY
CONCAT((FLOOR(age /10)*10),'代');

#相互フォローしているユーザーのIDを表示する
SELECT f1.follower_id AS id1, f1.followee_id AS id2
FROM followA f1
INNER JOIN followA f2
ON f1.follower_id = f2.followee_id AND f1.followee_id = f2.follower_id
WHERE f1.follower_id < f1.followee_id;