-- 1.计算华为手机平均价格
SELECT  AVG(`price`) FROM `products` WHERE `brand` = "华为";

-- 2.计算华为手机平均评分
SELECT  AVG(`score`) FROM `products` WHERE `brand` = "小米";

-- 3.选择手机中评分最高的手机
SELECT MAX(score) FROM `products`;
-- 4.选择手机中评分最低的手机
SELECT  MIN(`score`) FROM `products` ;

 
-- 5.计算所有投票数 (sum)
SELECT SUM(voteCnt) FROM `products`;

-- 6.计算所有商品数量
SELECT COUNT(*) FROM `products`; 


-- 7.计算所有华为商品数量
SELECT COUNT(*) FROM `products` WHERE `brand` = "华为";  


-- 8.GROUP BY :数据根据品牌进行分组
-- GROUP BY约束条件 HAVING
 
SELECT `brand`,MIN(`price`),ROUND(AVG(`score`),2) AS avgScore,ROUND(AVG(`price`),2) AS avgPrice FROM `products` GROUP BY `brand` HAVING  avgScore > 7 AND avgPrice < 4000 ;  

