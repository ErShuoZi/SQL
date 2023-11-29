-- 1.多对多
-- 学生表
CREATE TABLE IF NOT EXISTS `students`(
 `id` int  PRIMARY KEY AUTO_INCREMENT,
`name` VARCHAR(20) NOT NULL,
	`age` int
);


-- 课程表

CREATE TABLE IF NOT EXISTS `courses`(
 `id` int  PRIMARY KEY AUTO_INCREMENT,
`name` VARCHAR(20) NOT NULL,
	`price` DOUBLE NOT NULL
);

-- 学生选择课程关系表
CREATE TABLE IF NOT EXISTS `students_select_courses`(
 `id` int  PRIMARY KEY AUTO_INCREMENT,
`student_id` INT NOT NULL,
	`courses_id` INT NOT NULL,
	FOREIGN KEY(student_id) REFERENCES students(id) ON UPDATE CASCADE  ON DELETE CASCADE,
	FOREIGN KEY(courses_id) REFERENCES courses(id) ON UPDATE CASCADE  ON DELETE CASCADE
);


INSERT INTO `students`(name,age) VALUES("张三",18);
INSERT INTO `students`(name,age) VALUES("李四",20);
INSERT INTO `students`(name,age) VALUES("王五",23);
INSERT INTO `students`(name,age) VALUES("赵六",27);


INSERT INTO `courses`(name,price) VALUES("英语",100);
INSERT INTO `courses`(name,price) VALUES("语文",90);
INSERT INTO `courses`(name,price) VALUES("数学",666);
INSERT INTO `courses`(name,price) VALUES("历史",999);
INSERT INTO `courses`(name,price) VALUES("物理",100);



-- 选课过程
-- 张三选择
INSERT INTO `students_select_courses` (student_id,courses_id) VALUES(1,1);
INSERT INTO `students_select_courses` (student_id,courses_id) VALUES(1,3);
-- 王五选择
INSERT INTO `students_select_courses` (student_id,courses_id) VALUES(3,2);
INSERT INTO `students_select_courses` (student_id,courses_id) VALUES(3,3);
INSERT INTO `students_select_courses` (student_id,courses_id) VALUES(3,4);



-- 查询所有的有选课的学生选择的所有课程
SELECT	
	*
FROM `students`
INNER JOIN	`students_select_courses` ON students.id = students_select_courses.student_id
INNER JOIN `courses` ON students_select_courses.courses_id = courses.id;

-- 查询所有的学生选择的所有课程
SELECT	
	*
FROM `students`
LEFT JOIN	`students_select_courses` ON students.id = students_select_courses.student_id
LEFT JOIN `courses` ON students_select_courses.courses_id = courses.id;

-- 查询张三学生选择的所有课程
SELECT	
	*
FROM `students`
LEFT JOIN	`students_select_courses` ON students.id = students_select_courses.student_id
LEFT JOIN `courses` ON students_select_courses.courses_id = courses.id  WHERE students.id = 1;	

-- 查询李四学生的选课情况
SELECT	
	*
FROM `students`
LEFT JOIN	`students_select_courses` ON students.id = students_select_courses.student_id
LEFT JOIN `courses` ON students_select_courses.courses_id = courses.id  WHERE students.id = 2;

-- 查询哪些学生没有选择课程
SELECT	
	*
FROM `students`
LEFT JOIN	`students_select_courses` ON students.id = students_select_courses.student_id
LEFT JOIN `courses` ON students_select_courses.courses_id = courses.id  WHERE courses.id IS NULL;

-- 查询哪些课程没有被选择
SELECT	
	*
FROM `students`
RIGHT JOIN	`students_select_courses` ON students.id = students_select_courses.student_id
RIGHT JOIN `courses` ON students_select_courses.courses_id = courses.id  WHERE students.id IS NULL;







