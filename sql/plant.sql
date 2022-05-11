/*
 Navicat Premium Data Transfer

 Source Server         : mysql_3306
 Source Server Type    : MySQL
 Source Server Version : 100421
 Source Host           : 127.0.0.1:3306
 Source Schema         : plant

 Target Server Type    : MySQL
 Target Server Version : 100421
 File Encoding         : 65001

 Date: 11/12/2021 15:27:33
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for pl_category
-- ----------------------------
DROP TABLE IF EXISTS `pl_category`;
CREATE TABLE `pl_category`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `cyno` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `cyname` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `remark` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 25 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of pl_category
-- ----------------------------
INSERT INTO `pl_category` VALUES (24, 'CYN-5264', '销售部', '发士大夫');
INSERT INTO `pl_category` VALUES (23, 'CYN-3798', '工程部', '发士大夫');

-- ----------------------------
-- Table structure for pl_che_wei
-- ----------------------------
DROP TABLE IF EXISTS `pl_che_wei`;
CREATE TABLE `pl_che_wei`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '维护车辆的名称',
  `time` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `weiname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `weiphone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `remark` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of pl_che_wei
-- ----------------------------
INSERT INTO `pl_che_wei` VALUES (1, '车车2', '2021-12-18', '345', '345', '3245234');

-- ----------------------------
-- Table structure for pl_department
-- ----------------------------
DROP TABLE IF EXISTS `pl_department`;
CREATE TABLE `pl_department`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '部门名称',
  `remark` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of pl_department
-- ----------------------------
INSERT INTO `pl_department` VALUES (2, 'qwe', '456');
INSERT INTO `pl_department` VALUES (3, '推推', '364563456');

-- ----------------------------
-- Table structure for pl_detail
-- ----------------------------
DROP TABLE IF EXISTS `pl_detail`;
CREATE TABLE `pl_detail`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `detail` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of pl_detail
-- ----------------------------
INSERT INTO `pl_detail` VALUES (5, '<p><span style=\"color: rgb(139, 170, 74);\">欢迎&nbsp; &nbsp;&nbsp;</span></p><p><span style=\"color: rgb(139, 170, 74);\">使用 <b>wangEditor</b> 富文本编辑器</span></p><p>fasdf&nbsp;</p>');
INSERT INTO `pl_detail` VALUES (6, '<p><span style=\"color: rgb(194, 79, 74);\">欢迎使用 <b>wangEditor</b> 富文本编辑器f asdf&nbsp;</span></p><p><br></p>');
INSERT INTO `pl_detail` VALUES (7, '<p>欢迎使用 <b>wangEditor</b> 富文本编辑器而且为人五七二权威人权为荣权威人情味人权为荣去微软去微软去微软去微软去微软去微软去微软去微软去微软</p><p><br></p>');

-- ----------------------------
-- Table structure for pl_device
-- ----------------------------
DROP TABLE IF EXISTS `pl_device`;
CREATE TABLE `pl_device`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '设备名称',
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '设备类别',
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '使用人',
  `jine` int NULL DEFAULT NULL COMMENT '设备金额',
  `isweihu` bit(1) NULL DEFAULT NULL COMMENT '是否维护',
  `remark` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of pl_device
-- ----------------------------
INSERT INTO `pl_device` VALUES (1, '推推', '发射点发射点', 'oppl', 100, b'0', '3456');
INSERT INTO `pl_device` VALUES (2, 'WangZhengHe', '发射点发射点', 'oppl', 900, b'0', '9090');

-- ----------------------------
-- Table structure for pl_device_type
-- ----------------------------
DROP TABLE IF EXISTS `pl_device_type`;
CREATE TABLE `pl_device_type`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '设备类别名称',
  `remark` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of pl_device_type
-- ----------------------------
INSERT INTO `pl_device_type` VALUES (1, '发射点发射点', '1234');

-- ----------------------------
-- Table structure for pl_device_wei
-- ----------------------------
DROP TABLE IF EXISTS `pl_device_wei`;
CREATE TABLE `pl_device_wei`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '维护的设备名称',
  `time` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '预计维护天数',
  `weiname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '维护人员',
  `weiphone` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '维护人员联系方式',
  `remark` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of pl_device_wei
-- ----------------------------
INSERT INTO `pl_device_wei` VALUES (15, 'WangZhengHe', '2021-12-10', '345', '345', '345');

-- ----------------------------
-- Table structure for pl_dynamicinfo
-- ----------------------------
DROP TABLE IF EXISTS `pl_dynamicinfo`;
CREATE TABLE `pl_dynamicinfo`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '动态ID',
  `plantno` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '植物编号',
  `basicstate` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '基本情况',
  `isill` bit(1) NULL DEFAULT NULL COMMENT '是否生病',
  `checktime` datetime NULL DEFAULT NULL COMMENT '检查时间',
  `checker` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '检查人',
  `ismove` bit(1) NULL DEFAULT NULL COMMENT '是否转移',
  `remark` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `longitude` double NULL DEFAULT NULL COMMENT '经度',
  `latitude` double NULL DEFAULT NULL COMMENT '纬度',
  `addr` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '详细地址',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 15 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of pl_dynamicinfo
-- ----------------------------
INSERT INTO `pl_dynamicinfo` VALUES (1, 'P005', '因天气问题，出现叶子脱落，变黄。', b'1', NULL, NULL, b'1', '观察1', 110.3666948905765, 29.19873345632509, '湖南省张家界市永定区G5515(张桑高速)');
INSERT INTO `pl_dynamicinfo` VALUES (2, 'P002', '因天气转冷，叶子冻伤', b'0', '2021-06-11 15:32:00', 'test', b'1', '请及时处理', 108.24328915526192, 22.84109515010259, '广西壮族自治区南宁市西乡塘区学海路');
INSERT INTO `pl_dynamicinfo` VALUES (3, 'P004', '叶开始脱落，部分出现枯干现状', b'0', '2017-11-15 15:56:21', 'admin', b'1', '再观察一、二天', NULL, NULL, NULL);
INSERT INTO `pl_dynamicinfo` VALUES (4, 'P005', '情况基本正常', b'1', '2019-10-27 13:31:46', 'admin', b'0', '情况基本正常', NULL, NULL, NULL);
INSERT INTO `pl_dynamicinfo` VALUES (6, '1', '1', b'1', '2021-06-09 16:40:53', '1', b'1', '1', 1, 1, '1');
INSERT INTO `pl_dynamicinfo` VALUES (7, 'P005', 'ddf', b'0', '2021-06-09 16:45:52', NULL, b'1', 'ffdaf', 108.24731356394526, 22.830103641155166, '广西壮族自治区南宁市江南区仁义路19号');
INSERT INTO `pl_dynamicinfo` VALUES (8, 'P001', 'fdas', b'1', '2021-06-09 16:46:58', NULL, b'0', 'fdafdas', 108.24580441068903, 22.85261862191812, '广西壮族自治区南宁市西乡塘区相思湖西路');
INSERT INTO `pl_dynamicinfo` VALUES (10, '1', '1', b'1', '2021-06-10 16:04:34', '1', b'1', '1', 1, 1, '1');
INSERT INTO `pl_dynamicinfo` VALUES (11, 'P005', 'dfdas', b'1', NULL, NULL, b'0', 'fdafdas', 108.244223392992, 22.840367410486177, '广西壮族自治区南宁市西乡塘区大学西路55-1号');
INSERT INTO `pl_dynamicinfo` VALUES (12, 'P003', '44', b'1', NULL, NULL, b'1', '4444', 108.24084576427559, 22.85522126188614, '广西壮族自治区南宁市西乡塘区相思湖北路辅路');
INSERT INTO `pl_dynamicinfo` VALUES (13, 'dd', '111', b'1', '2021-06-11 15:14:04', 'admin', b'1', '21212', 108.26905914781705, 22.836934864210026, '广西壮族自治区南宁市西乡塘区陈东路');
INSERT INTO `pl_dynamicinfo` VALUES (14, '1', '对多111dsd', b'0', '2021-06-11 15:27:48', 'test', b'0', '少时诵诗书所0', 108.20844371386356, 22.899388253250137, '广西壮族自治区南宁市西乡塘区');

-- ----------------------------
-- Table structure for pl_genus
-- ----------------------------
DROP TABLE IF EXISTS `pl_genus`;
CREATE TABLE `pl_genus`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '属类ID',
  `gsno` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '属类编号',
  `gsname` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '属类名称',
  `cyno` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '所属科类',
  `remark` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 34 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of pl_genus
-- ----------------------------
INSERT INTO `pl_genus` VALUES (33, 'GSN-8640', '车车2', 'CYN-5264', '发射点发顺丰');
INSERT INTO `pl_genus` VALUES (32, 'GSN-6214', '车车1', 'CYN-3798', '啊手动阀');

-- ----------------------------
-- Table structure for pl_logistics
-- ----------------------------
DROP TABLE IF EXISTS `pl_logistics`;
CREATE TABLE `pl_logistics`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '物流名称',
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '物流类别',
  `gotos` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '物流去向',
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '负责人',
  `userphone` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '负责人电话',
  `remark` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of pl_logistics
-- ----------------------------
INSERT INTO `pl_logistics` VALUES (4, 'B-4菠萝', '顺丰快递', '广西壮族自治区 南宁市 良庆区', 'admin', '12345678900', '12312312312312312321231');

-- ----------------------------
-- Table structure for pl_logistics_gotos
-- ----------------------------
DROP TABLE IF EXISTS `pl_logistics_gotos`;
CREATE TABLE `pl_logistics_gotos`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '物流地址名称',
  `carname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '物流配送车辆',
  `peiname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '配送人员姓名',
  `peiphone` int NULL DEFAULT NULL COMMENT '配送人员联系方式',
  `time` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '预计送达时间',
  `remark` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of pl_logistics_gotos
-- ----------------------------
INSERT INTO `pl_logistics_gotos` VALUES (1, '北京市 北京市 东城区', '车车2', '2134', 1234, '2021-12-10', '9090');
INSERT INTO `pl_logistics_gotos` VALUES (2, '新疆维吾尔自治区 巴音郭楞蒙古自治州 焉耆回族自治县', '车车1', '2134', 1234, '2021-12-10', '9090');
INSERT INTO `pl_logistics_gotos` VALUES (3, '青海省 西宁市 城东区', '车车2', '1234', 1324, '2021-12-18', '9090');
INSERT INTO `pl_logistics_gotos` VALUES (5, '广西壮族自治区 南宁市 良庆区', '车车2', '1234', 1234, '2021-12-14', '9090');

-- ----------------------------
-- Table structure for pl_logistics_type
-- ----------------------------
DROP TABLE IF EXISTS `pl_logistics_type`;
CREATE TABLE `pl_logistics_type`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '物流类型名称',
  `remark` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of pl_logistics_type
-- ----------------------------
INSERT INTO `pl_logistics_type` VALUES (1, 'cat/index', '3456');
INSERT INTO `pl_logistics_type` VALUES (2, '1234', '456');
INSERT INTO `pl_logistics_type` VALUES (3, '顺丰快递', '345');

-- ----------------------------
-- Table structure for pl_plantinfo
-- ----------------------------
DROP TABLE IF EXISTS `pl_plantinfo`;
CREATE TABLE `pl_plantinfo`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '植物ID',
  `plantno` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '植物编号',
  `plantname` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '植物名称',
  `plantalias` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '植物别名',
  `latiname` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '植物拉丁名',
  `gsno` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '属类编号',
  `morchar` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '形态特征',
  `prodarea` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '产地分布',
  `ecolhabit` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生态习性',
  `gardenuse` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用途',
  `imagepath` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '植物图片路径',
  `dimencode` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '二维码',
  `addtime` datetime NULL DEFAULT NULL COMMENT '添加时间',
  `modtime` datetime NULL DEFAULT NULL COMMENT '修改时间',
  `username` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发布者',
  `isstate` bit(1) NULL DEFAULT NULL COMMENT '是否发布',
  `remark` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 32 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of pl_plantinfo
-- ----------------------------
INSERT INTO `pl_plantinfo` VALUES (1, 'P001', '荷花', '莲花、水芙蓉', 'Nelumbo nucifera Gaertn.', 'GSN-6386', '多年生水生植物。根茎（藕）肥大多节，横生于水底泥中。叶盾状圆形，表面深绿色，被蜡质白粉覆盖，背面灰绿色，全缘并呈波状。叶柄圆柱形，密生小刺。花单生于花梗顶端、高托水面之上，有单瓣、复瓣、重瓣及重台等花型；花色有白、粉、深红、淡紫色或间色等变化；雄蕊多数；雌蕊离生，埋藏于倒圆锥状海绵质花托内，花托表面具多数散生蜂窝状孔洞，受精后逐渐膨大称为莲蓬，每一孔洞内生一小坚果（莲子）。花期6～9月，每日晨开暮闭。果熟期9～10月。', '原产亚热带、温带地区以及大洋洲，中国早在三千多年前即有栽培，现今在辽宁及浙江均发现过碳化的古莲子，可见其历史之悠久。 ', '荷花喜湿怕干，喜相对稳定的静水；对光照要求高，在强光下生长快，开花早。', '荷花花大色艳，清香四溢，清波翠盖，赏心悦目。它中通外直，不蔓不枝，迎骄阳而不惧，出污泥而不染。为欣赏荷花品种的风采，在池塘中依水域外貌建成若干大小不等、形状各异的种植槽，分别种植不同品种，花时戏白相映，争荣竞秀。小型池塘水景，主植茶花，缀以矶石，配植其他水生植物，尤具野趣。荷花又宜缸植、盆栽，可用于布置庭院和阳台。', '/upload/1.jpg', NULL, '2021-10-10 17:14:10', '2021-10-12 09:36:52', NULL, b'1', '测试');
INSERT INTO `pl_plantinfo` VALUES (2, 'P002', '睡莲', '子午莲', 'Nymphaea tetragona Georgi', 'GSN-9093', '多年生水生花卉；根状茎平卧，浸生于沃泥中；叶常浮水，绿色，叶纸质或近革质，基部具深湾缺，盾状或心形，芽时内卷；花常两性，辐射对称，浮于水面或突出水面；萼片通常4；花瓣少数或多数；坚果或浆果。花期5月中旬至9月；果期7～10月。', '广布于温带与热带地区，我国各省均有。', '睡莲喜强光，通风良好，所以睡莲在晚上花朵会闭合，到早上又会张开。在岸边有树荫的池塘，虽能开花，但生长较弱。对土质要求不严，pH值6～8情况下均生长正常，但喜富含有机质的壤土。生于池沼、湖泊中，一些公园的水池中常有栽培。', '睡莲是花、叶俱美的观赏植物。古希腊、罗马最初敬为女神供奉，16世纪意大利的公园多用来装饰喷泉池或点缀厅堂外景。现欧美园林中选用睡莲作水景主题材料极为普遍。我国在2000年前汉代私家园林中，已有应用，如博陆侯霍光园中的五色睡莲池。', '/upload/2.jpg,/upload/202110120936457.jpg,/upload/2021101209364510.jpg,/upload/202110120936458.jpg,/upload/202110120936459.jpg', NULL, '2017-11-07 11:52:16', '2021-10-12 09:36:46', 'admin', b'1', '测试');
INSERT INTO `pl_plantinfo` VALUES (3, 'P003', '王莲', '王莲', 'Victoria amazonica Sowerby', 'GSN-9871', '王莲是水生有花植物中叶片最大的植物，其初生叶呈针状，长至2～3片时矛状，4～5片时呈戟形，6～7片叶时完全展开呈椭圆形至圆形，到11片叶后叶缘上翘呈盘状，叶缘直立，叶片圆形，像圆盘浮在水面，叶面光滑，绿色略带微红，有皱褶，背面紫红色，叶柄绿色，长2～4m，叶背面和叶柄有许多坚硬的剌，叶脉为放射网状。由于其叶片和叶脉内具有很多大的空腔，腔内充满气体，使叶片浮于水面。叶子背面生长着粗壮的叶脉，板状隆起，纵横交错构成一个一个的高10cm      16-1-3 王莲\n以上的方形小格，有利于保持叶片开展性，增加叶片的排水力和负载力。王莲的花很大，单生叶腋，有4片绿褐色的萼片，呈卵状三角形，外面全部长有刺；花瓣数目很多，呈倒卵形，雄蕊多数，花丝扁平；子房下部长着密密麻麻的粗刺。花期为夏或秋季，傍晚伸出水面开放，甚芳香，第一天白色，有白兰花香气，次日逐渐闭合，傍晚再次开放，花瓣变为淡红色至深红色，第3天闭合并沉入水中。浆果呈球形，种子黑色，9月前后结果。', '原产南美洲热带水域，自生于河湾、湖畔水域。现已引种到世界各地大植物园和公园。中国从上世纪50年代开相继从世界引种，在中国科学院植物研究所北京植物园、西安植物园三种王莲夏天相继开放。', '喜高温高湿，耐寒力极差，气温下降到20℃时，生长停滞。气温下降到14℃左右时有冷害，气温下降到8℃左右，受寒死亡。', '王莲以巨大厅物的盘叶和美丽浓香的花朵而著称。观叶期150天，观花期90天，若将王莲与荷花、睡莲等水生植物搭配布置，将形成一个完美、独特的水体景观，让人难以忘怀。现代园林水景中必不可少的观赏植物，也是城市花卉展览中必备的珍贵花卉，既具很有高的观赏价值，又能净化水体。家庭中的小型水池同样可以配植大型单株具多个叶盘，孤植于小水体效果好。', '/upload/3.jpg,/upload/2021101209363412.jpg,/upload/2021101209363414.jpg,/upload/2021101209363411.jpg,/upload/2021101209363413.jpg', NULL, '2017-11-15 15:51:13', '2021-10-12 09:36:35', 'admin', b'1', '');
INSERT INTO `pl_plantinfo` VALUES (4, 'P005', '香蒲', '蒲草', 'Typha orientalis Presl.', 'CYN-4188', '多年生水生或沼生草本。根状茎乳白色。地上茎粗壮，向上渐细。叶片光滑无毛，上部扁平，下部腹面微凹，背面逐渐隆起呈凸形，横切面呈半圆形，细胞间隙大，海绵状；叶鞘抱茎。雌雄花序紧密连接；雄花序轴具白色弯曲柔毛，自基部向上具1～3枚叶状苞片，花后脱落；雌花序基部具1枚叶状苞片，花后脱落；雄花通常由3枚雄蕊组成，有时2枚，或4枚雄蕊合生，花药2室，条形，花粉粒单体，花丝很短，基部合生成短柄；雌花无小苞片；孕性雌花柱头匙形，外弯，花柱子房纺锤形至披针形，子房柄细弱，长香蒲；不孕雌花子房近于圆锥形，先端呈圆形，不发育柱头宿存；白色丝状毛通常单生，有时几枚基部合生，稍长于花柱，短于柱头。小坚果椭圆形至长椭圆形；果皮具长形褐色斑点。种子褐色，微弯。花期6～7月，果期7～8月。', '分布于华北、东北、华东地区及陕西、湖南、广东、云南、海南等省区。菲律宾、原苏联及大洋洲等。', '生于池塘、河滩、渠旁、潮湿多水处，常成丛、成片生长。喜温暖湿润气候及潮湿环境。对土壤要求不严，以含丰富有机质的塘泥最好，较耐寒。以选择向阳、肥沃的池塘边或浅水处栽培为宜。', '叶片挺拔，花序粗壮、奇特、常栽培观赏，用于点缀园林水池、湖畔。叶片、花序可用作切花材料。此外，嫩芽为有名的水生蔬菜“蒲菜”，味鲜美。叶称蒲草，可用于编织，花粉入药称蒲黄。', '/upload/202110101707121.jpg,/upload/202110120936586.jpg,/upload/202110120936587.jpg,/upload/202110120936585.jpg,/upload/202110120936588.jpg', NULL, '2021-10-10 17:14:13', '2021-10-12 09:37:04', NULL, b'1', '00000');
INSERT INTO `pl_plantinfo` VALUES (5, 'P006', '黄菖蒲', '水烛、黄鸢尾', 'Iris pseudacorus L.', 'GSN-9148', '多年生水生草本，具粗壮根状茎，黄褐色；须根黄白色。基生叶灰绿色，宽剑形，顶端渐尖，基部鞘状，中脉较明显。花茎粗壮，上部分枝，茎生叶比基生叶短而窄；苞片3～4枚，绿色，披针形，顶端渐尖；花黄色。外花被裂片卵圆形或倒卵形，蒴果长形。内有种子多数，种子褐色，有棱角。花期5月;果期6～8月。', '原产欧洲，现在世界各地都有引种。我国各地。引种栽培，喜生于河湖沿岸的湿地或沼泽地上。 ', '喜光，也较耐阴，在半阴环境下也可正常生长；耐旱、叶耐湿，沙壤土及黏土都能生长，在水边栽植生长更好；耐寒性强。', '叶片碧绿青翠，花色黄艳，且大型，花姿秀美，极富情趣，如金蝶飞舞于花丛中，观赏价值极高。是庭园中的重要花卉之一。适应范围广泛，可布置于园林中的池畔河边的水派处或浅水区，既可观叶，亦可观花，是观赏价值很高的水生植物。如点缀在水边的石旁岩边，清新自然。也是优美的盆花、切花和花坛用花。', '/upload/5.jpg,/upload/202110120936094.jpg,/upload/202110120936092.jpg,/upload/202110120936093.jpg,/upload/202110120936091.jpg', NULL, '2021-10-10 17:14:16', '2021-10-12 09:36:13', NULL, b'1', '111');

-- ----------------------------
-- Table structure for pl_student
-- ----------------------------
DROP TABLE IF EXISTS `pl_student`;
CREATE TABLE `pl_student`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `age` int NULL DEFAULT NULL,
  `classes` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `cert` varchar(18) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `adress` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of pl_student
-- ----------------------------
INSERT INTO `pl_student` VALUES (1, '黄华全', 20, '计算机2019-2班', '123456789123456789', '广西钦州');

-- ----------------------------
-- Table structure for pl_userinfo
-- ----------------------------
DROP TABLE IF EXISTS `pl_userinfo`;
CREATE TABLE `pl_userinfo`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `usex` bit(1) NULL DEFAULT NULL,
  `unitauth` varchar(12) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `isactive` bit(1) NULL DEFAULT NULL,
  `addtime` datetime NULL DEFAULT NULL,
  `modtime` datetime NULL DEFAULT NULL,
  `remark` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `role` int NULL DEFAULT NULL COMMENT '角色',
  `department` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '部门',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 64 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of pl_userinfo
-- ----------------------------
INSERT INTO `pl_userinfo` VALUES (1, 'admin', '123', b'1', 'U001', b'1', '2017-09-14 16:31:17', '2021-12-18 00:00:00', '超级管理员', 1, '推推');
INSERT INTO `pl_userinfo` VALUES (61, 'oppl', '123', b'0', 'U002', b'1', '2021-12-09 00:00:00', '2021-12-09 00:00:00', '', 1, 'qwe');

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES (1, '超级用户');
INSERT INTO `role` VALUES (2, '普通用户');

-- ----------------------------
-- Table structure for role_treemenu
-- ----------------------------
DROP TABLE IF EXISTS `role_treemenu`;
CREATE TABLE `role_treemenu`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'id',
  `rid` int NULL DEFAULT NULL COMMENT '角色ID',
  `tid` int NULL DEFAULT NULL COMMENT '菜单ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 130 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of role_treemenu
-- ----------------------------
INSERT INTO `role_treemenu` VALUES (112, 1, 1);
INSERT INTO `role_treemenu` VALUES (113, 1, 2);
INSERT INTO `role_treemenu` VALUES (114, 1, 3);
INSERT INTO `role_treemenu` VALUES (115, 1, 4);
INSERT INTO `role_treemenu` VALUES (116, 1, 5);
INSERT INTO `role_treemenu` VALUES (117, 1, 6);
INSERT INTO `role_treemenu` VALUES (118, 1, 7);
INSERT INTO `role_treemenu` VALUES (119, 1, 8);
INSERT INTO `role_treemenu` VALUES (120, 1, 9);
INSERT INTO `role_treemenu` VALUES (121, 1, 10);
INSERT INTO `role_treemenu` VALUES (122, 1, 11);
INSERT INTO `role_treemenu` VALUES (123, 1, 12);
INSERT INTO `role_treemenu` VALUES (124, 1, 13);
INSERT INTO `role_treemenu` VALUES (125, 1, 14);
INSERT INTO `role_treemenu` VALUES (126, 1, 15);
INSERT INTO `role_treemenu` VALUES (127, 1, 16);
INSERT INTO `role_treemenu` VALUES (128, 1, 17);
INSERT INTO `role_treemenu` VALUES (129, 1, 18);

-- ----------------------------
-- Table structure for treemenu
-- ----------------------------
DROP TABLE IF EXISTS `treemenu`;
CREATE TABLE `treemenu`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'id',
  `pid` int NULL DEFAULT NULL COMMENT '菜单ID',
  `name` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单名称',
  `icon` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单图标',
  `url` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单的链接地址',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of treemenu
-- ----------------------------
INSERT INTO `treemenu` VALUES (1, -1, '部门管理', 'fa fa-institution', '');
INSERT INTO `treemenu` VALUES (2, 1, '部门信息', 'fa fa-institution', 'plant/department.jsp');
INSERT INTO `treemenu` VALUES (3, -1, '员工管理', 'fa fa-institution', NULL);
INSERT INTO `treemenu` VALUES (4, 3, '员工信息', 'fa fa-institution', 'plant/userinfo.jsp');
INSERT INTO `treemenu` VALUES (5, -1, '物流管理', 'fa fa-institution', NULL);
INSERT INTO `treemenu` VALUES (6, 5, '物流信息', 'fa fa-institution', 'plant/logistics.jsp');
INSERT INTO `treemenu` VALUES (7, 5, '物流类别', 'fa fa-institution', 'plant/logisticsType.jsp');
INSERT INTO `treemenu` VALUES (8, 5, '物流去向', 'fa fa-institution', 'plant/logisticsGotos.jsp');
INSERT INTO `treemenu` VALUES (9, -1, '设备管理', 'fa fa-institution', NULL);
INSERT INTO `treemenu` VALUES (10, 9, '设备信息', 'fa fa-institution', 'plant/device.jsp');
INSERT INTO `treemenu` VALUES (11, 9, '设备类别', 'fa fa-institution', 'plant/deviceType.jsp');
INSERT INTO `treemenu` VALUES (12, 9, '设备维护', 'fa fa-institution', 'plant/deviceWei.jsp');
INSERT INTO `treemenu` VALUES (13, -1, '车辆管理', 'fa fa-institution', NULL);
INSERT INTO `treemenu` VALUES (14, 13, '车辆信息', 'fa fa-institution', 'plant/genusinfo.jsp');
INSERT INTO `treemenu` VALUES (15, 13, '车辆类别', 'fa fa-institution', 'plant/categoryinfo.jsp');
INSERT INTO `treemenu` VALUES (16, -1, '公告管理', 'fa fa-institution', '');
INSERT INTO `treemenu` VALUES (17, 16, '公告信息', 'fa fa-institution', 'plant/detail.jsp');
INSERT INTO `treemenu` VALUES (18, 13, '车辆维护', 'fa fa-institution', 'plant/cheWei.jsp');

SET FOREIGN_KEY_CHECKS = 1;
