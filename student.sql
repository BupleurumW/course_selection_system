SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `username` char(10) NOT NULL PRIMARY KEY,
  `passwd` char(20) NOT NULL,
  `grade` char(1)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

INSERT INTO `users` (username,passwd,grade) VALUES
('admin','1',1),
('121','1',5),
('122','1',5),
('123','1',5),
('125','1',5),
('126','1',5);

DROP TABLE IF EXISTS `info`;
CREATE TABLE IF NOT EXISTS `info` (
  `username` char(10) NOT NULL PRIMARY KEY,
  `nickname` char(20) NOT NULL,
  `sno` char(10),
  `cno` char(8),
  `sex` char(2) NOT NULL,
  `age` smallint NOT NULL,
  `dept` char(20) NOT NULL,
  `in_year` date,
  `birth` date
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

INSERT INTO `info` VALUES
('admin','admin','','','',40,'教务处','1970-01-01','1970-01-01'),
('121','李勇','121610203','1216102','男',20,'计算机学院','2012-09-01','1994-6-9'),
('122','刘晨','131020133','1310201','女',19,'人文学院','2013-09-01','1995-3-1'),
('123','王敏','110940125','1109401','女',21,'经济管理学院','2011-09-01','1993-12-28'),
('125','张立','140730422','1407304','男',18,'飞行学院','2014-09-01','1996-4-17'),
('126','张兰心','110650109','1106501','女',22,'材料学院','2011-9-01','1993-8-14');

DROP TABLE IF EXISTS `lesson`;
CREATE TABLE IF NOT EXISTS `lesson` (
  `lessonNo` char(10) NOT NULL PRIMARY KEY,
  `lessonName` char(30) NOT NULL,
  `credit` float NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

INSERT INTO lesson VALUES('08101550','高等数学I（1）',7.0);
INSERT INTO lesson VALUES('10500010','形势政策教育',2.0);
INSERT INTO lesson VALUES('10501100','思想道德修养与法律基础',3.0);
INSERT INTO lesson VALUES('82101030','安全教育',0.5);
INSERT INTO lesson VALUES('82101040','军事理论',2.0);
INSERT INTO lesson VALUES('83100020','大学生心理健康教育',1.0);
INSERT INTO lesson VALUES('08101240','线性代数',2.5);
INSERT INTO lesson VALUES('08101560','高等数学I（2）',5.5);
INSERT INTO lesson VALUES('08201460','大学物理Ⅲ',4.0);
INSERT INTO lesson VALUES('10501150','中国近现代史纲要',2.0);
INSERT INTO lesson VALUES('08102070','概率论与数理统计Ⅱ',3.0);
INSERT INTO lesson VALUES('10502060','毛泽东思想和中国特色社会主义理论体系概论',6.0);
INSERT INTO lesson VALUES('10502070','马克思主义基本原理概论',3.0);
INSERT INTO lesson VALUES('011J0010','航空航天概论',1.5);
INSERT INTO lesson VALUES('821J0050','军事高技术概论',1.5);
INSERT INTO lesson VALUES('821J0040','国防科技工业概论',1.5);
INSERT INTO lesson VALUES('16102700','程序设计(1)',2.5);
INSERT INTO lesson VALUES('04102220','数字电路与逻辑设计Ⅱ',3.0);
INSERT INTO lesson VALUES('16102080','数据结构',3.5);
INSERT INTO lesson VALUES('16102870','离散数学Ⅱ',3.5);
INSERT INTO lesson VALUES('04203500','物联网组网与通信技术',2.5);
INSERT INTO lesson VALUES('03103600','物联网控制技术',3.0);
INSERT INTO lesson VALUES('16403170','泛在网技术',2.5);
INSERT INTO lesson VALUES('16103280','操作系统',3.5);
INSERT INTO lesson VALUES('16401010','物联网导论',2.0);
INSERT INTO lesson VALUES('16102710','程序设计(2)',2.0);
INSERT INTO lesson VALUES('03303580','物联网传感技术',3.0);
INSERT INTO lesson VALUES('16102280','算法设计与分析',2.5);
INSERT INTO lesson VALUES('16103660','微机原理与接口技术II',3.5);
INSERT INTO lesson VALUES('16103520','数据库原理',3.0);
INSERT INTO lesson VALUES('16403210','数据融合与智能分析',2.0);
INSERT INTO lesson VALUES('16403250','嵌入式系统原理及应用',2.0);
INSERT INTO lesson VALUES('16102230','计算机组成原理',3.5);
INSERT INTO lesson VALUES('16102190','编译原理Ⅱ',2.5);
INSERT INTO lesson VALUES('16103180','模式识别',2.0);
INSERT INTO lesson VALUES('16103460','计算机系统结构',3.0);
INSERT INTO lesson VALUES('03303050','光电检测技术Ⅱ',3.0);
INSERT INTO lesson VALUES('03303540','测试信号分析与处理',3.0);
INSERT INTO lesson VALUES('04102720','移动通信',2.0);
INSERT INTO lesson VALUES('03103270','全球导航卫星系统',3.0);
INSERT INTO lesson VALUES('04203100','FPGA及其应用',2.0);
INSERT INTO lesson VALUES('03104200','嵌入式测控系统',3.0);
INSERT INTO lesson VALUES('16104420','无线传感器网络',2.0);
INSERT INTO lesson VALUES('16404090','云计算原理',2.5);
INSERT INTO lesson VALUES('16102810','人机界面',1.0);
INSERT INTO lesson VALUES('16104570','数字图像处理',2.0);
INSERT INTO lesson VALUES('16403080','物联网安全技术',2.5);
INSERT INTO lesson VALUES('16403200','情境感知',2.0);
INSERT INTO lesson VALUES('16104620','机器学习及应用',2.0);
INSERT INTO lesson VALUES('16403180','多元统计分析',2.0);
INSERT INTO lesson VALUES('16403190','普适计算',2.0);
INSERT INTO lesson VALUES('16101290','程序设计语言实验（1）',0.5);
INSERT INTO lesson VALUES('16401020','物联网基础技术及实验',1.5);
INSERT INTO lesson VALUES('82201010','军事训练',2.0);
INSERT INTO lesson VALUES('08301040','大学物理实验Ⅲ',1.0);
INSERT INTO lesson VALUES('16004000','社会实践',2.0);
INSERT INTO lesson VALUES('16101140','程序设计课程设计',1.0);
INSERT INTO lesson VALUES('16101300','程序设计语言实验（2）',0.5);
INSERT INTO lesson VALUES('16102090','数据结构课程设计',1.0);
INSERT INTO lesson VALUES('16102600','数据结构实验',1.0);
INSERT INTO lesson VALUES('92100270','数字电路课程设计',1.0);
INSERT INTO lesson VALUES('92100540','数字电路与逻辑设计实验Ⅱ',0.5);
INSERT INTO lesson VALUES('91100030','工程训练Ⅲ',2.0);
INSERT INTO lesson VALUES('16002010','专业英语阅读与写作',0.5);
INSERT INTO lesson VALUES('16102620','微机原理与接口技术实验',0.5);
INSERT INTO lesson VALUES('16403120','泛在网技术实验',0.5);
INSERT INTO lesson VALUES('16103700','操作系统实践',2.5);
INSERT INTO lesson VALUES('16403130','数据融合与智能分析实验',0.5);
INSERT INTO lesson VALUES('16003030','下厂实习',3.0);
INSERT INTO lesson VALUES('16404030','物联网工程综合课程设计',2.0);
INSERT INTO lesson VALUES('01104980','毕业设计',12.0);
INSERT INTO lesson VALUES('83200020','大学生职业生涯发展与规划',1.0);
INSERT INTO lesson VALUES('09102460','创业基础',2.0);
INSERT INTO lesson VALUES('16102250','计算机组成原理课程设计',1.0);
INSERT INTO lesson VALUES('16102510','计算机组成原理实验',0.5);
INSERT INTO lesson VALUES('16403140','无线传感器网络实验',0.5);
INSERT INTO lesson VALUES('04203370','FPGA及其应用实验',0.5);
INSERT INTO lesson VALUES('16102560','嵌入式系统原理与应用实验',0.5);
INSERT INTO lesson VALUES('16102570','人机界面实验',1.0);
INSERT INTO lesson VALUES('99900070','科技学术讲座',1.0);

DROP TABLE IF EXISTS `SC`;
CREATE TABLE IF NOT EXISTS `SC`(
    `username` char(10),
    `lessonNo` char(10),
    `Grade` smallint,
    PRIMARY KEY (username,lessonNo),
    FOREIGN KEY(username) REFERENCES users(username),
    FOREIGN KEY(lessonNo) REFERENCES lesson(lessonNo)
)ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

INSERT INTO `SC` VALUES
('121','10501100',92),
('121','03303540',85),
('121','16102700',94),
('121','99900070',88),
('121','16102570',76),
('121','04203370',91),
('121','10501150',68),
('121','16102510',82),
('121','011J0010',77),
('121','82101030',81),
('121','16403170',70),
('122','10501100',90),
('122','82201010',80),
('123','82201010',87),
('123','16101290',50),
('124','16403170',83),
('125','01104980',66),
('125','03303540',97),
('125','99900070',56),
('126','16403170',77),
('126','16102700',75),
('126','01104980',65),
('126','16101290',68);

DROP TABLE IF EXISTS `droped_course`;
CREATE TABLE IF NOT EXISTS `droped_course`(
    `username` char(10),
    `lessonNo` char(10),
    PRIMARY KEY (username,lessonNo),
    FOREIGN KEY(username) REFERENCES users(username),
    FOREIGN KEY(lessonNo) REFERENCES lesson(lessonNo)
)ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;