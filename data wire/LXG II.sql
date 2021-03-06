SET NAMES UTF8;
DROP DATABASE IF EXISTS lxg2;
CREATE DATABASE lxg2 CHARSET=UTF8;
USE lxg2;
CREATE TABLE userlist
(
uid  INT AUTO_INCREMENT PRIMARY KEY,
uname VARCHAR(32),
upwd VARCHAR(16),
gender VARCHAR(16),
phone VARCHAR(20),
e_mail VARCHAR(32),
reg_time DATE,
grade INT DEFAULT '1'
);
INSERT INTO userlist VALUES
('1','LXG','123456','1','13171827320','2474840203@qq.com','2019-11-16','5'),
('2','TOM','123456','1','110','2474840203@qq.com','2019-12-06','4');

CREATE TABLE product
(
pid INT,
pname VARCHAR(32),
imgsrc VARCHAR(256),
updtime DATE,
viewnum VARCHAR(32),
details VARCHAR(128),
pro_model VARCHAR(32),
pro_brand VARCHAR(32) default 'UGREEN绿联',
pro_type VARCHAR(32),
pro_capacity VARCHAR(32),
price INT
);

CREATE TABLE video(
video_src VARCHAR(128) 
);
INSERT INTO video VALUES(
'img\/PD快充成片20m.mp4'
);
INSERT INTO product VALUES
('1','绿联迷你充电宝，女生便携移动电源','IMG/\1574820433.jpg',' 2019-11-27 09:59:07',
'16090','绿联迷你掌心充电宝，10000mAh迷你掌心充电宝，女用便携移动电源。减负时代，以小取胜。',
'PB133','','移动电源','10000mAh','168'),

('2','绿联音响概念款USB-C扩展坞','IMG/\1554970580.jpg',' 2019-06-13 11:35:02',
'5885','绿联音响概念款扩展坞，音响概念11合1 USB-C扩展坞，笔记本的桌面伴侣。',
'CM245','','USB-C扩展坞','','148'),

('3','绿联手机麦克风，k歌唱吧小话筒','IMG/\1574820407.jpg',' 2019-11-27 09:55:10',
'719','绿联手机麦克风，手机唱歌麦克风，全民K歌唱吧小话筒。',
'CM205','','手机麦克风','','98'),

('4','绿联24口机房网络配线架','IMG/\1574820631.jpg','2019-11-27 09:56:09',
'592','绿联24口机房网络配线架，有效解决电脑机房网线多而乱的问题，让机房更整齐更安全。',
'NW126','','网络配线架','','49'),

('5','绿联奢华款MFi认证苹果数据线','IMG/\1544759292.jpg','2019-06-13 17:37:35',
'6705','绿联24口机房网络配线架，有效解决电脑机房网线多而乱的问题，让机房更整齐更安全。',
'US293','','苹果数据线','','35'),

('6','绿联手机平板通用桌面支架','IMG/\1552648977.jpg','2019-06-13 11:33:08 ',
'5209','绿联手机平板通用桌面支架，手机平板专属桌面支架，每个角度都依然舒适。轻松生活，愉悦自我。',
'LP177','','手机桌面支架','','45'),

('7','绿联蓝牙5.0音频接收器，有线耳机通用蓝牙适配器aptX LL认证','IMG/\1546933021.jpg','2019-10-16 19:51:24 ',
' 14461','绿联蓝牙5.0音频接收器让有线耳机实现蓝牙功能，带麦克风语音，无线更方便。高清音质瞬间拥有支持aptX创新编码技术，享受Hi-Fi级高保真无损音质。音乐随心切换带音量控制键，音乐调节更自由，切换歌曲更方便。支持电话语音带麦克风功能，无线耳机也能随时畅聊。自带电池长久续航内置110mAh可充电锂电池，2小时充满可持续使用4-5小时。音乐随行，一路畅享运动出行时携带更随意，无束缚更自在。畅玩游戏更痛快',
'CM110','',' 蓝牙5.0接收器','','99'),

('8','绿联iPhone XS钢化膜，苹果X屏幕防刮花','IMG/\1544685782.jpg',' 2019-06-13 17:43:32 ',
'3277','绿联iPhone XS钢化膜，高清防爆防刮花钢化膜，保护iPhone XS，我们更专业。',
'LP171','','iPhone XS钢化膜','','35'),

('9','绿联Type C PD快充电源适配器','IMG/\1558169130.jpg','2019-06-13 11:32:12 ',
'19805','绿联Type C PD快充适配器，符合苹果全新12寸New MacBook快速充电标准，真正符合USB PD快充协议的电源适配器，30W大功率输出，充电速度快速。',
'CD127','','快充','','25'),

('10','绿联iPhone/iWatch二合一无线充电器','IMG/\1544861267.jpg','2019-06-13 11:29:07  ',
'11952','绿联iPhone/iWatch无线充电二合一，苹果手机手表同时充电，一体式充电解决方案，有了iWatch的日子里总该有个它。',
'CD178','','无线充电器','7.5W','79'),

('11','绿联【2020幸运礼盒】PD快充充电宝','IMG/\1577519628.jpg','2019-12-30 10:30:47 ',
'8','绿联2020幸运礼盒新年当红礼盒包装PD快充充电宝。爱你，礼当不一样。鸿运加持 实力依然绿联2020幸运礼盒采用中国红色彩，充电宝给你鸿运加持。懂你归心似箭绿联礼盒充电宝支持PD快充，30分钟充电50%。新年礼盒设计新年专属 面向未来产品参数品牌：UGREEN绿联型号：PB137/PB158名称：绿联新年礼盒',
'PB137/PB158s','','绿联新年礼盒','10000mAh','149'),

('12','绿联Type-C移动硬盘盒2.5寸','IMG/\1544759292.jpg','2019-12-23 17:35:30',
'46','绿联Type-C移动硬盘盒，2.5寸Type-C移动硬盘盒，MacBook外接移动硬盘。',
'','-','','','139'),

('13','绿联Type-C移动硬盘盒2.5寸','IMG/\1577094622.jpg','2019-12-23 17:35:30',
'46','绿联Type-C移动硬盘盒，2.5寸Type-C移动硬盘盒，MacBook外接移动硬盘。',
'','-','','','139'),

('14','绿联5A超级快充充电器华为scp快充','IMG/\1576060712.jpg','2019-12-11 19:26:17',
'470','绿联5A超级快充充电器支持华为22.5W超级快充， 兼容苹果全系列手机充电，可以两个手机一起充。5A大电流 急速满电支持华为SCP超级快充协议，搭配5A快充线，输出22.5W大功率，手机即刻满血复活。3小时充满iPhone11绿联超级快充充电器支持给苹果手机充电，实测3小时充满iPhone11。两个手机同时充双口输出，支持两台设备同时充电，不减速。快充不伤手机绿联超级快充充电器内置智能快充协议芯片',
'CD206','',' 充电头','22.5W','39'),

('15','绿联2万毫安超级双快充充电宝SCP+QC','IMG/\1576057761.jpg','2019-12-11 17:30:24',
'218','绿联2万毫安超级双快充充电宝，支持华为scp超级快充和高通qc3.0双快充，22.5W大功率充电黑科技。',
'PB166','',' 移动电源','20000mAh','255'),

