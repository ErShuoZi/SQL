-- 1.创建歌曲表
CREATE TABLE IF NOT EXISTS `t_singet_singe`(
 `id` int  PRIMARY KEY AUTO_INCREMENT,
`name` VARCHAR(20) NOT NULL,
`duration` int DEFAULT 0,
`singer` VARCHAR(10) NOT NULL
);


ALTER TABLE `t_singet_singe` RENAME `t_songs`; 

INSERT INTO `t_songs`(name,duration,singer) VALUES("温柔",100,"五月天");
INSERT INTO `t_songs`(name,duration,singer) VALUES("离开地球表面",120,"五月天");
INSERT INTO `t_songs`(name,duration,singer) VALUES("倔强",130,"五月天");
	


-- 歌手表
CREATE TABLE IF NOT EXISTS `t_singer`(
 `id` int  PRIMARY KEY AUTO_INCREMENT,
`name` VARCHAR(20) NOT NULL,
`intro` VARCHAR(200)
);

INSERT INTO `t_singer`(name,intro) VALUES("五月天","五月天的介绍");

-- 修改歌曲表
-- ALTER TABLE `t_songs` CHANGE COLUMN `singer` `singer_id` INT; 
ALTER TABLE `t_songs` DROP `singer`;
ALTER TABLE `t_songs` ADD `singer_id` INT;




-- 为品牌单独建表
CREATE TABLE IF NOT EXISTS `brand`(
 `id` int  PRIMARY KEY AUTO_INCREMENT,
`name` VARCHAR(20) NOT NULL UNIQUE,
`website` VARCHAR(100),
`worldRank` INT
);


INSERT INTO `brand`(name,website,worldRank) VALUES("华为",".www.huawei.com",1);
INSERT INTO `brand`(name,website,worldRank) VALUES("小米",".www.xiaomi.com",10);
INSERT INTO `brand`(name,website,worldRank) VALUES("苹果",".www.apple.com",5);
INSERT INTO `brand`(name,website,worldRank) VALUES("oppo",".www.oppo.com",15);
INSERT INTO `brand`(name,website,worldRank) VALUES("京东",".www.jingdong.com",3);
INSERT INTO `brand`(name,website,worldRank) VALUES("Google",".www.Google.com",8);



-- 外键关联
-- 创建外键
 ALTER TABLE `products` ADD `brand_id` INT;
 ALTER TABLE `products` ADD FOREIGN KEY(`brand_id`) REFERENCES `brand`(id);
 
 UPDATE  `products` SET `brand_id` = 1 WHERE `brand` = "华为";
 UPDATE  `products` SET `brand_id` = 4 WHERE `brand` = "OPPO";
 UPDATE  `products` SET `brand_id` = 3 WHERE `brand` = "苹果";
 UPDATE  `products` SET `brand_id` = 2 WHERE `brand` = "小米";
 
 
 
--  在有外键约束的情况下修改brand中的id
-- UPDATE `brand` SET id = 99 WHERE id = 1;  会报错

-- 如果需要修改外键,可以给外键设置 
-- 1.RESTRICT 默认属性,不允许更新或修改
-- 2.NO ACTION 和RESTRICT是一致的
-- 3.CASCADE 当更新或者删除某个记录时,会检查是否有关联外键记录,有的话一起更新或删除
-- 4.SET NULL当更新或者删除某个记录时,会检查是否有关联外键记录,有的话一起将对应值设置为null


-- 查看外键
SHOW CREATE TABLE `products`;
-- CREATE TABLE `products` (
--   `id` int NOT NULL AUTO_INCREMENT,
--   `brand` varchar(20) DEFAULT NULL,
--   `title` varchar(100) NOT NULL,
--   `price` double NOT NULL,
--   `score` decimal(2,1) DEFAULT NULL,
--   `voteCnt` int DEFAULT NULL,
--   `url` varchar(100) DEFAULT NULL,
--   `pid` int DEFAULT NULL,
--   `brand_id` int DEFAULT NULL,
--   PRIMARY KEY (`id`),
--   KEY `brand_id` (`brand_id`),
--   CONSTRAINT `products_ibfk_1` FOREIGN KEY (`brand_id`) REFERENCES `brand` (`id`)
-- ) ENGINE=InnoDB AUTO_INCREMENT=109 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci



-- 删除外键
ALTER TABLE `products` DROP FOREIGN KEY `products_ibfk_3`;
ALTER TABLE `products` ADD FOREIGN KEY(`brand_id`) REFERENCES `brand`(id) ON UPDATE CASCADE ON DELETE CASCADE;


