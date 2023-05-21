drop database if exists pmp;
create database pmp;
use pmp;

CREATE TABLE `todayeat` (
  id INT(11) NOT NULL AUTO_INCREMENT,
  shopname CHAR(200) NOT NULL,
  menuname CHAR(100) NOT NULL,
  location CHAR(100) NOT NULL,
  `usergender` char(10) NOT null,
  `date` DATE NOT NULL,
  `userage` int(10) NOT NULL,
   PRIMARY KEY (id)
  );
INSERT INTO todayeat (shopname, menuname, location, usergender, date, userage)
VALUES 
( '김가네', '제육볶음', '월평동','man', CURDATE(),33 ),
( '롯데리아', '햄버거', '월평동','woman', CURDATE(),22 ),
( '김가네', '제육볶음', '월평동','man', CURDATE(),15 ),
( '선사삼계탕', '삼계탕', '월평동','woman', CURDATE(),22 ),
( '선사삼계탕', '삼계탕', '월평동','man', CURDATE(),25 ),
( '선사삼계탕', '삼계탕', '월평동','woman', CURDATE(),44 ),
( '5.5닭갈비', '닭갈비', '월평동','man', CURDATE(),55 ),
( '진달래반점', '짜장면', '월평동','man', CURDATE(),67 ),
( '진달래반점', '짬뽕', '월평동','man', CURDATE(),23 ),
( 'bbq', '치킨', '월평동','man', CURDATE(),33 ),
( '롯데리아', '햄버거', '월평동','woman', CURDATE(),48 ),
( '김가네', '제육볶음', '월평동','man', CURDATE(),23 ),
( '선사삼계탕', '삼계탕', '월평동','woman', CURDATE(),14 );


CREATE TABLE `member` (
  id INT(11) NOT NULL AUTO_INCREMENT,
  userid CHAR(100) NOT NULL,
  userpw CHAR(150) NOT NULL,
  username CHAR(100) NOT NULL,
  location CHAR(100) NOT NULL,
  userage INT(20) NOT NULL,
  usergender CHAR(10) NOT NULL,
  useremail char(100) NOT null,
  PRIMARY KEY (id)
);
INSERT INTO member ( userid, userpw, username, location, userage, usergender, useremail )
VALUES 
('test1', 'test1', '홍길동', 'test1', 25 , 'man', 'hongkil04@gmail.com'),
('test2', 'test2', '임꺽정', 'test2', 35 , 'man', 'lgj992@hanmail.net'),
('test3', 'test3', '심사임', 'test3', 45 , 'woman', 'llmom44@lycos.com');


CREATE TABLE `location` (
  id INT(11) NOT NULL AUTO_INCREMENT,
  locationname CHAR(100) NOT NULL,
  PRIMARY KEY (id)
);
INSERT INTO location (locationname)
VALUES ('월평동'), ('둔산동'), ('노은동');

CREATE TABLE `usergender` (
  id INT(11) NOT NULL AUTO_INCREMENT,
  usergender CHAR(100) NOT NULL,
  PRIMARY KEY (id)
);
INSERT INTO `usergender` (usergender)
VALUES ('man'), ('woman');

CREATE TABLE menu (
  id INT(11) NOT NULL AUTO_INCREMENT,
  menuname CHAR(100) NOT NULL,
  PRIMARY KEY (id),
  UNIQUE KEY (menuname)
);
INSERT INTO menu (menuname)
VALUES ('닭갈비'), ('칼국수'), ('제육볶음'),('삼계탕'),('햄버거'),('짜장면'),('치킨');

CREATE TABLE shop (
  id INT(11) NOT NULL AUTO_INCREMENT,
  shopname CHAR(100) NOT NULL,
  locationid INT(11) NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (locationid) REFERENCES location(id)
);
INSERT INTO shop ( shopname, locationid)
VALUES ( '김가네', 1 ), ('5.5닭갈비',1), ('동원칼국수',1),('선사삼계탕',1),('롯데리아',1),('bbq',1),('진달래반점',1);

select * from usergender;
SELECT * from member;
SELECT * from shop;
SELECT * from menu;
SELECT * from todayeat;
select * from location;

SELECT menuname, COUNT(*) FROM todayeat, usergender
where usergender.usergender=todayeat.usergender and todayeat.usergender='man'
GROUP BY menuname
ORDER BY COUNT(*) DESC LIMIT 5;

SELECT menuname, COUNT(*) FROM todayeat
GROUP BY menuname
ORDER BY COUNT(*) DESC LIMIT 5;

SELECT * FROM todayeat
GROUP BY menuname
ORDER BY COUNT(*) DESC LIMIT 5;

select * from member where usergender='man';