('16','绿联type-c转C+USB二合一数据线','IMG/\1574940665.jpg','2019-12-02 16:19:29',
'545','绿联type-c转C+USB二合一数据线，一线两头，两个充电接口自由切换，支持PD快速充电。',
' US314','','type-c数据线','','42'),

('17','绿联国行任天堂Switch保护壳','IMG/\1576049882.jpg',' 2019-12-11 15:11:50 ',
'51','绿联国行任天堂Switch保护壳，最新任天堂Nintendo Switch保护壳，玩游戏更自由。',
' LP260','','任天堂Switch保护壳','','55'),


('18','绿联MacBook扩展坞Type-C接口','IMG/\1574853655.jpg','2019-11-28 10:02:08',
' 561','绿联MacBook扩展坞Type-C接口，11合1，为苹果笔记本电脑MacBook量身定做。让你的MacBook更强大多功能集于一身，桌面办公小能手，全新创意外观设计，与您的MacBook相得益彰。多口扩展 一步到位11合1，满足MacBook的不同扩展需求。10Gbps急速传输绿联MacBook扩展坞有两个USB3.1 Gen2接口，10Gbps理论速率，实测传输速度可达940MB/s。',
'CM268','','Type-C扩展坞','','43'),

('19','绿联电话线，2芯4芯纯铜家装工程通用','IMG/\1574329200.jpg',' 2019-11-21 17:28:15',
'37','绿联纯铜电话线，2芯4芯家装工程通用电话线：信号不断线，通话更清晰。',
'NW137','','电话线','','33'),


('20','绿联桌面书本支架，学生看书学习支架','IMG/\1573803039.jpg',' 2019-11-15 15:27:25',
'110','绿联桌面书本支架，学生看书学习支架：抬头看书，轻松学习。',
' LP201','','桌面支架','','77'),

('21','绿联USB-C转RS232九针串口线','IMG/\1574940665.jpg',' 2019-11-28 19:01:47 ',
'226','绿联USB-C转RS232九针串口线，专业级USB-C转RS232串口线，适用于电脑电视连接监控打印收银机床等各种器械设备。',
' CM253','','USB-C转DB9','','99'),

('22','绿联sata硬盘柜，2.5/3.5寸硬盘通用','IMG/\1573038645.jpg',' 2019-11-06 19:04:24',
'1116','绿联sata硬盘柜，双sata硬盘同时快速运行，2.5/3.5寸硬盘通用。',
'CM249','','硬盘盒','','128'),

('23','绿联女用迷你创意移动电源','IMG/\1573028210.jpg',' 2019-11-06 16:46:52 ',
'141','绿联女用迷你创意移动电源新款迷你移动电源，女用小巧外形；只手可握，爱不释手。极致小巧绿联女用迷你移动电源采用高密度电芯，外形小巧美观。除了小 还要轻绿联女用迷你移动电源重量更轻，拿在手上轻松自如。电量足 放心用采高密度电芯，相比普通电芯，不仅体积小，容量更大。2.1A大电流 外出充电更快速实测绿联女用移动电源2小时可充满iPhone xs，充电更节省时间。',
' PB170','','移动电源','','99'),

('24','绿联10000mAh迷你快充充电宝','IMG/\1573024032.jpg','  2019-11-06 14:55:20',
'165','绿联10000mAh迷你快充充电宝，支持PD 18W双向快充，急速闪充 迷你便携。',
'PB171','','移动电源','10000mAh','88'),


('25','绿联30000mAh充电宝，3万容量移动电源','IMG/\1573459914.jpg',' 2019-11-11 15:52:13 ',
' 206','绿联30000mAh充电宝 3万毫安超大容量移动电源，充一次，用一周。',
'PB162','','移动电源','30000mAh','399'),

('26','绿联HDMI一进二出切换器','IMG/\1571975732.jpg','2019-10-25 12:09:57  ',
'392','绿联HDMI一进二出切换器，HDMI一进二出、二进一出双向切换器，让你在多视频信号之间自由切换。',
'CM217','','HDMI双向切换器','','128'),

('27','绿联Type-C耳机转接头，Type-C转双3.5mm','IMG/\1571723776.jpg',' 2019-10-22 13:52:19 ',
' 270','绿联Type-C耳机转接头，Type-C转双3.5mm，情侣两个耳机同时听歌。',
' AV144','','Type-C耳机转换器','','49'),

('28','绿联双Type-C快充充电器','IMG/\1571712866.jpg',' 2019-10-22 11:08:25',
'506','绿联双Type-C快充充电器，双口PD18W，单口最大36W，iPhone和iPad都能快充。',
'CD199','','PD快充充电器','','68'),

('29','绿联汽车玻璃防雨喷雾','img/\1572405587.jpg','2019-10-30 11:39:52',
'179','绿联汽车玻璃防雨喷雾，解决雨天汽车后视镜、车窗玻璃模糊不清的烦恼，开车不影响视线。',
' LP229','','汽车防雨喷雾','','78'),

('30','绿联iPhone11无线充电器','IMG/\1570763249.jpg','2019-10-11 11:49:50',
'929','绿联iPhone11无线充电器，新型吸盘式无线充电器，为你的iPhone11开启无线充电。',
'CD198','','无线充电器','5W/7.5W/10W','98'),

('31','绿联墙壁手机支架','IMG/\1570776763.jpg','2019-10-11 14:51:10 ',
'198','绿联墙壁手机支架，卧室墙壁卫生间手机支架，随时随地安放你的手机。',
'LP193','','墙壁手机支架','','45'),

('32','绿联蓝牙5.0音频接收器，aptX无损音质有线耳机变无线','IMG/\1544684743.jpg','2019-10-16 19:22:58',
'11080','绿联蓝牙5.0音频接收器，有线耳机秒变无线耳机，aptX无损编码技术，高清音质，瞬间拥有。',
'CM110','','蓝牙5.0音频接收器','','168');


CREATE TABLE cart(
pid INT(5),
uname VARCHAR(32),
num INT(5)
);

CREATE TABLE joboffer(
jid INT(5),
job VARCHAR(20),
edbg VARCHAR(32),
ads VARCHAR(32),
salary VARCHAR(16),
thedate VARCHAR(32)
);

INSERT INTO joboffer VALUES
('1','亚马逊英语运营/Amazon英语运营','本科 | 招2人','深圳-龙华新区','0.8-1.5万/月','12-23'),
('2','硬件工程师','3-4年经验 | 本科 | 招1人','深圳-龙华新区','1.2-2万/月','12-23'),
('3','产品开发（精品）','3-4年经验 | 本科 | 招2人','深圳-龙华新区','0.8-1.5万/月','12-23'),
('4','Mac工程师','3-4年经验 | 本科 | 招1人','深圳-龙华新区','1.8-3万/月','12-23'),
('5','项目工程师','2年经验 | 大专 | 招2人','深圳-龙华新区','0.8-1万/月','12-23'),
('6','Android系统工程师','3-4年经验 | 本科 | 招2人','深圳-龙华新区','2-4万/月','12-23'),
('7','高级招聘专员/招聘专员','1年经验 | 大专 | 招2人','深圳-龙华新区','7-9千/月','12-23'),
('8','往来会计','3-4年经验 | 大专','深圳-龙华新区','0.6-1万/月','12-23'),
('9','电源项目工程师','3-4年经验 | 大专 | 招2人','深圳-龙华新区','0.7-1.2万/月','12-23'),
('10','产品主管','3-4年经验 | 大专 | 招1人','深圳-龙华新区','1.2-1.6万/月','12-23');

