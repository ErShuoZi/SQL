
-- 准备表
CREATE TABLE IF NOT EXISTS `products`(
`id` INT PRIMARY KEY AUTO_INCREMENT,
`brand` VARCHAR(20),
`title` VARCHAR(100) NOT NULL,
`price` DOUBLE NOT NULL,
`score` DECIMAL(2,1),
voteCnt INT,
url VARCHAR(100),
pid INT
);


-- 1.基本查询,查询所有数据的所有字段
SELECT * FROM `products`;

-- 2.查询指定字段之后,起别名  AS关键字可省略
SELECT `id` as `phoneId`,`brand` as `phoneBrand`,`title` as `phoneTitle`,`price` as `phonePrice` FROM `products`;


-- 3.查询条件 比较运算符
-- 查询所有价格小于1000的手机
SELECT * FROM `products` WHERE `price` < 1000;

-- 查询所有价格大于等于3000的手机
SELECT * FROM `products` WHERE `price` >= 3000;

-- 查询所有价格等于8699的手机
SELECT * FROM `products` WHERE `price` = 8699;


-- 4.查询条件 逻辑运算符
-- 查询所有价格小于2000,品牌是华为的手机 
SELECT * FROM `products` WHERE `price` < 2000 && `brand` = "华为" ; 

-- 查询所有价格小于5000,品牌是华为的手机 
SELECT * FROM `products` WHERE `price` > 5000 || `brand` = "华为" ;  
SELECT * FROM `products` WHERE `price` > 5000 OR `brand` = "华为" ;  

-- 5.查询条件 查询范围
-- 1000 ~ 2000
SELECT * FROM `products` WHERE `price` <= 2000 && `price` >= 1000  ;  
SELECT * FROM `products` WHERE `price` BETWEEN 1000 AND 2000 ;


-- 6.枚举出多个结果,其中之一
SELECT * FROM `products` WHERE `brand` = "小米" OR `brand` = "华为";
SELECT * FROM `products` WHERE `brand` IN("小米","华为");


-- 6.查询条件  模糊查询(like)
-- 6.1查询所有title以v开头的
SELECT * FROM `products` WHERE `title` LIKE "v%";
-- 6.2查询所有title以v开头的
SELECT * FROM `products` WHERE `title` LIKE "%v%";

-- 6.3查询所有title 带 m 并且m是第三个字符
 SELECT * FROM `products` WHERE `title` LIKE "__M%";
 
--  7.结果进行排序 (ORDER BY)
-- 7.1 查询所有小于价格小于1000的手机并且按照评分降序排序
SELECT * FROM `products` WHERE  `price` < 1000 ORDER BY `score` DESC;
-- 7.2 查询所有小于价格小于1000的手机并且按照评分升序排序
SELECT * FROM `products` WHERE  `price` < 1000 ORDER BY `score` ASC;



-- 8.分页查询 
--  8.1默认不偏移
SELECT * FROM `products` LIMIT 20;

--  8.2 偏移20
SELECT * FROM `products` LIMIT 20 OFFSET 40;

--  8.3 另外一种写法 (40 表示 offset)
SELECT * FROM `products` LIMIT 40,20;