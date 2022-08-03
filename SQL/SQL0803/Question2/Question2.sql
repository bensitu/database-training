#Question2

#ユーザーテーブル
CREATE TABLE userA(user_id Int, user_name VARCHAR(30), email VARCHAR(50), age INT);

#フォローテーブル
CREATE TABLE followA(follower INT, follow_id Int); 

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
SELECT followA.follow_id, userA.user_name
FROM followA JOIN userA 
ON userA.user_id = followA.follower AND userA.user_id = followA.follower
WHERE userA.user_name='さくら';

#誰もフォローしていないユーザーの名前を表示する
SELECT userA.user_name
FROM userA JOIN followA
ON userA.user_id = followA.follow_id AND userA.user_id = followA.follower
WHERE followA.follower <> null;

#10代、20代、30代といった年代別にフォロー数の平均点を表示する


#相互フォローしているユーザーのIDを表示する
SELECT DISTINCT user_id 
FROM