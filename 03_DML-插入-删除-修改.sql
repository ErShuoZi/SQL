CREATE TABLE IF NOT EXISTS `products` (
 `id` INT PRIMARY KEY  AUTO_INCREMENT,
 `title` VARCHAR(20),
 `description` VARCHAR(200),
  `price` DOUBLE,
	`publishTime` DATETIME
);


ALTER TABLE `products` RENAME TO `t_productions`;


-- 1.插入数据
INSERT INTO `t_productions`(`title`,`description`,`price`,`publishTime`) VALUES("iPhone","iPhone12 只要998",998,"2023.11.28");
INSERT INTO `t_productions`(`title`,`description`,`price`,`publishTime`) VALUES("华为","华为 只要888",888,"2023.11.28");


-- 2.删除表中所有数据
DELETE  FROM `t_productions`;

-- 2.1 删除某条数据
DELETE  FROM `t_productions` WHERE `id` = 1;

-- 3.修改数据
UPDATE `t_productions` SET `price` =  9999 WHERE id = 2;
UPDATE `t_productions` SET `price` =  9999,`title` = "华为手机只要9999" WHERE id = 2; 
ALTER TABLE `t_productions`ADD `updateTime` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP;