SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";

DROP TABLE IF EXISTS `users`;
/*
CREATE TABLE IF NOT EXISTS `users` (
  `username` char(10) NOT NULL PRIMARY KEY,
  `passwd` char(20) NOT NULL,
  `grade` char(2)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

INSERT INTO `users` (username,passwd,grade) VALUES
('admin','1',1),
('121610203','1',5),
('131020133','1',5),
('110940125','1',5),
('140730422','1',5),
('110650109','1',5),
('161540104','1',5);
*/
DROP TABLE IF EXISTS `info`;
CREATE TABLE IF NOT EXISTS `info` (
  `username` char(10) NOT NULL PRIMARY KEY,
  `passwd` char(20) NOT NULL,
  `nickname` char(20) NOT NULL,
  `cno` char(8),
  `sex` char(2),
  `age` char(3),
  `dept` char(20),
  `grade` char(2)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*air:航空学院 energy：能源 auto：自动化 electron：电子 machine：机械 material：材料 civil_aviation:民航 math：理学院 economy：经济 
humanity：人文 foreign：外国语 computer：计算机*/
INSERT INTO `info` VALUES
('admin','1','admin','','','40','academic','1'),
('121610203','1','李勇','1216102','男','24','computer','5'),
('131020133','1','刘晨','1310201','女','23','humanity','5'),
('110940125','1','王敏','1109401','女','25','economy','5'),
('140730422','1','张立','1407304','男','22','civil_aviation','5'),
('110650109','1','张兰心','1106501','女','25','material','5'),
('161540104','1','吴雨亭','1615401','女','21','computer','5'),
('161540105','1','霍晓湘','1615403','女','21','computer','5'),
('161540201','1','王亚欣','1615402','女','21','computer','5'),
('161540106','1','欧莉盼','1615403','女','21','computer','5');

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
    FOREIGN KEY(username) REFERENCES users(username) ON DELETE CASCADE,
    FOREIGN KEY(lessonNo) REFERENCES lesson(lessonNo) ON DELETE CASCADE
)ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

INSERT INTO `SC` VALUES
('121610203','10501100',92),
('121610203','03303540',85),
('121610203','16102700',94),
('121610203','99900070',88),
('121610203','16102570',76),
('121610203','04203370',91),
('121610203','10501150',68),
('121610203','16102510',82),
('121610203','011J0010',77),
('121610203','82101030',81),
('121610203','16403170',70),
('131020133','10501100',90),
('131020133','82201010',80),
('110940125','82201010',87),
('110940125','16101290',50),
('110940125','16403170',83),
('140730422','01104980',66),
('140730422','03303540',97),
('140730422','99900070',56),
('110650109','16403170',77),
('110650109','16102700',75),
('110650109','01104980',65),
('110650109','16101290',68);

DROP TABLE IF EXISTS `droped_course`;
CREATE TABLE IF NOT EXISTS `droped_course`(
    `username` char(10),
    `lessonNo` char(10),
    PRIMARY KEY (username,lessonNo),
    FOREIGN KEY(username) REFERENCES users(username),
    FOREIGN KEY(lessonNo) REFERENCES lesson(lessonNo)
)ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;