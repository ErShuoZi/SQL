-- 1.直接从两张表中查询数据
-- 笛卡尔乘积 /直积
SELECT * FROM `products`,`brand`;

-- 过滤
SELECT * FROM `products`,`brand` WHERE products.brand_id = brand.id;


-- 表连接 左连接 LEFT [OUTER] JOIN 
SELECT * FROM `products` LEFT JOIN `brand` ON products.brand_id = brand.id;
-- 查询左表数据中哪些是和右表没有交集的
SELECT * FROM `products` LEFT JOIN `brand` ON products.brand_id = brand.id WHERE  products.brand_id IS NULL; 
-- 有交集的
SELECT * FROM `products` LEFT JOIN `brand` ON products.brand_id = brand.id WHERE  products.brand_id IS NOT NULL; 


-- 表连接 右连接 RIGHT [OUTER] JOIN 
SELECT * FROM `products` RIGHT JOIN  `brand` ON products.brand_id = brand.id;
-- 查询右表数据中哪些是和左表没有交集的
SELECT * FROM `products` RIGHT JOIN `brand` ON products.brand_id = brand.id WHERE  products.brand_id IS NULL; 
-- 有交集的
SELECT * FROM `products` RIGHT JOIN `brand` ON products.brand_id = brand.id WHERE  products.brand_id IS NOT NULL; 


-- 表连接 内连接 [CROSS] JOIN / JOIN  / [INNER] JOIN  
SELECT * FROM `products` CROSS JOIN `brand` ON products.brand_id = brand.id;

-- -- 表连接 全连接 FULL JOIN  但是mysql中不支持,需要使用 UNION实现
(SELECT * FROM `products` LEFT JOIN `brand` ON products.brand_id = brand.id)
UNION
(SELECT * FROM `products` RIGHT  JOIN `brand` ON products.brand_id = brand.id)

