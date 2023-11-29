-- 	1.查看所有数据库
	SHOW DATABASES;
	
-- 	2.使用某一个数据库
	USE ershuozi_db;
	
-- 	3.查看目前哪一个数据是选中(正在使用的数据)
	SELECT DATABASE();
	
-- 	3.创建一个新的数据库
CREATE DATABASE test_demo;
	
-- 	4.删除某一个数据库
DROP DATABASE IF EXISTS test_demo ;

-- 5.修改数据库
-- ALTER DATABASE xxxxxx CHARACTER SET = utf8 COLLATE = utf8_unicode_ci;


-- 6.查看表
SHOW TABLES;
-- 7.查看某一张表结构
DESC t_singer;


-- 8.创建一张新的表
CREATE TABLE IF NOT EXISTS `users`(
name VARCHAR(10),
age INT,
height DOUBLE
);


-- 删除表
DROP TABLE `users`;



-- 09.创建完整表结构
CREATE TABLE IF NOT EXISTS `users`(
	id INT PRIMARY KEY AUTO_INCREMENT,
	name VARCHAR(20) UNIQUE NOT NULL,
	level int DEFAULT(0),
	telphone VARCHAR(20) UNIQUE
);

	
	
	