CREATE TABLE pay(
pid INT(5),
uname VARCHAR(32),
num INT(5),
buydate VARCHAR(64)
);

CREATE TABLE paid(
pid INT(5),
uname VARCHAR(32),
num INT(5),
buydate VARCHAR(64)
);



CREATE TABLE news(
news_id INT(3),
news_mainimg VARCHAR(128),
news_title VARCHAR(64),
news_content VARCHAR(256),
news_tags0 VARCHAR(32),
news_tags1 VARCHAR(32),
news_tags2 VARCHAR(32),
news_date VARCHAR(16),
news_view VARCHAR(16),
news_details VARCHAR(5000)
);


INSERT INTO news VALUES
('1','img/\1567672675.jpeg','iPhone11如何实现快速充电','苹果9月10日发布的iPhone11支持PD快充功能，将原装的5W充电提升到了18W。然而PD协议运用到的是USB-C接口，目前还无法在传统的USB接口实现。要实现iPhone11的快速充电功能，需要用到USB-C充电器和USB-C to Lightning数据线。',
'USB-C充电器','iPhone11','','2019-9-18','34935','苹果9月10日发布的iPhone11支持PD快充功能，将原装的5W充电提升到了18W。然而PD协议运用到的是USB-C接口，目前还无法在传统的USB接口实现。要实现iPhone11的快速充电功能，需要用到USB-C充电器和USB-C to Lightning数据线。

iPhone11如何实现快速充电

USB-C充电器
USB-C充电器是充电口为USB-C（也叫Type-C）的新型充电器，外形如下图所示：

iPhone11如何实现快速充电

因USB-C接口体积小、支持正反插拔，且支持5V、9V、12V、15V、20V多档电压和最高100W的输出功率，USB-C充电器很早就在苹果MacBook沿用。

USB-C充电器有18W/30W/65W等多种不同功率，具体给iPhone11快充的话，选择18W就够了，当然用其它瓦数充电器也能向下兼容，同样达到18W快充，具体使用中的区别，参照评测：

实测PD18W/30W/65W充电器给iPhone xs充电快慢对比

iPhone11如何实现快速充电

USB-C to Lightning数据线
USB-C to Lightning线也称PD快充线，是将原来lightning线的USB口换成了C接口，搭配USB-C充电器实现PD快充效果。外形图如下：

iPhone11如何实现快速充电

选择USB-C to Lightning线的主要参考因素是苹果MFi认证。经过MFi认证的C转L线，在给iPhone11充电时，充电速度和用料做工可以达到原装标准；而非认证线除了功率达不到，还可能出现“此线缆尚未经过认证”弹窗提示，无法实现快充体验。参照评测：

实测iPhonexs快充线认证和非认证以及官方线的区别

iPhone11如何实现快速充电

以上就是iPhone11实现快速充电的内容介绍，更多iPhone11充电的相关科普，可参照绿联官网技术支持。
'),

('2','img/\1576237872.png','国行任天堂Switch发布，入手别忘了带上这些游戏必备配件','国行任天堂switch发布以来，累计销量已接近十万，流畅的画质加合理的定价，让switch第一波用户好评度很高。不过作为大多数NS粉的第一台掌上游戏机，除了体验任天堂的好玩游戏，日常使用和存放也要做好保管，初次入手switch游戏机，别忘了带上以下这些游戏必备配件。',
'国行任天堂Switch ','Switch配件','switch钢化膜','2019-12-13','456','国行任天堂switch发布以来，累计销量已接近十万，流畅的画质加合理的定价，让switch第一波用户好评度很高。不过作为大多数NS粉的第一台掌上游戏机，除了体验任天堂的好玩游戏，日常使用和存放也要做好保管，初次入手switch游戏机，别忘了带上以下这些游戏必备配件。

国行任天堂Switch发布，入手别忘了带上这些游戏必备配件

1：switch钢化膜
钢化膜是switch的第一个必备品，为什么说必备品呢，因为国行Switch的屏幕是塑料材质，跟常见手机平板的玻璃屏不同，塑料屏很容易被刮花，可以说一刮就花。为了防止刚入手的新机被刮花，有必要给它贴个钢化玻璃膜，钢化膜不仅防刮耐磨，而且比switch原装屏的手感更好。

国行任天堂Switch发布，入手别忘了带上这些游戏必备配件

2：switch充电器
已经用了switch的朋友会发现，国行switch原装充电器使用的是早期头线一体式设计，充电头和数据线是不能拆分的，无法使用充电宝为其充电，外出没电只能找插座充电，非常不方便。但其实国行switch支持的充电功率为5V/1.5A，充电接口为type-c，所以我们也可以选择购买一条type-c数据线，搭配常规的充电宝或充电头来给switch充电，这样出行充电就会方便很多。

国行任天堂Switch发布，入手别忘了带上这些游戏必备配件

3：switch收纳包
switch作为一款便携掌上游戏机，带着到处玩耍肯定是少不了的。为了防止我们的switch进灰尘和到处磕碰，一个合身的收纳包少不了。收纳包除了可以放switch主机，还能放底座、joycon手柄、充电器、数据线、NDS卡等常用switch配件，出门玩机必备。

国行任天堂Switch发布，入手别忘了带上这些游戏必备配件

以上就是任天堂switch的一些常用配件，对刚入手国行switch的NS粉来说很有必要。当然switch还有保护壳、投屏线、扩展底座等其它配件，个人可以根据实际需求选择。

更多任天堂switch配件介绍欢迎到绿联官网产品中心查看。'),

('3','img/\1568962495.png','	
iPhone11与iPhonexs电池容量和充电速度对比','iPhone的续航一直是果粉很关注的问题，去年iPhone xs对电池容量做了提升，用户的反馈还不错。那么今年新款的iPhone11表现如何呢，我们根据iPhone11的官方说明，从电池容量和充电速度来跟去年做个对比。',
'USB-C充电器','iPhone11','','2019-12-17','19048','iPhone的续航一直是果粉很关注的问题，去年iPhone xs对电池容量做了提升，用户的反馈还不错。那么今年新款的iPhone11表现如何呢，我们根据iPhone11的官方说明，从电池容量和充电速度来跟去年做个对比。

iPhone11与iPhonexs电池容量和充电速度对比

一、电池容量方面
去年三款iPhone的电池容量分别为：

iPhone xr是2942毫安，xs是2658毫安，xs max是3174毫安。

今年iPhone11三款机型均是去年三个版本的升级，电池容量也有了增加。

iPhone11是3110毫安，11 Pro是3190毫安，11 Pro MAX电池容量是3969毫安。

电池容量（mAh）	xr/11	xs/11 pro	xs max/11 pro max
iPhone xs	2942	2658	3174
iPhone 11	3110	3190	3969
数据对比来看，iPhone11容量小幅升级，高配版pro电池容量提升明显，pro max已达3969mAh，成为iPhone目前为止电池容量最大的机型，续航能力突出。

iPhone11与iPhonexs电池容量和充电速度对比

二、充电速度方面
相对于电池容量的提升，iPhone11在充电方面表现一般。iPhone11系列和去年的iPhone xs一样，支持的快充协议还是PD 18W。

iPhone11与iPhonexs电池容量和充电速度对比

值得一提的是，今年高配版的iPhone11 pro和iPhone11 pro max标配了PD18W充电套装，入手即能直接体验快充。相比之下iPhone11标配的则还是5W充电套装，充电速度较慢。iPhone11用户若要实现快充，可通过购买第三方PD套装，不到百元的价格就能节省大量充电时间，实用性和性价比都非常高。
'),

('4','img/\1562642648.png','USB TYPE C拆解以及USB3.1规范详解','USB全称为Universal Serial Bus，翻译为通用串行总线，是连接计算机系统与外部设备的一种串口总线标准，也是一种输入输出接口的技术规范，被广泛地应用于个人电脑和移动设备等信息通讯产品，并扩展至摄影器材、数字电视（机顶盒）、游戏机等其它相关领域。',
'USB3.1 ','USB Type C','','2019-07-09','53423','USB全称为Universal Serial Bus，翻译为通用串行总线，是连接计算机系统与外部设备的一种串口总线标准，也是一种输入输出接口的技术规范，被广泛地应用于个人电脑和移动设备等信息通讯产品，并扩展至摄影器材、数字电视（机顶盒）、游戏机等其它相关领域。

随着IT行业不断进步，USB历经以下几个阶段：

USB1.0：1.5Mbps(192KB/s)低速(Low-Speed)500mA，1996年1月；

USB1.1：12Mbps(1.5MB/s)全速(Full-Speed)500mA，1998年9月；

USB2.0：480Mbps(60MB/s)高速(High-Speed)500mA，2000年4月；

USB3.0：5Gbps(640MB/s)超速(Super-Speed)900mA，2008年11月；

USB3.1：10Gbps(1.25GB/s)超速加(SuperSpeed+)5A，2013年12月。

最新一代的USB 3.1 Gen2，传输速度为10Gbit/s，三段式电压5V/12V/20V，最大供电100W 。

而伴随USB3.1而来的C型USB接口：USB Type C大有一统消费电子接口的趋势，近期已占领各大品牌旗舰手机接口榜首。

一、USB Type C外观及引脚定义
USB Type C接口以其纤薄、正反可插拔等诸多优势，得到了广泛运用，我们先看看USB Type C接头拆解图。

USB Type C接头拆解图

USB Type C接头拆解图

从上图拆解可见，USB Type C接口上下各有12个引脚，其引脚排列如下图：

Type C母头引脚排列图

Type C母座引脚排列图

Type C公头引脚排列图

Type C公头引脚排列图

二、USB Type C三种工作模式
USB3.1标准有三种工作模式：

1：DRP。主HOST/DEVICE可自由转换，类似电脑或MacBook。

USB Type C DRP工作模式示意图

USB Type C DRP工作模式示意图

2：DFP。下行端，主HOST端（上拉电阻）。

USB Type C DFP工作模式示意图

USB Type C DFP工作模式示意图

3：UFP。上行端，DEVICE端（下拉电阻）。

USB Type C UFP工作模式示意图

USB Type C UFP工作模式示意图

三、USB Type C技术要求
USB Type C的快速传输对线材也有要求，21芯无氧铜传输导体保证了大电流的传输。 下图为USB3.1规范的绿联Type C数据线展示图，其内部线芯共有21芯，比USB2.0多了16条线芯，从而满足了USB3.1的的高速传输标准以及100W输出功率。

USB Type C技术要求

四、USB Type C产品现状
目前使用Type C接口的电子产品主要有手机、平板、笔记本电脑以及延伸出的数据线、充电头、移动电源等数码配件，大多产品传输速度还停留在USB2.0和USB3.0。具备SCP超级快充功能的华为Mate20系列，搭载专属Type C充电器的Type C数据线，可通过5A电流，功率可达40W，但是离USB 3.1 Gen2最高100W的输出功率还差距很大，这方面需要科技的进步和业界的共同努力。

USB Type C产品现状

最后关于文章罗列的几个关键参数说明：

USB3.1：USB3.1规范分为USB3.1 Gen1与USB3.1 Gen2，目前苹果主流MacBook属于USB3.1 Gen1，其带宽为5Gbps；只有USB3.1 Gen2规范的带宽才能达到10Gbps；

HOST端：USB HOST端即为USB主设备，可以从连接到HOST端的设备读取数据。'),

('5','img/\1575614679.png','品牌维权通告','针对广州绿联电子科技有限公司生产、销售带有“绿联”字号同类产品的不正当竞争行为，我司于2019年3月份向广东省广州市天河区人民法院提起诉讼请求， 并于2019年12月2日获得胜诉。
具体通告内容可查看附件文档《绿联品牌维权通告》。',
'品牌维权通告','绿联品牌','绿联商标','2019-12-06','663','尊敬的合作伙伴：

针对广州绿联电子科技有限公司生产、销售带有“绿联”字号同类产品的不正当竞争行为，我司于2019年3月份向广东省广州市天河区人民法院提起诉讼请求， 并于2019年12月2日获得胜诉。

具体通告内容可查看附件文档《绿联品牌维权通告》。

绿联|数据线|HDMI线|移动电源|车充|蓝牙|手机配件|UGREEN绿联绿联品牌维权通告.pdf

在此感谢各位的配合与协助，希望我们继续共同监督 、及时反馈此类侵害绿联品牌的行为。对此类行为，我司必将通过法律手段维护品牌合法权益。

'),

('6','img/\1576132643.png','USB TYPE C拆解以及USB3.1规范详解','苹果9月10日发布的iPhone11支持PD快充功能，将原装的5W充电提升到了18W。然而',
'usb-c充电器','iphone11','','2019-12-06','27','绿联Mini DisplayPort转HDMI（Mini DP转HDMI线）是完全支持音视频同步输出的高品质产品，只要电脑Mini DP接口能支持音视频输出，绿联Mini DP转HDMI产品就给您一个完美的高清画面和极致的听觉享受。由于苹果Mac和Windows系统默认设置的一些原因，需要用户自己去更改所需要的音频模式。

Mini DP线转HDMI线接电视怎么设置

一、Wins操作系统设置
1：Mini DP转HDMI线视频设置
DP转HDMI高清线接电视在Win7系统下如何设置？在Win7系统下外接显示器会有以下四种视频显示模式：

复制这些显示：电脑显示屏幕和电视屏幕所显示的内容是一样的，适用于教学；

扩展这些显示：电视的屏幕是电脑显示屏幕的扩展内容，适用于两个显示器显示不一样的内容；

只在1上显示桌面：指屏幕只有1这个显示器上有显禾；

只在2上显示桌面：指屏幕只有2这个显示器上有显示；

其中“复制这些显示”和“扩展这些显示”应用的比较广泛。下面开始进行图文演示操作：

在桌面上右键一屏幕分辨率（窗口中的1和2分别是电脑显示器和电视的图标），在屏幕分辨率窗口的“多显示器”中选择所需要的显示模式。

Mini DP线转HDMI线接电视怎么设置

Mini DP线转HDMI线接电视怎么设置

其它Win8-10、WinXP、苹果Mac OSX系统下的DP转HDMI使用方法差异不大，具体可参照文章：

绿联高清视频线材设置教程丨Windows系统丨苹果系统

2：Mini DP转HDMI线 Win7系统音频设置
鼠标右键点击电脑右下角的音频图标，选择“播放设备”，鼠标右键点击显卡音频，将其设置为默认设备，即：电视出声音，将扬声器设置为默认设备，即：电脑出声音。

DP转HDMI高清线接电视设置方法

二、苹果Mac系统设置
下面以苹果MacBook Pro2018为例说明，其他型号设置雷同（同样适用于携带Mini DisplayPort接口的显卡）

绿联|数据线|HDMI线|移动电源|车充|蓝牙|手机配件|UGREEN绿联

上图所示就是用绿联Mini转HDMI线连接MacBook Pro和大屏电视的效果。由于很多朋友的苹果电脑都安装了Mac和Windows的双系统，所以本篇教程会分别对Mac系统和Windows系统来进行讲解，操作方法如下：

1：线缆连接
Mini DP线转HDMI线接电视怎么设置

首先将电脑和显示器用绿联Mini DP转HDMI线相连，调整显示设备的接收信号源，检查所调整的信号源与所接的接口是否一致。当MacBook Pro与外接显示器正确连接后电视上就会出现画面了。

（1）Mini DP转HDMI线Mac系统视频设置

在Mac系统下外接显示器会有两种视频显杀模式：

扩展模式（默认模式)：就是同一个画面分别扩展到两个以上显示器上显示；

镜像模式：就是笔记本显示器和外接显示器都同时显示同一个完整画面。

下面开始进行Mini DP转HDMI线Mac系统图文演示操作：

①扩展模式：进入到电脑“系统偏好设置-显示器-排列”，能检测到两个显示器，将左下角“镜像显示器”的钩去掉。（若电脑没有检测到外置显示器，可以点击右下角“检测显示器”进行检测）

Mini DP线转HDMI线接电视怎么设置

其中有白条框的显示屏为主屏，能显示电脑桌面图标；另一屏幕就是副屏，只有电脑桌面背景，没有图标。主副屏可以自行设置，只需要将主屏上方的白条拖至副屏上即可。

Mini DP线转HDMI线接电视怎么设置

将需要在电视上播放的内容（图片、视频等），先在电脑上打开，再按住鼠标左键不放，从打开的内容窗口中向右一直拖动，直到完全出现在电视上，即可松开鼠标，鼠标再向左移动到电视边缘，即可返回电脑上，此时就可以在电脑上打开其它内容了。

Mini DP线转HDMI线接电视怎么设置

②镜像模式：进入到电脑“系统偏好设置-显示器-排列”，点击左下角“镜像显示器”打上钩，此时Mac和外接显示器的显示内容保持同步了。

Mini DP线转HDMI线接电视怎么设置

Mini DP线转HDMI线接电视怎么设置

（2）Mini DP转HDMI线Mac系统音频设置

进入到电脑“系统偏好设置--声音--输出”设置界面。电脑出声音，请选择“内置扬声器”，电视出声音请选择“HDMI”输出。

Mini DP线转HDMI线接电视怎么设置

（3）Mini DP转HDMI线Mac系统分辨率设置

在“系统偏好设置”下，点击“显示器”在显示器界面，点击选择“缩放”。在罗列出的分辨率中，点击选择自己认为合适的分辨率，关闭设置界面，出现提示窗口，点击选择“好”即可。

Mini DP线转HDMI线接电视怎么设置

注意：因为系统本身对音频输出固定设置的关系，电脑和电视是不能同时输出声音的，两者只能选其一。

建议：视频设置扩展模式，音频输出设置成外接显示的的端口，这样就可以在不影响电脑操作的情况下， 观看影片了。

以上就是Mini DP转HDMI在Mac和Windows下的设置方法。如果疑问可以在绿联微信公众号（lvliankeji）咨询客服解决。'),


('7','img/\1578128326.png','绿联VGA二进一出切换器使用教程丨MM126','绿联VGA二进一出切换器可以让两台主机共用一个显示器，一键切换，方便快捷。以下为绿联VGA二进一出切换器MM126的产品展示和操作方法，包含切换器连接电脑显示器的操作步骤和问题说明，希望对您了解VGA切换器有所帮助。',
'USB-C充电器','iPhone11','','2019-01-04','38 ','绿联VGA二进一出切换器可以让两台主机共用一个显示器，一键切换，方便快捷。

以下为绿联VGA二进一出切换器MM126的产品展示和操作方法，包含切换器连接电脑显示器的操作步骤和问题说明，希望对您了解VGA切换器有所帮助。<video  style="width:100%"  class="mb-2" controls src="img/\40254VGA二进一出切换器教程.mp4"></video>'),


('8','img/\1577796238.png','Mini DP线转HDMI线接电视怎么设置','绿联Mini DisplayPort转HDMI（Mini DP转HDMI线）是完全支持音视频同步输出的高品质产品，只要电脑Mini DP接口能支持音视频输出，绿联Mini DP转HDMI产品就给您一个完美的高清画面和极致的听觉享受。由于苹果Mac和Windows系统默认设置的一些原因，需要用户自己去更改所需要的音频模式。',
'USB-C充电器','iPhone11','',' 2019-12-31','11869','一、Wins操作系统设置
1：Mini DP转HDMI线视频设置
DP转HDMI高清线接电视在Win7系统下如何设置？在Win7系统下外接显示器会有以下四种视频显示模式：

复制这些显示：电脑显示屏幕和电视屏幕所显示的内容是一样的，适用于教学；

扩展这些显示：电视的屏幕是电脑显示屏幕的扩展内容，适用于两个显示器显示不一样的内容；

只在1上显示桌面：指屏幕只有1这个显示器上有显禾；

只在2上显示桌面：指屏幕只有2这个显示器上有显示；

其中“复制这些显示”和“扩展这些显示”应用的比较广泛。下面开始进行图文演示操作：
<img  style="width:100%"  class="mb-2" controls src="img/\1577795049632683.png"></img>
在桌面上右键一屏幕分辨率（窗口中的1和2分别是电脑显示器和电视的图标），在屏幕分辨率窗口的“多显示器”中选择所需要的显示模式。



<img  style="width:100%"  class="mb-2" controls src="img/\1541574200188217.png"></img>

<img  style="width:100%"  class="mb-2" controls src="img/\1541574200522048.png"></img>
其它Win8-10、WinXP、苹果Mac OSX系统下的DP转HDMI使用方法差异不大，具体可参照文章：

绿联高清视频线材设置教程丨Windows系统丨苹果系统

2：Mini DP转HDMI线 Win7系统音频设置
鼠标右键点击电脑右下角的音频图标，选择“播放设备”，鼠标右键点击显卡音频，将其设置为默认设备，即：电视出声音，将扬声器设置为默认设备，即：电脑出声音。

<img  style="width:100%"  class="mb-2" controls src="img/\1541574476810661.png"></img>
DP转HDMI高清线接电视设置方法

二、苹果Mac系统设置
下面以苹果MacBook Pro2018为例说明，其他型号设置雷同（同样适用于携带Mini DisplayPort接口的显卡）
<img  style="width:100%"  class="mb-2" controls src="img/\1577795157160741.png"></img>

绿联|数据线|HDMI线|移动电源|车充|蓝牙|手机配件|UGREEN绿联

上图所示就是用绿联Mini转HDMI线连接MacBook Pro和大屏电视的效果。由于很多朋友的苹果电脑都安装了Mac和Windows的双系统，所以本篇教程会分别对Mac系统和Windows系统来进行讲解，操作方法如下：
<img  style="width:100%"  class="mb-2" controls src="img/\10.jpg"></img>

1：线缆连接


首先将电脑和显示器用绿联Mini DP转HDMI线相连，调整显示设备的接收信号源，检查所调整的信号源与所接的接口是否一致。当MacBook Pro与外接显示器正确连接后电视上就会出现画面了。

（1）Mini DP转HDMI线Mac系统视频设置

在Mac系统下外接显示器会有两种视频显杀模式：

扩展模式（默认模式)：就是同一个画面分别扩展到两个以上显示器上显示；

镜像模式：就是笔记本显示器和外接显示器都同时显示同一个完整画面。

下面开始进行Mini DP转HDMI线Mac系统图文演示操作：

<img  style="width:100%"  class="mb-2" controls src="img/\1541574950360415.png"></img>

<img  style="width:100%"  class="mb-2" controls src="img/\1541574979708539.png"></img>
①扩展模式：进入到电脑“系统偏好设置-显示器-排列”，能检测到两个显示器，将左下角“镜像显示器”的钩去掉。（若电脑没有检测到外置显示器，可以点击右下角“检测显示器”进行检测）



其中有白条框的显示屏为主屏，能显示电脑桌面图标；另一屏幕就是副屏，只有电脑桌面背景，没有图标。主副屏可以自行设置，只需要将主屏上方的白条拖至副屏上即可。
<img  style="width:100%"  class="mb-2" controls src="img/\1541574996895905.png"></img>



将需要在电视上播放的内容（图片、视频等），先在电脑上打开，再按住鼠标左键不放，从打开的内容窗口中向右一直拖动，直到完全出现在电视上，即可松开鼠标，鼠标再向左移动到电视边缘，即可返回电脑上，此时就可以在电脑上打开其它内容了。


②镜像模式：进入到电脑“系统偏好设置-显示器-排列”，点击左下角“镜像显示器”打上钩，此时Mac和外接显示器的显示内容保持同步了。
<img  style="width:100%"  class="mb-2" controls src="img/\1541575029353657.png"></img>
<img  style="width:100%"  class="mb-2" controls src="img/\1541575058553609.png"></img>

（2）Mini DP转HDMI线Mac系统音频设置

进入到电脑“系统偏好设置--声音--输出”设置界面。电脑出声音，请选择“内置扬声器”，电视出声音请选择“HDMI”输出。



（3）Mini DP转HDMI线Mac系统分辨率设置

在“系统偏好设置”下，点击“显示器”在显示器界面，点击选择“缩放”。在罗列出的分辨率中，点击选择自己认为合适的分辨率，关闭设置界面，出现提示窗口，点击选择“好”即可。



注意：因为系统本身对音频输出固定设置的关系，电脑和电视是不能同时输出声音的，两者只能选其一。

建议：视频设置扩展模式，音频输出设置成外接显示的的端口，这样就可以在不影响电脑操作的情况下， 观看影片了。

以上就是Mini DP转HDMI在Mac和Windows下的设置方法。如果疑问可以在绿联微信公众号（lvliankeji）咨询客服解决。'),


('9','img/\1577285076.png','蓝牙耳机Airpods Pro配对iPhone11的操作方法说明','苹果新款蓝牙耳机AirPods Pro在外形和功能方面都做了升级，加入了消噪和通透两种聆听模式，官宣妙的不同凡响。那么AirPods Pro该如何配对iPhone11、如何接听电话呢？下文我们对AirPods Pro的配合和充电等常见问题来做个操作说明。',
'USB-C充电器','iPhone11','','2019-12-27','230','苹果新款蓝牙耳机AirPods Pro在外形和功能方面都做了升级，加入了消噪和通透两种聆听模式，官宣妙的不同凡响。那么AirPods Pro该如何配对iPhone11、如何接听电话呢？下文我们对AirPods Pro的配合和充电等常见问题来做个操作说明。
<img  style="width:100%"  class="mb-2" controls src="img/\1577283405300951.png"></img>
蓝牙耳机airpods pro配对iphone11的操作方法说明

一、AirPods Pro配对iPhone
首次AirPods Pro配对需系统为iOS 13.2或更高版本的 iPhone。

将AirPods Pro充电盒放置在iPhone11旁边，打开充电盒，手机上面会弹出AirPods Pro的旋转动画。
<img  style="width:100%"  class="mb-2" controls src="img/\1577283444292286.png"></img>

蓝牙耳机Airpods Pro配对iPhone11的操作方法说明

点击连接，然后按照手机上的提示完成配对即可，AirPods Pro和AirPods均可按此方法配对，如下图。
<img  style="width:100%"  class="mb-2" controls src="img/\1577283461557780.png"></img>

蓝牙耳机Airpods Pro配对iPhone11的操作方法说明

完成配对后，将AirPodsPro放入耳朵会有提示音，且手机右上角会显示耳机图标，此时打开iPhone上的音乐即可收听。
<img  style="width:100%"  class="mb-2" controls src="img/\1577283461557780.png"></img>

二、AirPods Pro更换曲目接听电话
AirPods Pro支持音乐的播放暂停、更换曲目以及接听电话等功能，只需按不同次数的力度感应器即可。


播放/暂停/接听电话：按一次力度感应器

下一曲：按两次力度感应器

上一曲：按三次力度感应器

<img  style="width:100%"  class="mb-2" controls src="img/\1577283487574653.png"></img>


蓝牙耳机Airpods Pro更改曲目操作方法说明

另外AirPods Pro还有前两代AirPods不具备的“主动降噪”和“通透模式”，可通过长按力度感应器来切换。如果你设置了“嘿 Siri”，还可说声“嘿 Siri”来唤起常用的播放歌曲、拨打电话等功能。

三、AirPods Pro充电
AirPods Pro蓝牙耳机满电可持续聆听音乐4.5小时，通话3.5小时，使用时可通过iPhone的控制中心查看耳机电量。
<img  style="width:100%"  class="mb-2" controls src="img/\1577283555106663.png"></img>

蓝牙耳机Airpods Pro充电

当AirPods Pro电量不足时，可将耳机放回到充电盒中进行充电，充电盒可累计提供约24小时的聆听时间。

当充电盒电量不足时，可对充电盒进行充电，AirPods Pro充电盒支持有线充电和无线充电两种方式。

1：有线充电
AirPods Pro充电盒的充电接口为闪电lightning，可以用常规lightning苹果数据线为其充电，也可以用新型的usb-c转lightning数据线为其充电，usb-c充电速度略快。

充电时AirPods Pro耳机放不放入充电盒中没有影响。
<img  style="width:100%"  class="mb-2" controls src="img/\1577283555263178.png"></img>


蓝牙耳机Airpods Pro充电

2：无线充电
AirPods Pro充电盒也支持Qi无线充电协议，可以用绿联多功能无线充电器为其充电。

无线充电时盒盖要关闭，有指示灯的一面朝上。过程中可轻点充电盒查看充电状态，黄色指示灯表示正在充电，绿色表示已经充满。
<img  style="width:100%"  class="mb-2" controls src="img/\1577283666450083.jpeg"></img>

蓝牙耳机Airpods Pro无线充电

以上就是苹果蓝牙耳机AirPods Pro的一些常规使用说明，包含蓝牙配对iPhone11、更换曲目、充电盒充电等内容，相信看完后你会对AirPods Pro的使用更加了解。如果你在使用中遇到AirPods Pro无法配对或无法充电的问题，可以参考绿联官网iPhone充电知识专栏。'),


('10','img/\1575636134.png','	
绿联任天堂Switch游戏机钢化膜贴膜视频教程丨LP153','以下为绿联国行Switch游戏机钢化膜LP153贴膜视频教程，包含Switch钢化膜的详细贴膜步骤，国外版和国内版腾讯Switch通用。',
'USB-C充电器','iPhone11','','2019-12-11','176','
Switch游戏机钢化膜可以更好的保护任天堂Nintendo switch游戏机，防止国行Switch屏幕被刮花磨损，高清透光，手感比裸屏幕更细腻。

以下为绿联国行Switch游戏机钢化膜LP153贴膜视频教程，包含Switch钢化膜的详细贴膜步骤，国外版和国内版腾讯Switch通用。
<video  style="width:100%"  class="mb-2" controls src="img/\任天堂switch游戏机钢化膜贴膜教程.mp4"></video>');

CREATE TABLE course(
cid INT(8),
ctitle VARCHAR(64),
cimg VARCHAR(128),
cview INT(8),
cdate VARCHAR(32),
cdetails VARCHAR(64),
cContent VARCHAR(5000)
);

INSERT INTO course VALUES
('1','手机投屏转换器设置方法图文教程丨US228','img/1543289913238698.png',
'36353','2020-01-16 15:52:21','手机投屏转换器可以让手机投屏电视、投影仪等大屏显示设备，高清看直播玩游戏更畅快。

下面是绿联手机投屏转换器US228的设置教程，本教程适用于安卓手机和iPhone，非智能电视也通用。

','手机投屏转换器可以让手机投屏电视、投影仪等大屏显示设备，高清看直播玩游戏更畅快。

下面是绿联手机投屏转换器US228的设置教程，本教程适用于安卓手机和iPhone，非智能电视也通用。
<img  style="width:100%"  class="mb-2" controls src="img/1543289913238698.png"></img>



一、苹果手机iPhone/iPad设置方法
苹果手机iPhone/iPad无需下载APP，用直连模式即可投屏，具体操作步骤如下：

1：接好供电及hdmi或vga线材，显示器选择好正确信号源， 让显示器初始界面中的黄色底纹处于左边才可正常连接上（按住复位键，再松开，即可切换过来）。
<img  style="width:100%"  class="mb-2" controls src="img/1543289925102481.png"></img>



2：用苹果线连接手机和转换器，首次连接手机会弹出“信任此电脑”选项，选择信任即可，5秒钟左右画面即可同屏。
<img  style="width:100%"  class="mb-2" controls src="img/1547622766474813.png"></img>


注：若产品无法使用，则有可能是系统障碍，请检查产品是否为最新固件，若不是则需要升级产品才可使用，

点击查看：绿联手机投屏器固件升级方法

二、安卓手机直连模式设置方法
1：用视频线连接好产品和电视（注意调整电视的信号源），其次务必要接好供电，也要保证连接手机的线支持数据传输。


2：打开手机设置里的“开发者选项”和“USB调试”，等待5秒左右即可自动投屏，若没有图像显示，请尝试重新插拔数据线。（如果没有找到开发者选项，则找手机软件版本号连续点击【内部版本号】七次，直至提示“开发者模式已启用”）
<img  style="width:100%"  class="mb-2" controls src="img/1543289956115730.jpg"></img>


三、安卓手机APP模式设置方法
1：用视频线连接好产品和电视（注意调整电视的信号源），其次务必要接好供电，也要保证连接手机的线支持传输数据，但是先不要接手机。



当电视显示这样的画面证明电视端连接无误。
<img  style="width:100%"  class="mb-2" controls src="img/1543290240390389.jpg"></img>



2：在手机上面下载EZCast软件。
<img  style="width:100%"  class="mb-2" controls src="img/1543290267355104.png"></img>


3：打开下载好的软件，再用手机数据线把手机和产品正确连接起来。

<img  style="width:100%"  class="mb-2" controls src="img/1543290297271699.jpg"></img>

4：然后观察下进入APP软件后的界面，选择操作。

<img  style="width:100%"  class="mb-2" controls src="img/1543290326156249.png"></img>

5：打开USB网络共享以后，等待几秒（系统此时正在识别手机进行连接），稍后会弹出一个提示，如图勾选不再显示——立即开始。这时候就可以正常投屏了。 



当手机右上角出现双方框图标后，代表连接成功。

<img  style="width:100%"  class="mb-2" controls src="img/1547627359623951.png"></img>

连接成功后，可以点击APP中视频、音乐等按钮将本地视频、音乐等扩展到外接显示器上，在播放后手机可返回主界面进行其它操作。或者直接返回手机主界面使用视频APP（如爱奇艺、优酷）等软件。（返回手机主界页后，则是直连操作模式，部分手机的声音无法传输至hdmi接口中）

四、相关提示操作
1、安卓手机直连模式下出现如下提示的操作方法。

<img  style="width:100%"  class="mb-2" controls src="img/1543290432321891.png"></img>

2、安卓手机APP模式下出现如下提示操作方法。

<img  style="width:100%"  class="mb-2" controls src="img/1543290621950142.png"></img>



五、相关问题解答
1：找不到USB调试

答：先到手机设置—关于本机—版本号—连续点击版本号 6 到 8 次即可激活手机于开发者选项，再返回上一层即可看到开发者选项了，然后进去开发者里面找到并打开USB调试。



2：安卓手机直连模式下，已经打开了UBS调试还是连接不上怎么办？

答：试下拔下手机接口重新插上，再关闭USB调试再打开，等待5-10秒。如果还是不行则实行APP模式连接。



3：安卓手机 USB 网络共享打不开怎么回事？

答：此时设备没有检测到手机，可更换数据线重新连接，或重启手机，也可试下先打开 USB 调式，再打开 USB 网络共享。



4：拔下数据线重新连接的时候电视突然卡住了一个画面不动了怎么办？

答：拔掉供电线重新连接。



5：手机投上去为什么画面是竖着的，无法全屏？

答：因电视与手机分辨率不同，所以电视不会全屏显示（如果手机支持横屏的，则可在电视上全屏显示，例如：5.5寸 苹果手机）。通过视频软件（爱奇艺、腾讯、优酷等）看视频时，横屏状态下，都可以全屏显示。



6：播放视频或者玩游戏的时候会有延迟怎么回事？

答：此情况和手机性能有关，播放一些高质量画面的视频也会导致卡顿，建议清理下手机缓存，降低画面质量，使用的线材尽量短些。



7：苹果手机无法连接。

答：首先连接好线材，转换器一定要供电，要保证电视的画面是直连模式下（黄色底纹在左边，如若不是，则按下换器上面的复位键进行调整）其次，可打开手机的镜像模式，打不开可重启手机试下，也可更换其他数据线测试。



8：安卓手机声音无法传输到电视。

答：由于手机系统权限不同，很多安卓手机声音传输不到转换器，只能手机播放声音。

APP模式下，可在APP软件里面进行播放手机本地音乐，这时声音可传输到转换器的 HDMI 接口和音频接口。



9：转换器上的3.5mm音频口外接了音响没有声音

答：此情况一般为安卓手机使用，安卓手机使用，部分手机直连模式下声音无法传输至转换器中，声音是从手机出来的，在声音没有传输到转换器上，此时转换器外接音响是无效的。如果手机没有声音，正常情况声音已经传输到转换器上了，那么可以检查下手机的音量键确认声音大小，也可再重启手机。



10：连接电视画面模糊（如：手机主页，视频、游戏等显示较模糊的现象）

答：如果手机显主页或打开的文档等显示字体模糊，则是跟手机分辨率有关，因显示器屏幕较大，所需求的分辨率要求会比手机的高，所以在相同分辨率的情况下，手机显示效果会比显示器清晰。

如果是通过视频软件看视频时模糊，可在视频上调整清晰度，如调整为：高清，超清，蓝光等等。同样的，玩游戏时可在游戏中将画质调整为更清晰的效果。'

),

('2','绿联手机投屏转换器固件升级方法','img/1547632018873392.png',
' 10359','2020-01-16 15:48:28','使用绿联手机投屏转换器US228进行投屏过程中，如果遇到系统障碍或者手机系统升级导致产品不能正常使用，可通过对产品进行固件升级来解决。
','使用绿联手机投屏转换器US228进行投屏过程中，如果遇到系统障碍或者手机系统升级导致产品不能正常使用，可通过对产品进行固件升级来解决。

在进行固件升级前请确保手机开机正常和移动网络正常开启，升级中请勿关机或者其它操作，以免造成升级失败（正常情况下不建议升级）。
<img  style="width:100%"  class="mb-2" controls src="img/1547632018873392.png"></img>


苹果设备固件升级
1、连接好设备后，使用回形针短按产品复位键切换到系统升级模式“AirPlay&setup”（如下图左下角位置），如已经是此模式则忽略此步骤。

<img  style="width:100%"  class="mb-2" controls src="img/1579161023899544.jpg"></img>

2、打开手机个人热点：“设置”→“蜂窝移动网络”→“个人热点”

<img  style="width:100%"  class="mb-2" controls src="img/1547632158882561.png"></img>

3、确认热点连接成功，如下图均为热点连接成功的提示，（系统版本不同的显示稍有不同，如热点未连接成功，在打开个人热点按钮后重启手机即可）

<img  style="width:100%"  class="mb-2" controls src="img/1579161008221715.png"></img>

4、经过前面步骤后，显示器右上角会弹出如图所示的数据线标识，表示产品与手机已建立连接。如此处显示×标识，说明未建立连接，请按前面步骤再次排查，直至建立连接。


<img  style="width:100%"  class="mb-2" controls src="img/1547632203728930.png"></img>

5、前往手机APP商店搜索“EZcast”下载并安装。



6、进入手机菜单打开“EZcast”，点击右上角数据线图标建立APP连接，再点击左上角横杠图标找到“设置”选项

<img  style="width:100%"  class="mb-2" controls src="img/1547632462925494.png"></img>

7、进入“设置”选项后，此时手机显示圆盘按按钮（如左下图），通过圆盘右方向键滑动选择显示器的“升级”项（如右下图），选中“升级”项后显示器会弹出新固件版本并提示是否要升级，选择“是”，再点击手机屏幕“OK”按扭进行固件升级，等待半分钟即可升级完成。

<img  style="width:100%"  class="mb-2" controls src="img/1547632401362928.png"></img>
8、升级完成后，用回形针短按复位键切回“Plug&Play mode”模式，即可同屏使用。

备注：如果遇见苹果设备无法升级的情况（如产品连接好后显示器没有显示主页），可以选择使用安卓设备升级后再使用。

安卓设备固件升级
安卓设备固件升级略有差异，操作为：

1、连接好设备后，下载APP“EZcast”并打开“USB共享网络”让设备与APP建立连接（此步骤参考安卓设备APP连接方法）

2、APP连接好后，在“EZcast”找到设置选项进入选择”升级“项进行升级（此步骤参考苹果固件升级方法第5、6步骤）

'),


('3','绿联VGA二进一出切换器使用教程丨MM126','img/1578554898.png',
' 275',' 2020-01-11 10:42:28','绿联VGA二进一出切换器可以让两台主机共用一个显示器，一键切换，方便快捷。

以下为绿联VGA二进一出切换器MM126的产品展示和操作方法，包含切换器连接电脑显示器的操作步骤和问题说明，希望对您了解VGA切换器有所帮助。

','绿联VGA二进一出切换器可以让两台主机共用一个显示器，一键切换，方便快捷。

以下为绿联VGA二进一出切换器MM126的产品展示和操作方法，包含切换器连接电脑显示器的操作步骤和问题说明，希望对您了解VGA切换器有所帮助。



<video  style="width:100%"  class="mb-2" controls src="img/30711.mp4"></video>'),

('4','绿联Type-C转hdmi/vga扩展坞使用教程丨CM179','img/1578555192.png',
' 505',' 2020-01-09 15:16:53','绿联Type-C转hdmi/vga扩展坞可以为笔记本的Type-C接口扩展出更多功能接口，让Type-C笔记本外接鼠标键盘，外接网线上网，移动办公更方便。
','绿联Type-C转hdmi/vga扩展坞可以为笔记本的Type-C接口扩展出更多功能接口，让Type-C笔记本外接鼠标键盘，外接网线上网，移动办公更方便。

以下为Type-C转hdmi/vga扩展坞的产品介绍和连接电脑电视操作教程，希望对您了解和使用笔记本Type-C转hdmi/vga扩展坞有所帮助。


<video  style="width:100%"  class="mb-2" controls src="img/40873.mp4"></video>'),

('5','	
绿联VGA分配器一分二高清视频转换器使用教程丨40254','img/1578554465.png',
' 505',' 2020-01-09 15:16:53','绿联Type-C转hdmi/vga扩展坞可以为笔记本的Type-C接口扩展出更多功能接口，让Type-C笔记本外接鼠标键盘，外接网线上网，移动办公更方便。
','绿联Type-C转hdmi/vga扩展坞可以为笔记本的Type-C接口扩展出更多功能接口，让Type-C笔记本外接鼠标键盘，外接网线上网，移动办公更方便。

以下为Type-C转hdmi/vga扩展坞的产品介绍和连接电脑电视操作教程，希望对您了解和使用笔记本Type-C转hdmi/vga扩展坞有所帮助。


<video  style="width:100%"  class="mb-2" controls src="img/40873.mp4"></video>');
