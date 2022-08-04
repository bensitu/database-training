#テーブルの名前がTRAVEL_ROUTESに変更する
RENAME TABLE travel_route TO travel_routes;

#旅行線路名がROUTE_NAMEに変更する
ALTER TABLE travel_routes CHANGE travel_route_name ruote_name VARCHAR(30);
ALTER TABLE travel_routes CHANGE route_id ruote_name_id VARCHAR(3);

#出発時間がCHAR(10)型に変更する
ALTER TABLE travel_routes MODIFY departure CHAR(10);

#値段がVARCHAR(7)に変更する
ALTER TABLE travel_routes MODIFY price VARCHAR(7);

#路線
INSERT INTO travel_routes VALUES('R01', '北海道1泊1部屋', '東京', '札幌', '国内', '2月6日', '4500');
INSERT INTO travel_routes VALUES('R02', '東京八王子市一日中', '東京都江東区', '東京都八王子市', '県内', '5月14日', '1000');
INSERT INTO travel_routes VALUES('R03', '日本からイギリスへ2週間', '東京', 'イギリス', '国際', '6月10日', '1300000');

#値段の長さを10桁に変更する
ALTER TABLE travel_routes MODIFY price VARCHAR(10);

#新しい最大人数の列を追加する　MAX_COUNT, NUMBER
ALTER TABLE travel_routes ADD max_count INT;

#自由で他の内容を追加してください
ALTER TABLE travel_routes ADD discount DOUBLE(8,2);
ALTER TABLE travel_routes ADD summary VARCHAR(50);



