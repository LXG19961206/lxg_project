SET NAMES UTF8;
DROP DATABASE IF EXISTS lxg;
CREATE DATABASE lxg CHARSET=UTF8;
USE lxg;
CREATE TABLE user
(
uid INT PRIMARY KEY AUTO_INCREMENT,
uname VARCHAR(32),
upwd VARCHAR(16),
gender BOOL,
email VARCHAR(32),
phone BIGINT,
checks TINYINT
);
INSERT INTO user VALUES
('1','tom','123456','1','2474840203@qq.com',13171827320,'1'),
('2','lily','123456','0','1309413379@qq.com',13172827720,'2'),
('3','ceb','654321','1','1013028525@qq.com',13472827720,'3'),
('4','topson','123456','1','1145374863@qq.com',13672727720,'3'),
('5','jrax','654321','1','1013028525@163.com',13175557720,'1');

CREATE TABLE product_1(
pid INT PRIMARY KEY AUTO_INCREMENT,
pname VARCHAR(64),
price VARCHAR(8),
pdetail VARCHAR(64),
pimg VARCHAR(256),
href VARCHAR(64)
);

CREATE TABLE product_2(
pid INT PRIMARY KEY AUTO_INCREMENT,
pname VARCHAR(64),
price VARCHAR(8),
pdetail VARCHAR(64)
);

CREATE TABLE product_3(
pid INT PRIMARY KEY AUTO_INCREMENT,
pname VARCHAR(64),
price VARCHAR(8),
pdetail VARCHAR(64)
);

CREATE TABLE product_4(
pid INT PRIMARY KEY AUTO_INCREMENT,
pname VARCHAR(64),
price VARCHAR(8),
pdetail VARCHAR(64)
);


CREATE TABLE product_5(
pid INT PRIMARY KEY AUTO_INCREMENT,
pname VARCHAR(64),
price VARCHAR(8),
pdetail VARCHAR(64)
);

CREATE TABLE product_6(
pid INT PRIMARY KEY AUTO_INCREMENT,
pname VARCHAR(64),
price VARCHAR(8),
pdetail VARCHAR(64)
);



INSERT INTO product_1 VALUES
('1','FIIL T1 X 真无线运动耳机','399','闪连 快充 秒同步','/\fiil商城_files/\20190624151830_594.png','T1 X.html'),
('2','FIIL T1 真无线运动耳机(魔影红)','399','开盒闪联 蓝牙5.0 24小时续航','/\fiil商城_files/\20190624151308_109.jpg','T1_red.html'),
('3','FIIL T1 真无线运动耳机(曜石黑)','399','开盒闪联 蓝牙5.0 24小时续航','/\fiil商城_files/\20190624151830_594.png','T1_black.html'),
('4','FIIL随身星 DNC','499','DNC数字降噪降噪提升到2倍/智能调噪应对通勤场景/10小时长续航','/\fiil商城_files/\20190116145227_346.jpg','DNC.html'),
('5','FIIL随身星 Pro','1199','语音智能秘书 楼氏动铁单元 ANC主动降噪','/\fiil商城_files/\20190116145227_346.jpg','随身星pro.html'),
('6','FIIL 随身星NC','699','随身打Call神器','/\fiil商城_files/\20190619163612_321.png','随身星NC.html'),
('7','FIIL 随身星 (魔影红)','499','随身星入耳式蓝牙耳机 智能降噪线控带麦 磁吸设计','/\fiil商城_files/\20190619163758_864.png','随身星.html'),
('8','FIIL Carat M','999','内置HIFI播放器 楼氏动铁 9小时续航','/\fiil商城_files/\20190116141414_101.png','Carat M.html'),
('9','FIIL Carat(霓虹绿)','499','FIIL Carat 智能运动耳机 SDS智能律动音效 智能计步 IP65防水 磁吸项链模式','/\fiil商城_files/\20190116141450_11.png','Carat M_green.html'),
('10','FIIL Carat Lite(曜石黑)','299','六角星项链耳机','/\fiil商城_files/\20190116141547_58.png','Carat Lite_black.html'),
('11','FIIL Carat Lite(太空灰)','299','六角星项链耳机','/\fiil商城_files/\20190116141638_901.png','Carat Lite_grey.html'),
('12','FIIL Diva2 Pro','1899','智能无线耳机','/\fiil商城_files/\20190116142607_571.png','Diva2 Pro.html'),
('13','FIIL Diva2','1199','头戴式无线耳机 智能降噪 智能启停 智能语音搜歌 滑动触控','/\fiil商城_files/\20190116142031_787.png','Diva2.html'),
('14','FIIL Diva Pro','1499','FIIL Diva pro 全场景智能无线耳机头戴压耳式 线控带麦','/\fiil商城_files/\20190116142142_401.png','Diva Pro.html'),
('15',' FIIL Diva','999','FIIL Diva 懂你的智能无线耳机头戴压耳式 带麦','/\fiil商城_files/\20190116142239_645.png','Diva.html'),
('16','FIIL Wireless','1599','头戴式蓝牙无线音乐耳机 100米蓝牙连接 CD级无损音质 IF设计奖 监听级降噪','/\fiil商城_files/\20190116142445_565.png','Wireless.html'),
('17','FIIL VOX','899','FIIL VOX 头戴式无线音乐耳机 影院级3D音效 智能语音交互 滑动触控','/\fiil商城_files/\20190116142518_543.png','VOX.html'),
('18','FIIL','1099','FIIL头戴式耳机 IF设计奖 监听级降噪 带呼吸灯 线控带麦 高解析度','/\fiil商城_files/\20190116142607_571.png','fili.html'),
('19','FIIL Bestie','599','Bestie 入耳式耳机 双兼容 动圈+动铁 线控带麦 IF设计奖 高颜值 面条线防缠绕','/\fiil商城_files/\20190116142142_401.png','Bestie.html'),
('20','Android-音频镀银线','128','FIIL 头戴式耳机通用音频镀银线 线控带麦 镀银无氧铜 还原好音质','/\fiil商城_files/\20190116142818_553.png','datastring.html'),
('21','Type-c手机通用耳机转换线','168','Type-c手机通用耳机转换线','/\fiil商城_files/\20190116142907_485.png','type-c.html'),
('22','FIIL耳机架','129','北美胡桃木','/\fiil商城_files/\20190116143006_484.png','耳机架.html')

;








  