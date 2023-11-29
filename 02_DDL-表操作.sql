-- 1.修改表名
ALTER TABLE `users` RENAME TO `t_users`; 

-- 2.给表添加新的字段
ALTER TABLE `t_users` ADD `createTime` TIMESTAMP;
ALTER TABLE `t_users` ADD `updateTime` TIMESTAMP;
-- 3.修改字段的的名字
ALTER TABLE `t_users` CHANGE `createTime`  `createAt` DATETIME;


-- 4.删除某个字段
ALTER TABLE `t_users` DROP `createAt`;


-- 5.修改某个字段类型  INT -> BIGINT
ALTER TABLE `t_users` MODIFY id BIGINT;