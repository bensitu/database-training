#Question2

#ユーザーテーブル
CREATE TABLE userA(user_id int, user_name VARCHAR(30), email VARCHAR(50), age INT);

#フォローテーブル
CREATE TABLE followA(follower INT, follow_id int); 

#ユーザーテーブルにデータを入力
INSERT INTO userA VALUES(1, 'もっくん', 'mokkun@example.com', 19);
INSERT INTO userA VALUES(1, 'みみこ', 'mimiko@example.com', 20);
INSERT INTO userA VALUES(1, 'さくら', 'sakura@example.com', 31);
INSERT INTO userA VALUES(1, 'ひよこ', 'hiyoko@example.com', 23);
INSERT INTO userA VALUES(1, 'すずき', 'suzuki@example.com', 28);

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