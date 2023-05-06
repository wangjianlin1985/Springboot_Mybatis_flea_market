/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 50620
 Source Host           : localhost:3306
 Source Schema         : springboot_base

 Target Server Type    : MySQL
 Target Server Version : 50620
 File Encoding         : 65001

 Date: 22/10/2020 17:05:11
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category`  (
  `id` int(6) NOT NULL AUTO_INCREMENT COMMENT '商品分类id',
  `name` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '分类名称',
  `parent_id` int(6) NULL DEFAULT NULL COMMENT '分类的父类',
  `icon` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '分类的图标',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '添加分类的时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `df5d5fdfd`(`parent_id`) USING BTREE,
  CONSTRAINT `df5d5fdfd` FOREIGN KEY (`parent_id`) REFERENCES `category` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 36 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES (4, '手机', NULL, '20200707/1594113461366.png', '2020-07-07 17:14:48');
INSERT INTO `category` VALUES (6, '电脑', NULL, '20200707/1594133952528.png', '2020-07-07 18:19:39');
INSERT INTO `category` VALUES (11, '衣物', NULL, '20200707/1594134041264.png', '2020-07-07 21:23:53');
INSERT INTO `category` VALUES (12, '运动健身', NULL, '20200707/1594134057587.png', '2020-07-07 21:26:31');
INSERT INTO `category` VALUES (15, '书本教材', NULL, '20200708/1594212103621.png', '2020-07-08 20:42:01');
INSERT INTO `category` VALUES (16, '手机配件', 4, '20200708/1594212695760.png', '2020-07-08 20:51:44');
INSERT INTO `category` VALUES (17, '骑行运动', NULL, '20200708/1594212918779.png', '2020-07-08 20:55:28');
INSERT INTO `category` VALUES (18, '智能数码', NULL, '20200708/1594213158315.png', '2020-07-08 20:59:28');
INSERT INTO `category` VALUES (19, '手机耳机', 4, '20200708/1594213325773.png', '2020-07-08 21:02:13');
INSERT INTO `category` VALUES (20, '教材教辅', 15, '20200708/1594213403268.png', '2020-07-08 21:03:40');
INSERT INTO `category` VALUES (21, '鞋子', 11, '20200708/1594213530117.png', '2020-07-08 21:05:42');
INSERT INTO `category` VALUES (22, '平板电脑', 6, '20200708/1594213786514.png', '2020-07-08 21:10:21');
INSERT INTO `category` VALUES (23, '台式机', 6, '20200708/1594213838670.png', '2020-07-08 21:10:49');
INSERT INTO `category` VALUES (24, '笔记本', 6, '20200708/1594213868424.png', '2020-07-08 21:11:15');
INSERT INTO `category` VALUES (25, '智能手环', 18, '20200708/1594214006358.png', '2020-07-08 21:13:36');
INSERT INTO `category` VALUES (26, '智能相机', 18, '20200708/1594214037129.png', '2020-07-08 21:14:07');
INSERT INTO `category` VALUES (27, '篮球', 12, '20200708/1594214136458.png', '2020-07-08 21:15:43');
INSERT INTO `category` VALUES (28, '自行车', 17, '20200708/1594214325196.png', '2020-07-08 21:18:56');
INSERT INTO `category` VALUES (29, '平行车', 17, '20200708/1594214376300.png', '2020-07-08 21:19:48');
INSERT INTO `category` VALUES (30, '手表', 18, '20200708/1594214424222.png', '2020-07-08 21:20:36');
INSERT INTO `category` VALUES (31, '足球', 12, '20200708/1594214444671.png', '2020-07-08 21:20:52');
INSERT INTO `category` VALUES (32, '电子教材', 15, '20200708/1594214502767.png', '2020-07-08 21:21:53');
INSERT INTO `category` VALUES (33, '羽毛球拍', 12, '20200708/1594214595349.png', '2020-07-08 21:23:27');
INSERT INTO `category` VALUES (34, 'IOS系统手机', 4, '20200714/1594718251783.png', '2020-07-14 17:17:59');
INSERT INTO `category` VALUES (35, 'Android系统手机', 4, '20200714/1594718350973.png', '2020-07-14 17:19:24');

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment`  (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `student_id` int(8) NOT NULL,
  `good_id` int(8) NOT NULL,
  `create_time` datetime(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `ds4fsf2s2f`(`student_id`) USING BTREE,
  INDEX `sdsa4dsa4d5s5d5`(`good_id`) USING BTREE,
  CONSTRAINT `ds4fsf2s2f` FOREIGN KEY (`student_id`) REFERENCES `student` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `sdsa4dsa4d5s5d5` FOREIGN KEY (`good_id`) REFERENCES `good` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES (4, '这个相机好不好用', 2, 19, '2020-07-22 15:26:07');
INSERT INTO `comment` VALUES (5, '回复：“这个相机好不好用”<br>好用的呢', 1, 19, '2020-07-22 15:32:39');
INSERT INTO `comment` VALUES (7, '这对鞋几成新', 1, 12, '2020-07-23 10:38:33');
INSERT INTO `comment` VALUES (8, '我想要这个手机。。。', 1, 5, '2020-10-22 15:39:42');
INSERT INTO `comment` VALUES (9, '卖家最多多少出呢？', 1, 5, '2020-10-22 15:39:57');

-- ----------------------------
-- Table structure for good
-- ----------------------------
DROP TABLE IF EXISTS `good`;
CREATE TABLE `good`  (
  `id` int(12) NOT NULL AUTO_INCREMENT COMMENT '商品id',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品名称',
  `describle` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品描述',
  `price` float(10, 0) NOT NULL COMMENT '商品价格',
  `photo` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品图片',
  `status` int(1) NOT NULL DEFAULT 1 COMMENT '商品状态',
  `category_id` int(6) NOT NULL COMMENT '商品所属分类',
  `student_id` int(24) NOT NULL COMMENT '商品所属学生',
  `view_number` int(10) NOT NULL DEFAULT 0 COMMENT '商品浏览次数',
  `create_time` datetime(0) NOT NULL COMMENT '商品添加时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fds21fsd51f2sd1fd`(`category_id`) USING BTREE,
  INDEX `sdsada88s4af64f56`(`student_id`) USING BTREE,
  CONSTRAINT `fds21fsd51f2sd1fd` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `sdsada88s4af64f56` FOREIGN KEY (`student_id`) REFERENCES `student` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of good
-- ----------------------------
INSERT INTO `good` VALUES (2, '新款AirPods pro3代无线降噪蓝牙耳机', '做工质感：优质的材质，握在手里有圆润感。美观漂亮。\r\n音质音效：低音丰满，中频有力，高音较清脆。\r\n舒适度：佩戴舒适，比一代还小一点。入耳很紧密，更不容易掉下来。', 800, '20200714/1594729714159.jpg', 1, 19, 1, 12, '2020-07-13 15:21:33');
INSERT INTO `good` VALUES (3, 'Spring Boot编程思想 核心篇 小马哥 SpringBoot开发 JavaEE开发微服务技术', '《Spring Boot编程思想（核心篇）》的讨论以Spring Boot为中心，议题发散至Spring技术栈、JSR及Java。希望透过全局的视角，帮助读者了解Spring Boot变迁的历程；经过多方的比较，帮助读者理解Spring Boot特性的原理；整合标准的规范，帮助读者掌握Spring Boot设计的哲学。', 15, '20200714/1594730546215.jpg', 3, 20, 1, 12, '2020-07-14 11:05:43');
INSERT INTO `good` VALUES (4, 'Apple iPhone 11  全网通 黑色 256G', '手跟新手机一模一样！电池容量百分百，电池续航能力强，没有划伤,手机用起来很流畅.', 3500, '20200714/1594711855970.png', 1, 34, 3, 8, '2020-07-14 15:31:14');
INSERT INTO `good` VALUES (5, 'iPhone x 4G全网通 256G', ' 95新屏幕只有轻微划痕并不明显,外表特别新,电池容量87%，运行速度真的比安卓快太多了，拍照也很清晰. ', 2300, '20200714/1594741314277.jpg', 1, 34, 3, 6, '2020-07-14 23:41:56');
INSERT INTO `good` VALUES (6, 'HUAWEI P40 Pro 5G手机麒麟990 四摄50倍变焦曲面屏', '拍照效果：清晰 电池续航：好 通信音质：很好 运行速度：快 玩游戏很顺畅 显示效果：美美哒', 4000, '20200714/1594741643206.jpg', 1, 35, 3, 3, '2020-07-14 23:47:27');
INSERT INTO `good` VALUES (7, 'nike耐克篮球正品男子7号球水泥地室内外耐磨限量版训练比赛球', '篮球很标准，弹力和重量都比较合适，外观很漂亮', 55, '20200714/1594741761460.jpg', 1, 27, 3, 5, '2020-07-14 23:49:26');
INSERT INTO `good` VALUES (8, '华为/HUAWEI WATCH GT 2e 专业智能手表手环运动 血氧监测 46MM', '质量挺好，外观亮丽时尚，安装很方便，功能很多也很强大手表质感也不错，屏幕清晰，表盘大气，比较中性，男女佩戴都合适', 500, '20200714/1594742022828.jpg', 1, 25, 2, 4, '2020-07-14 23:53:45');
INSERT INTO `good` VALUES (9, 'Apple Watch5 Series5', '表盘可以语音报时特别好玩 续航能力：一天吧 触控效果：非常棒。灵敏度级高', 1300, '20200714/1594742200101.jpg', 1, 30, 2, 1, '2020-07-14 23:57:41');
INSERT INTO `good` VALUES (10, 'ALIENWARE外星人m15 2020版R3十代酷睿i7游戏轻薄2070笔记本电脑15.6英寸', '笔记本很好用，键盘很舒服，氛围灯效果炸裂，开机按钮炫酷,没卡顿现象,性能很强很快.', 15000, '20200715/1594742528868.jpg', 1, 24, 2, 33, '2020-07-15 00:02:11');
INSERT INTO `good` VALUES (11, 'Huawei/华为MatePad Pro平板电脑二合一新品全面屏影音娱乐商务无线充电 128G', '外观材质：窄边框，非常好看，手感很好 显卡效果：清晰，还有护眼 电脑性能：流畅，和华为手机一起用很配', 2000, '20200715/1594742742029.jpg', 1, 22, 2, 1, '2020-07-15 00:05:44');
INSERT INTO `good` VALUES (12, 'NIKE SB BLAZER MID耐克解构 拆线大钩子双舌中帮板鞋CI3833-100', '鞋子是正品,颜值好,穿起来帅哒哒!', 800, '20200715/1594743058044.jpg', 1, 21, 2, 17, '2020-07-15 00:12:13');
INSERT INTO `good` VALUES (13, '小米九号平衡车体感智能骑行遥控漂移代步电动九号平衡车超长续航', '小米9号平衡车是外观最好看，质量最可靠，稳定性最好的平衡车', 1300, '20200715/1594743303031.jpg', 1, 29, 2, 0, '2020-07-15 00:15:21');
INSERT INTO `good` VALUES (14, '上海永久牌山地自行车男变速成年女式轻便单车学生双减震越野赛车', '刹车性能：非常好！ 减震效果：非常好！质量很好!', 200, '20200715/1594743455124.jpg', 1, 28, 2, 1, '2020-07-15 00:18:34');
INSERT INTO `good` VALUES (15, '星火英语四级考试真题备考2020年9月试卷全套资料模拟大学cet4历年真题 词汇听力阅读翻译写作单词', '适合四级考试准备 内容阅读感受：每本册子都很有用 色彩情况：无色 印刷质量：印刷还可以。没有缺印漏印，无重影 纸张品质：纸质还行。', 15, '20200715/1594743767790.jpg', 1, 20, 2, 6, '2020-07-15 00:23:08');
INSERT INTO `good` VALUES (16, '四六级英语视频CET-4CET-6电子版视频备战46级英语考试大全资料', '电子版资料统一网盘发货。', 8, '20200715/1594744015742.jpg', 1, 32, 2, 11, '2020-07-15 00:27:50');
INSERT INTO `good` VALUES (17, '联想异能者DIY-TMB台式组装电脑锐龙R5 3600/GTX1660S/8G/ 512G ', '性价比很高，最主要的是有联想售后和正版Windows系统，比自己组装有保障多了,启动很快稳定在9秒，各个软件运行也跟迅速，测试CPU速度也稳定，温度游戏玩了很久也还正常；', 4000, '20200715/1594744203720.jpg', 1, 23, 2, 23, '2020-07-15 00:31:04');
INSERT INTO `good` VALUES (18, 'Sony/索尼 A6400L16-50镜头a6300高清微单反高清数码相机A6100', '相机特别得好，像素特别清晰，非常适合女生使用，而且非常的轻拍照再也不怕拿到手软了,相机是混合自动对焦系统，425个相位检测对焦点结合了传统的425个反差检测对焦点。相位检测对焦点覆盖了影像区域的84%。对焦太快，太好用了,', 3500, '20200715/1594744380775.jpg', 1, 26, 3, 41, '2020-07-15 00:34:18');
INSERT INTO `good` VALUES (19, '尼康D5300 D3400 18-55套机 入门级旅游 高清数码 单反相机D3500', '性价比很高～镜头背景虚化不错！真的很不错。功能齐全，用起来也很方便。比手机拍的好看多了.', 750, '20200715/1594744553375.jpg', 1, 26, 3, 35, '2020-07-15 00:36:11');

-- ----------------------------
-- Table structure for log
-- ----------------------------
DROP TABLE IF EXISTS `log`;
CREATE TABLE `log`  (
  `id` int(12) NOT NULL AUTO_INCREMENT COMMENT '日志id',
  `operator` varchar(18) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '日志操作者',
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '日志内容',
  `create_time` datetime(0) NOT NULL COMMENT '日志生成时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 308 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of log
-- ----------------------------
INSERT INTO `log` VALUES (37, 'zs', '【zs】用户在2020-07-05 22:37:15登录系统!', '2020-07-05 22:37:15');
INSERT INTO `log` VALUES (38, 'zs', '【zs】用户在2020-07-05 22:41:25登录系统!', '2020-07-05 22:41:25');
INSERT INTO `log` VALUES (39, 'zs', '【zs】用户在2020-07-05 22:44:31登录系统!', '2020-07-05 22:44:31');
INSERT INTO `log` VALUES (40, 'zs', '【zs】用户在2020-07-05 22:46:08登录系统!', '2020-07-05 22:46:08');
INSERT INTO `log` VALUES (41, 'zs', '【zs】用户在2020-07-05 22:48:30登录系统!', '2020-07-05 22:48:30');
INSERT INTO `log` VALUES (42, 'zs', '【zs】用户在2020-07-05 23:22:05登录系统!', '2020-07-05 23:22:05');
INSERT INTO `log` VALUES (43, 'zs', '【zs】用户在2020-07-06 15:07:55登录系统!', '2020-07-06 15:07:55');
INSERT INTO `log` VALUES (44, 'zs', '【zs】用户在2020-07-06 15:08:35登录系统!', '2020-07-06 15:08:35');
INSERT INTO `log` VALUES (45, '小明', '【小明】用户在2020-07-06 15:09:10登录系统!', '2020-07-06 15:09:10');
INSERT INTO `log` VALUES (46, 'zs', '【zs】用户在2020-07-06 16:06:13登录系统!', '2020-07-06 16:06:13');
INSERT INTO `log` VALUES (47, 'zs', '【zs】用户在2020-07-06 22:27:31登录系统!', '2020-07-06 22:27:31');
INSERT INTO `log` VALUES (48, 'zs', '添加菜单,菜单名为:商品管理', '2020-07-06 22:35:21');
INSERT INTO `log` VALUES (49, 'zs', '更新权限,权限名为:超级管理员', '2020-07-06 22:36:03');
INSERT INTO `log` VALUES (50, 'zs', '更新菜单,菜单名为:商品设置', '2020-07-06 22:37:08');
INSERT INTO `log` VALUES (51, 'zs', '添加菜单,菜单名为:分类管理', '2020-07-06 22:40:43');
INSERT INTO `log` VALUES (52, 'zs', '更新权限,权限名为:超级管理员', '2020-07-06 22:40:56');
INSERT INTO `log` VALUES (53, 'zs', '添加菜单,菜单名为:添加', '2020-07-06 22:45:10');
INSERT INTO `log` VALUES (54, 'zs', '添加菜单,菜单名为:编辑', '2020-07-06 22:47:14');
INSERT INTO `log` VALUES (55, 'zs', '更新菜单,菜单名为:编辑', '2020-07-06 22:48:07');
INSERT INTO `log` VALUES (56, 'zs', '添加菜单,菜单名为:删除', '2020-07-06 22:48:58');
INSERT INTO `log` VALUES (57, 'zs', '添加菜单,菜单名为:商品管理', '2020-07-06 22:51:08');
INSERT INTO `log` VALUES (58, 'zs', '更新权限,权限名为:超级管理员', '2020-07-06 22:51:50');
INSERT INTO `log` VALUES (59, 'zs', '更新权限,权限名为:超级管理员', '2020-07-06 22:52:50');
INSERT INTO `log` VALUES (60, 'zs', '【zs】用户在2020-07-06 23:35:14登录系统!', '2020-07-06 23:35:14');
INSERT INTO `log` VALUES (61, 'zs', '更新菜单,菜单名为:添加', '2020-07-06 23:36:52');
INSERT INTO `log` VALUES (62, 'zs', '更新菜单,菜单名为:删除', '2020-07-06 23:37:21');
INSERT INTO `log` VALUES (63, 'zs', '更新菜单,菜单名为:编辑', '2020-07-06 23:37:46');
INSERT INTO `log` VALUES (64, 'zs', '【zs】用户在2020-07-07 13:56:59登录系统!', '2020-07-07 13:56:59');
INSERT INTO `log` VALUES (65, 'zs', '【zs】用户在2020-07-07 14:02:05登录系统!', '2020-07-07 14:02:05');
INSERT INTO `log` VALUES (66, 'zs', '【zs】用户在2020-07-07 14:04:29登录系统!', '2020-07-07 14:04:29');
INSERT INTO `log` VALUES (67, 'zs', '【zs】用户在2020-07-07 14:17:00登录系统!', '2020-07-07 14:17:00');
INSERT INTO `log` VALUES (68, 'zs', '【zs】用户在2020-07-07 14:51:17登录系统!', '2020-07-07 14:51:17');
INSERT INTO `log` VALUES (69, 'zs', '【zs】用户在2020-07-07 14:53:41登录系统!', '2020-07-07 14:53:41');
INSERT INTO `log` VALUES (70, 'zs', '【zs】用户在2020-07-07 14:56:16登录系统!', '2020-07-07 14:56:16');
INSERT INTO `log` VALUES (71, 'zs', '【zs】用户在2020-07-07 15:00:24登录系统!', '2020-07-07 15:00:24');
INSERT INTO `log` VALUES (72, 'zs', '【zs】用户在2020-07-07 15:01:18登录系统!', '2020-07-07 15:01:18');
INSERT INTO `log` VALUES (73, 'zs', '【zs】用户在2020-07-07 15:05:12登录系统!', '2020-07-07 15:05:12');
INSERT INTO `log` VALUES (74, 'zs', '【zs】用户在2020-07-07 15:06:08登录系统!', '2020-07-07 15:06:08');
INSERT INTO `log` VALUES (75, 'zs', '【zs】用户在2020-07-07 15:07:44登录系统!', '2020-07-07 15:07:44');
INSERT INTO `log` VALUES (76, 'zs', '【zs】用户在2020-07-07 15:09:19登录系统!', '2020-07-07 15:09:19');
INSERT INTO `log` VALUES (77, 'zs', '【zs】用户在2020-07-07 15:10:35登录系统!', '2020-07-07 15:10:35');
INSERT INTO `log` VALUES (78, 'zs', '【zs】用户在2020-07-07 15:12:21登录系统!', '2020-07-07 15:12:21');
INSERT INTO `log` VALUES (79, 'zs', '【zs】用户在2020-07-07 16:09:11登录系统!', '2020-07-07 16:09:11');
INSERT INTO `log` VALUES (80, 'zs', '【zs】用户在2020-07-07 16:10:08登录系统!', '2020-07-07 16:10:08');
INSERT INTO `log` VALUES (81, 'zs', '【zs】用户在2020-07-07 16:13:51登录系统!', '2020-07-07 16:13:51');
INSERT INTO `log` VALUES (82, 'zs', '【zs】用户在2020-07-07 16:23:29登录系统!', '2020-07-07 16:23:29');
INSERT INTO `log` VALUES (83, 'zs', '【zs】用户在2020-07-07 16:26:34登录系统!', '2020-07-07 16:26:34');
INSERT INTO `log` VALUES (84, 'zs', '【zs】用户在2020-07-07 16:27:13登录系统!', '2020-07-07 16:27:13');
INSERT INTO `log` VALUES (85, 'zs', '【zs】用户在2020-07-07 16:27:48登录系统!', '2020-07-07 16:27:48');
INSERT INTO `log` VALUES (86, 'zs', '【zs】用户在2020-07-07 16:29:06登录系统!', '2020-07-07 16:29:06');
INSERT INTO `log` VALUES (87, 'zs', '【zs】用户在2020-07-07 16:31:16登录系统!', '2020-07-07 16:31:16');
INSERT INTO `log` VALUES (88, 'zs', '【zs】用户在2020-07-07 16:50:00登录系统!', '2020-07-07 16:50:00');
INSERT INTO `log` VALUES (89, 'zs', '【zs】用户在2020-07-07 16:52:21登录系统!', '2020-07-07 16:52:21');
INSERT INTO `log` VALUES (90, 'zs', '【zs】用户在2020-07-07 17:14:34登录系统!', '2020-07-07 17:14:34');
INSERT INTO `log` VALUES (91, 'zs', '【zs】用户在2020-07-07 17:17:04登录系统!', '2020-07-07 17:17:04');
INSERT INTO `log` VALUES (92, 'zs', '【zs】用户在2020-07-07 17:19:04登录系统!', '2020-07-07 17:19:04');
INSERT INTO `log` VALUES (93, 'zs', '【zs】用户在2020-07-07 17:21:19登录系统!', '2020-07-07 17:21:19');
INSERT INTO `log` VALUES (94, 'zs', '【zs】用户在2020-07-07 17:22:48登录系统!', '2020-07-07 17:22:48');
INSERT INTO `log` VALUES (95, 'zs', '【zs】用户在2020-07-07 17:31:48登录系统!', '2020-07-07 17:31:48');
INSERT INTO `log` VALUES (96, 'zs', '【zs】用户在2020-07-07 17:33:01登录系统!', '2020-07-07 17:33:01');
INSERT INTO `log` VALUES (97, 'zs', '【zs】用户在2020-07-07 17:37:04登录系统!', '2020-07-07 17:37:04');
INSERT INTO `log` VALUES (98, 'zs', '【zs】用户在2020-07-07 17:46:49登录系统!', '2020-07-07 17:46:49');
INSERT INTO `log` VALUES (99, 'zs', '【zs】用户在2020-07-07 17:53:16登录系统!', '2020-07-07 17:53:16');
INSERT INTO `log` VALUES (100, 'zs', '【zs】用户在2020-07-07 17:55:00登录系统!', '2020-07-07 17:55:00');
INSERT INTO `log` VALUES (101, 'zs', '【zs】用户在2020-07-07 18:17:26登录系统!', '2020-07-07 18:17:26');
INSERT INTO `log` VALUES (102, 'zs', '【zs】用户在2020-07-07 18:31:15登录系统!', '2020-07-07 18:31:15');
INSERT INTO `log` VALUES (103, 'zs', '【zs】用户在2020-07-07 21:08:50登录系统!', '2020-07-07 21:08:50');
INSERT INTO `log` VALUES (104, 'zs', '【zs】用户在2020-07-07 21:18:57登录系统!', '2020-07-07 21:18:57');
INSERT INTO `log` VALUES (105, 'zs', '【zs】用户在2020-07-07 21:19:31登录系统!', '2020-07-07 21:19:31');
INSERT INTO `log` VALUES (106, 'zs', '【zs】用户在2020-07-07 21:40:16登录系统!', '2020-07-07 21:40:16');
INSERT INTO `log` VALUES (107, 'zs', '【zs】用户在2020-07-07 21:44:31登录系统!', '2020-07-07 21:44:31');
INSERT INTO `log` VALUES (108, 'zs', '【zs】用户在2020-07-07 21:46:45登录系统!', '2020-07-07 21:46:45');
INSERT INTO `log` VALUES (109, 'zs', '【zs】用户在2020-07-07 22:18:09登录系统!', '2020-07-07 22:18:09');
INSERT INTO `log` VALUES (110, 'zs', '【zs】用户在2020-07-07 22:19:02登录系统!', '2020-07-07 22:19:02');
INSERT INTO `log` VALUES (111, 'zs', '【zs】用户在2020-07-07 22:28:08登录系统!', '2020-07-07 22:28:08');
INSERT INTO `log` VALUES (112, 'zs', '【zs】用户在2020-07-07 22:48:47登录系统!', '2020-07-07 22:48:47');
INSERT INTO `log` VALUES (113, 'zs', '【zs】用户在2020-07-07 22:51:32登录系统!', '2020-07-07 22:51:32');
INSERT INTO `log` VALUES (114, 'zs', '【zs】用户在2020-07-07 22:55:15登录系统!', '2020-07-07 22:55:15');
INSERT INTO `log` VALUES (115, 'zs', '更新菜单,菜单名为:删除', '2020-07-07 23:06:04');
INSERT INTO `log` VALUES (116, 'zs', '添加菜单,菜单名为:添加', '2020-07-07 23:24:54');
INSERT INTO `log` VALUES (117, 'zs', '更新菜单,菜单名为:添加', '2020-07-07 23:25:12');
INSERT INTO `log` VALUES (118, 'zs', '添加菜单,菜单名为:编辑', '2020-07-07 23:25:54');
INSERT INTO `log` VALUES (119, 'zs', '添加菜单,菜单名为:删除', '2020-07-07 23:26:37');
INSERT INTO `log` VALUES (120, 'zs', '更新菜单,菜单名为:编辑', '2020-07-07 23:27:07');
INSERT INTO `log` VALUES (121, 'zs', '添加菜单,菜单ID为:44', '2020-07-07 23:29:13');
INSERT INTO `log` VALUES (122, 'zs', '添加菜单,菜单ID为:45', '2020-07-07 23:29:18');
INSERT INTO `log` VALUES (123, 'zs', '更新菜单,菜单名为:商品设置', '2020-07-07 23:38:47');
INSERT INTO `log` VALUES (124, 'zs', '【zs】用户在2020-07-08 20:38:24登录系统!', '2020-07-08 20:38:24');
INSERT INTO `log` VALUES (125, 'zs', '【zs】用户在2020-07-08 21:09:36登录系统!', '2020-07-08 21:09:36');
INSERT INTO `log` VALUES (126, '詹姆斯', '【詹姆斯】用户在2020-07-08 22:16:37登录系统!', '2020-07-08 22:16:37');
INSERT INTO `log` VALUES (127, 'zs', '【zs】用户在2020-07-14 17:00:58登录系统!', '2020-07-14 17:00:58');
INSERT INTO `log` VALUES (128, 'zs', '【zs】用户在2020-07-14 17:10:54登录系统!', '2020-07-14 17:10:54');
INSERT INTO `log` VALUES (129, 'zs', '【zs】用户在2020-07-14 17:11:57登录系统!', '2020-07-14 17:11:57');
INSERT INTO `log` VALUES (130, 'zs', '【zs】用户在2020-07-14 17:12:39登录系统!', '2020-07-14 17:12:39');
INSERT INTO `log` VALUES (131, 'zs', '【zs】用户在2020-07-14 17:17:16登录系统!', '2020-07-14 17:17:16');
INSERT INTO `log` VALUES (132, 'zs', '【zs】用户在2020-07-16 09:39:18登录系统!', '2020-07-16 09:39:18');
INSERT INTO `log` VALUES (133, 'zs', '【zs】用户在2020-07-16 10:16:07登录系统!', '2020-07-16 10:16:07');
INSERT INTO `log` VALUES (134, 'zs', '【zs】用户在2020-07-22 13:17:31登录系统!', '2020-07-22 13:17:31');
INSERT INTO `log` VALUES (135, 'zs', '【zs】用户在2020-07-22 13:25:28登录系统!', '2020-07-22 13:25:28');
INSERT INTO `log` VALUES (136, 'zs', '【zs】用户在2020-07-22 13:25:28登录系统!', '2020-07-22 13:25:28');
INSERT INTO `log` VALUES (137, 'zs', '【zs】用户在2020-07-22 13:25:28登录系统!', '2020-07-22 13:25:28');
INSERT INTO `log` VALUES (138, 'zs', '【zs】用户在2020-07-22 13:25:28登录系统!', '2020-07-22 13:25:28');
INSERT INTO `log` VALUES (139, 'zs', '【zs】用户在2020-07-22 13:25:28登录系统!', '2020-07-22 13:25:28');
INSERT INTO `log` VALUES (140, 'zs', '【zs】用户在2020-07-22 13:27:31登录系统!', '2020-07-22 13:27:31');
INSERT INTO `log` VALUES (141, 'zs', '【zs】用户在2020-07-22 13:37:27登录系统!', '2020-07-22 13:37:27');
INSERT INTO `log` VALUES (142, 'zs', '【zs】用户在2020-07-22 14:25:27登录系统!', '2020-07-22 14:25:27');
INSERT INTO `log` VALUES (143, 'zs', '【zs】用户在2020-07-22 14:33:55登录系统!', '2020-07-22 14:33:55');
INSERT INTO `log` VALUES (144, 'zs', '【zs】用户在2020-07-22 14:36:23登录系统!', '2020-07-22 14:36:23');
INSERT INTO `log` VALUES (145, 'zs', '【zs】用户在2020-07-22 14:38:34登录系统!', '2020-07-22 14:38:34');
INSERT INTO `log` VALUES (146, 'zs', '【zs】用户在2020-07-22 14:39:38登录系统!', '2020-07-22 14:39:38');
INSERT INTO `log` VALUES (147, 'zs', '添加菜单,菜单ID为:43', '2020-07-22 14:52:20');
INSERT INTO `log` VALUES (148, 'zs', '添加菜单,菜单名为:删除', '2020-07-22 14:55:10');
INSERT INTO `log` VALUES (149, 'zs', '更新权限,权限名为:超级管理员', '2020-07-22 14:55:30');
INSERT INTO `log` VALUES (150, 'zs', '【zs】用户在2020-07-22 15:07:41登录系统!', '2020-07-22 15:07:41');
INSERT INTO `log` VALUES (151, 'zs', '【zs】用户在2020-07-22 16:38:51登录系统!', '2020-07-22 16:38:51');
INSERT INTO `log` VALUES (152, 'zs', '添加菜单,菜单名为:学生管理', '2020-07-22 16:47:28');
INSERT INTO `log` VALUES (153, 'zs', '更新权限,权限名为:超级管理员', '2020-07-22 16:47:43');
INSERT INTO `log` VALUES (154, 'zs', '添加菜单,菜单名为:学生列表', '2020-07-22 16:49:02');
INSERT INTO `log` VALUES (155, 'zs', '更新权限,权限名为:超级管理员', '2020-07-22 16:49:15');
INSERT INTO `log` VALUES (156, 'zs', '更新菜单,菜单名为:学生列表', '2020-07-22 16:49:35');
INSERT INTO `log` VALUES (157, 'zs', '【zs】用户在2020-07-22 17:14:17登录系统!', '2020-07-22 17:14:17');
INSERT INTO `log` VALUES (158, 'zs', '【zs】用户在2020-07-22 17:15:51登录系统!', '2020-07-22 17:15:51');
INSERT INTO `log` VALUES (159, 'zs', '【zs】用户在2020-07-22 17:16:26登录系统!', '2020-07-22 17:16:26');
INSERT INTO `log` VALUES (160, 'zs', '【zs】用户在2020-07-22 17:16:27登录系统!', '2020-07-22 17:16:27');
INSERT INTO `log` VALUES (161, 'zs', '【zs】用户在2020-07-22 17:17:08登录系统!', '2020-07-22 17:17:08');
INSERT INTO `log` VALUES (162, 'zs', '【zs】用户在2020-07-22 17:19:52登录系统!', '2020-07-22 17:19:52');
INSERT INTO `log` VALUES (163, 'zs', '【zs】用户在2020-07-22 17:24:30登录系统!', '2020-07-22 17:24:30');
INSERT INTO `log` VALUES (164, 'zs', '【zs】用户在2020-07-22 17:25:47登录系统!', '2020-07-22 17:25:47');
INSERT INTO `log` VALUES (165, 'zs', '【zs】用户在2020-07-22 21:15:58登录系统!', '2020-07-22 21:15:58');
INSERT INTO `log` VALUES (166, 'zs', '添加菜单,菜单名为:冻结', '2020-07-22 21:18:53');
INSERT INTO `log` VALUES (167, 'zs', '更新权限,权限名为:超级管理员', '2020-07-22 21:19:05');
INSERT INTO `log` VALUES (168, 'zs', '添加菜单,菜单名为:激活', '2020-07-22 21:20:43');
INSERT INTO `log` VALUES (169, 'zs', '更新菜单,菜单名为:冻结', '2020-07-22 21:20:59');
INSERT INTO `log` VALUES (170, 'zs', '添加菜单,菜单名为:删除', '2020-07-22 21:21:54');
INSERT INTO `log` VALUES (171, 'zs', '更新权限,权限名为:超级管理员', '2020-07-22 21:22:01');
INSERT INTO `log` VALUES (172, 'zs', '【zs】用户在2020-07-22 21:35:54登录系统!', '2020-07-22 21:35:54');
INSERT INTO `log` VALUES (173, 'zs', '【zs】用户在2020-07-22 21:39:43登录系统!', '2020-07-22 21:39:43');
INSERT INTO `log` VALUES (174, 'zs', '更新菜单,菜单名为:冻结', '2020-07-22 21:42:39');
INSERT INTO `log` VALUES (175, 'zs', '更新菜单,菜单名为:激活', '2020-07-22 21:42:51');
INSERT INTO `log` VALUES (176, 'zs', '更新菜单,菜单名为:删除', '2020-07-22 21:43:02');
INSERT INTO `log` VALUES (177, 'zs', '【zs】用户在2020-07-22 21:55:06登录系统!', '2020-07-22 21:55:06');
INSERT INTO `log` VALUES (178, 'zs', '【zs】用户在2020-07-22 22:05:48登录系统!', '2020-07-22 22:05:48');
INSERT INTO `log` VALUES (179, 'zs', '【zs】用户在2020-07-22 22:49:53登录系统!', '2020-07-22 22:49:53');
INSERT INTO `log` VALUES (180, 'zs', '添加菜单,菜单名为:评论管理', '2020-07-22 22:53:16');
INSERT INTO `log` VALUES (181, 'zs', '更新权限,权限名为:超级管理员', '2020-07-22 22:53:26');
INSERT INTO `log` VALUES (182, 'zs', '添加菜单,菜单名为:评论列表', '2020-07-22 22:54:26');
INSERT INTO `log` VALUES (183, 'zs', '更新权限,权限名为:超级管理员', '2020-07-22 22:54:41');
INSERT INTO `log` VALUES (184, 'zs', '【zs】用户在2020-07-22 22:57:11登录系统!', '2020-07-22 22:57:11');
INSERT INTO `log` VALUES (185, 'zs', '【zs】用户在2020-07-22 22:59:55登录系统!', '2020-07-22 22:59:55');
INSERT INTO `log` VALUES (186, 'zs', '【zs】用户在2020-07-22 23:00:54登录系统!', '2020-07-22 23:00:54');
INSERT INTO `log` VALUES (187, 'zs', '【zs】用户在2020-07-22 23:02:56登录系统!', '2020-07-22 23:02:56');
INSERT INTO `log` VALUES (188, 'zs', '【zs】用户在2020-07-22 23:09:10登录系统!', '2020-07-22 23:09:10');
INSERT INTO `log` VALUES (189, 'zs', '【zs】用户在2020-07-22 23:24:39登录系统!', '2020-07-22 23:24:39');
INSERT INTO `log` VALUES (190, 'zs', '【zs】用户在2020-07-22 23:25:27登录系统!', '2020-07-22 23:25:27');
INSERT INTO `log` VALUES (191, 'zs', '【zs】用户在2020-07-22 23:30:39登录系统!', '2020-07-22 23:30:39');
INSERT INTO `log` VALUES (192, 'zs', '【zs】用户在2020-07-22 23:31:25登录系统!', '2020-07-22 23:31:25');
INSERT INTO `log` VALUES (193, 'zs', '【zs】用户在2020-07-23 10:32:33登录系统!', '2020-07-23 10:32:33');
INSERT INTO `log` VALUES (194, 'zs', '【zs】用户在2020-07-23 10:38:56登录系统!', '2020-07-23 10:38:56');
INSERT INTO `log` VALUES (195, 'zs', '【zs】用户在2020-07-23 10:44:28登录系统!', '2020-07-23 10:44:28');
INSERT INTO `log` VALUES (196, 'zs', '【zs】用户在2020-07-23 10:47:30登录系统!', '2020-07-23 10:47:30');
INSERT INTO `log` VALUES (197, 'zs', '【zs】用户在2020-07-23 10:49:13登录系统!', '2020-07-23 10:49:13');
INSERT INTO `log` VALUES (198, 'zs', '【zs】用户在2020-07-23 10:52:21登录系统!', '2020-07-23 10:52:21');
INSERT INTO `log` VALUES (199, 'zs', '【zs】用户在2020-07-23 10:53:10登录系统!', '2020-07-23 10:53:10');
INSERT INTO `log` VALUES (200, 'zs', '【zs】用户在2020-07-23 10:58:06登录系统!', '2020-07-23 10:58:06');
INSERT INTO `log` VALUES (201, 'zs', '【zs】用户在2020-07-23 11:11:37登录系统!', '2020-07-23 11:11:37');
INSERT INTO `log` VALUES (202, 'zs', '更新菜单,菜单名为:druid监控', '2020-07-23 11:12:25');
INSERT INTO `log` VALUES (203, 'zs', '添加菜单,菜单名为:监控管理', '2020-07-23 11:14:11');
INSERT INTO `log` VALUES (204, 'zs', '更新权限,权限名为:超级管理员', '2020-07-23 11:14:26');
INSERT INTO `log` VALUES (205, 'zs', '添加菜单,菜单名为:删除', '2020-07-23 11:22:54');
INSERT INTO `log` VALUES (206, 'zs', '更新权限,权限名为:超级管理员', '2020-07-23 11:23:03');
INSERT INTO `log` VALUES (207, 'zs', '【zs】用户在2020-07-23 11:31:29登录系统!', '2020-07-23 11:31:29');
INSERT INTO `log` VALUES (208, 'zs', '【zs】用户在2020-07-23 15:29:28登录系统!', '2020-07-23 15:29:28');
INSERT INTO `log` VALUES (209, 'zs', '【zs】用户在2020-07-23 16:58:59登录系统!', '2020-07-23 16:58:59');
INSERT INTO `log` VALUES (210, 'zs', '添加菜单,菜单名为:新闻管理', '2020-07-23 17:00:31');
INSERT INTO `log` VALUES (211, 'zs', '更新权限,权限名为:超级管理员', '2020-07-23 17:00:46');
INSERT INTO `log` VALUES (212, 'zs', '添加菜单,菜单名为:新闻公告列表', '2020-07-23 17:02:09');
INSERT INTO `log` VALUES (213, 'zs', '更新权限,权限名为:超级管理员', '2020-07-23 17:02:18');
INSERT INTO `log` VALUES (214, 'zs', '【zs】用户在2020-07-23 17:04:05登录系统!', '2020-07-23 17:04:05');
INSERT INTO `log` VALUES (215, 'zs', '【zs】用户在2020-07-23 17:09:17登录系统!', '2020-07-23 17:09:17');
INSERT INTO `log` VALUES (216, 'zs', '【zs】用户在2020-07-23 17:16:22登录系统!', '2020-07-23 17:16:22');
INSERT INTO `log` VALUES (217, 'zs', '更新权限,权限名为:超级管理员', '2020-07-23 17:17:00');
INSERT INTO `log` VALUES (218, 'zs', '【zs】用户在2020-07-23 17:17:10登录系统!', '2020-07-23 17:17:10');
INSERT INTO `log` VALUES (219, 'zs', '【zs】用户在2020-07-23 17:18:40登录系统!', '2020-07-23 17:18:40');
INSERT INTO `log` VALUES (220, 'zs', '【zs】用户在2020-07-23 17:18:40登录系统!', '2020-07-23 17:18:40');
INSERT INTO `log` VALUES (221, 'zs', '【zs】用户在2020-07-23 17:21:35登录系统!', '2020-07-23 17:21:35');
INSERT INTO `log` VALUES (222, 'zs', '【zs】用户在2020-07-23 17:22:44登录系统!', '2020-07-23 17:22:44');
INSERT INTO `log` VALUES (223, 'zs', '【zs】用户在2020-07-23 17:28:23登录系统!', '2020-07-23 17:28:23');
INSERT INTO `log` VALUES (224, 'zs', '【zs】用户在2020-07-23 17:34:45登录系统!', '2020-07-23 17:34:45');
INSERT INTO `log` VALUES (225, 'zs', '【zs】用户在2020-07-23 17:58:25登录系统!', '2020-07-23 17:58:25');
INSERT INTO `log` VALUES (226, 'zs', '【zs】用户在2020-07-23 20:26:08登录系统!', '2020-07-23 20:26:08');
INSERT INTO `log` VALUES (227, 'zs', '添加菜单,菜单名为:添加', '2020-07-23 20:33:08');
INSERT INTO `log` VALUES (228, 'zs', '更新权限,权限名为:超级管理员', '2020-07-23 20:33:19');
INSERT INTO `log` VALUES (229, 'zs', '添加菜单,菜单名为:编辑', '2020-07-23 20:34:35');
INSERT INTO `log` VALUES (230, 'zs', '更新权限,权限名为:超级管理员', '2020-07-23 20:34:43');
INSERT INTO `log` VALUES (231, 'zs', '添加菜单,菜单名为:删除', '2020-07-23 20:35:56');
INSERT INTO `log` VALUES (232, 'zs', '更新权限,权限名为:超级管理员', '2020-07-23 20:36:06');
INSERT INTO `log` VALUES (233, 'zs', '【zs】用户在2020-07-23 20:38:32登录系统!', '2020-07-23 20:38:32');
INSERT INTO `log` VALUES (234, 'zs', '更新菜单,菜单名为:添加', '2020-07-23 20:41:05');
INSERT INTO `log` VALUES (235, 'zs', '【zs】用户在2020-07-23 20:56:37登录系统!', '2020-07-23 20:56:37');
INSERT INTO `log` VALUES (236, 'zs', '【zs】用户在2020-07-23 20:57:22登录系统!', '2020-07-23 20:57:22');
INSERT INTO `log` VALUES (237, 'zs', '【zs】用户在2020-07-23 20:57:22登录系统!', '2020-07-23 20:57:22');
INSERT INTO `log` VALUES (238, 'zs', '【zs】用户在2020-07-23 21:00:41登录系统!', '2020-07-23 21:00:41');
INSERT INTO `log` VALUES (239, 'zs', '【zs】用户在2020-07-23 21:02:48登录系统!', '2020-07-23 21:02:48');
INSERT INTO `log` VALUES (240, 'zs', '【zs】用户在2020-07-23 21:04:32登录系统!', '2020-07-23 21:04:32');
INSERT INTO `log` VALUES (241, 'zs', '【zs】用户在2020-07-23 21:09:17登录系统!', '2020-07-23 21:09:17');
INSERT INTO `log` VALUES (242, 'zs', '【zs】用户在2020-07-23 21:10:28登录系统!', '2020-07-23 21:10:28');
INSERT INTO `log` VALUES (243, 'zs', '【zs】用户在2020-07-23 21:12:13登录系统!', '2020-07-23 21:12:13');
INSERT INTO `log` VALUES (244, 'zs', '【zs】用户在2020-07-23 21:14:11登录系统!', '2020-07-23 21:14:11');
INSERT INTO `log` VALUES (245, 'zs', '【zs】用户在2020-07-23 21:14:35登录系统!', '2020-07-23 21:14:35');
INSERT INTO `log` VALUES (246, 'zs', '【zs】用户在2020-07-23 21:58:47登录系统!', '2020-07-23 21:58:47');
INSERT INTO `log` VALUES (247, 'zs', '【zs】用户在2020-07-23 22:08:04登录系统!', '2020-07-23 22:08:04');
INSERT INTO `log` VALUES (248, 'zs', '【zs】用户在2020-07-24 20:51:08登录系统!', '2020-07-24 20:51:08');
INSERT INTO `log` VALUES (249, 'zs', '【zs】用户在2020-07-24 20:51:43登录系统!', '2020-07-24 20:51:43');
INSERT INTO `log` VALUES (250, 'zs', '【zs】用户在2020-07-24 21:20:53登录系统!', '2020-07-24 21:20:53');
INSERT INTO `log` VALUES (251, 'zs', '【zs】用户在2020-07-24 21:21:04登录系统!', '2020-07-24 21:21:04');
INSERT INTO `log` VALUES (252, 'zs', '更新菜单,菜单名为:druid监控', '2020-07-24 21:21:55');
INSERT INTO `log` VALUES (253, 'zs', '【zs】用户在2020-07-24 22:20:20登录系统!', '2020-07-24 22:20:20');
INSERT INTO `log` VALUES (254, 'zs', '【zs】用户在2020-07-25 13:37:05登录系统!', '2020-07-25 13:37:05');
INSERT INTO `log` VALUES (255, 'zs', '添加菜单,菜单名为:网站设置', '2020-07-25 13:48:48');
INSERT INTO `log` VALUES (256, 'zs', '更新权限,权限名为:超级管理员', '2020-07-25 13:48:58');
INSERT INTO `log` VALUES (257, 'zs', '【zs】用户在2020-07-25 13:52:09登录系统!', '2020-07-25 13:52:09');
INSERT INTO `log` VALUES (258, 'zs', '添加菜单,菜单名为:站点设置', '2020-07-25 13:53:21');
INSERT INTO `log` VALUES (259, 'zs', '更新权限,权限名为:超级管理员', '2020-07-25 13:53:27');
INSERT INTO `log` VALUES (260, 'zs', '【zs】用户在2020-07-25 13:59:15登录系统!', '2020-07-25 13:59:15');
INSERT INTO `log` VALUES (261, 'zs', '【zs】用户在2020-07-25 14:00:56登录系统!', '2020-07-25 14:00:56');
INSERT INTO `log` VALUES (262, 'zs', '【zs】用户在2020-07-25 14:17:53登录系统!', '2020-07-25 14:17:53');
INSERT INTO `log` VALUES (263, 'zs', '【zs】用户在2020-07-25 14:44:13登录系统!', '2020-07-25 14:44:13');
INSERT INTO `log` VALUES (264, 'zs', '【zs】用户在2020-07-25 14:48:04登录系统!', '2020-07-25 14:48:04');
INSERT INTO `log` VALUES (265, 'zs', '【zs】用户在2020-07-25 14:52:22登录系统!', '2020-07-25 14:52:22');
INSERT INTO `log` VALUES (266, 'zs', '添加菜单,菜单名为:修改', '2020-07-25 15:10:29');
INSERT INTO `log` VALUES (267, 'zs', '更新权限,权限名为:超级管理员', '2020-07-25 15:10:47');
INSERT INTO `log` VALUES (268, 'zs', '修改网站设置SiteSetting(id=1, siteName=广东理工学院二手交易市场, siteUrl=www.gdlgxy.com, logo1=20200725/1595661056400.jpg, logo2=20200712/1594517184940.JPG, code=20200712/1594517184940.JPG, allRights=©2020【广东理工学院】 版权所有)', '2020-07-25 15:10:58');
INSERT INTO `log` VALUES (269, 'zs', '修改网站设置SiteSetting(id=1, siteName=广东理工学院二手交易市场, siteUrl=www.gdlgxy.com, logo1=20200725/1595661056400.jpg, logo2=20200725/1595661066032.png, code=20200725/1595661072543.jpg, allRights=©2020【广东理工学院】 版权所有)', '2020-07-25 15:11:15');
INSERT INTO `log` VALUES (270, 'zs', '【zs】用户在2020-07-25 15:12:19登录系统!', '2020-07-25 15:12:19');
INSERT INTO `log` VALUES (271, 'zs', '【zs】用户在2020-07-25 15:24:02登录系统!', '2020-07-25 15:24:02');
INSERT INTO `log` VALUES (272, 'zs', '【zs】用户在2020-07-25 15:31:51登录系统!', '2020-07-25 15:31:51');
INSERT INTO `log` VALUES (273, 'zs', '【zs】用户在2020-07-25 15:43:07登录系统!', '2020-07-25 15:43:07');
INSERT INTO `log` VALUES (274, 'zs', '【zs】用户在2020-07-25 15:44:28登录系统!', '2020-07-25 15:44:28');
INSERT INTO `log` VALUES (275, 'zs', '添加菜单,菜单名为:詹姆斯', '2020-07-25 15:44:58');
INSERT INTO `log` VALUES (276, 'zs', '添加菜单,菜单ID为:64', '2020-07-25 15:45:05');
INSERT INTO `log` VALUES (277, 'zs', '【zs】用户在2020-07-25 15:45:48登录系统!', '2020-07-25 15:45:48');
INSERT INTO `log` VALUES (278, 'zs', '【zs】用户在2020-07-25 15:50:26登录系统!', '2020-07-25 15:50:26');
INSERT INTO `log` VALUES (279, 'zs', '更新菜单,菜单名为:监控管理', '2020-07-25 15:51:02');
INSERT INTO `log` VALUES (280, 'zs', '【zs】用户在2020-07-25 15:53:04登录系统!', '2020-07-25 15:53:04');
INSERT INTO `log` VALUES (281, 'zs', '【zs】用户在2020-07-25 15:54:38登录系统!', '2020-07-25 15:54:38');
INSERT INTO `log` VALUES (282, 'zs', '更新权限,权限名为:超级管理员', '2020-07-25 15:55:23');
INSERT INTO `log` VALUES (283, 'zs', '删除菜单,菜单ID为:54', '2020-07-25 15:55:51');
INSERT INTO `log` VALUES (284, 'zs', '【zs】用户在2020-07-25 15:56:54登录系统!', '2020-07-25 15:56:54');
INSERT INTO `log` VALUES (285, 'zs', '更新权限,权限名为:小小的管理员', '2020-07-25 15:57:18');
INSERT INTO `log` VALUES (286, 'zs', '添加菜单,菜单名为:监控管理', '2020-07-25 16:00:09');
INSERT INTO `log` VALUES (287, 'zs', '更新权限,权限名为:超级管理员', '2020-07-25 16:00:30');
INSERT INTO `log` VALUES (288, 'zs', '删除菜单,菜单ID为:36', '2020-07-25 16:00:41');
INSERT INTO `log` VALUES (289, 'zs', '【zs】用户在2020-07-26 10:55:34登录系统!', '2020-07-26 10:55:34');
INSERT INTO `log` VALUES (290, 'zs', '【zs】用户在2020-07-27 10:54:05登录系统!', '2020-07-27 10:54:05');
INSERT INTO `log` VALUES (291, 'zs', '【zs】用户在2020-07-30 14:16:28登录系统!', '2020-07-30 14:16:28');
INSERT INTO `log` VALUES (292, 'zs', '【zs】用户在2020-07-30 14:20:47登录系统!', '2020-07-30 14:20:47');
INSERT INTO `log` VALUES (293, 'zs', '更新权限,权限名为:超级管理员', '2020-07-30 14:23:24');
INSERT INTO `log` VALUES (294, 'zs', '删除菜单,菜单ID为:26', '2020-07-30 14:24:29');
INSERT INTO `log` VALUES (295, 'zs', '删除菜单,菜单ID为:25', '2020-07-30 14:24:37');
INSERT INTO `log` VALUES (296, 'zs', '删除菜单,菜单ID为:24', '2020-07-30 14:24:42');
INSERT INTO `log` VALUES (297, 'zs', '删除菜单,菜单ID为:23', '2020-07-30 14:24:48');
INSERT INTO `log` VALUES (298, 'zs', '【zs】用户在2020-07-30 15:14:17登录系统!', '2020-07-30 15:14:17');
INSERT INTO `log` VALUES (299, 'zs', '添加菜单,菜单名为:数据备份', '2020-07-30 15:17:11');
INSERT INTO `log` VALUES (300, 'zs', '更新权限,权限名为:超级管理员', '2020-07-30 15:17:26');
INSERT INTO `log` VALUES (301, 'zs', '更新菜单,菜单名为:数据备份', '2020-07-30 15:18:40');
INSERT INTO `log` VALUES (302, 'zs', '【zs】用户在2020-07-30 15:19:52登录系统!', '2020-07-30 15:19:52');
INSERT INTO `log` VALUES (303, 'zs', '更新权限,权限名为:超级管理员', '2020-07-30 15:37:01');
INSERT INTO `log` VALUES (304, 'zs', '删除菜单,菜单ID为:66', '2020-07-30 15:37:18');
INSERT INTO `log` VALUES (305, 'zs', '【zs】用户在2020-07-30 15:38:45登录系统!', '2020-07-30 15:38:45');
INSERT INTO `log` VALUES (306, 'zs', '【zs】用户在2020-07-30 15:56:17登录系统!', '2020-07-30 15:56:17');
INSERT INTO `log` VALUES (307, 'zs', '【zs】用户在2020-10-22 15:45:34登录系统!', '2020-10-22 15:45:34');

-- ----------------------------
-- Table structure for menu
-- ----------------------------
DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `create_time` datetime(0) NOT NULL,
  `name` varchar(18) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `url` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `icon` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `parent` bigint(20) NULL DEFAULT NULL,
  `button` bit(1) NULL DEFAULT b'0',
  `show` bit(1) NULL DEFAULT b'1',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FKsbtnjocfrq29e8taxdwo21gic`(`parent`) USING BTREE,
  CONSTRAINT `menu_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `menu` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 67 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of menu
-- ----------------------------
INSERT INTO `menu` VALUES (2, '2020-03-14 14:26:03', '系统设置', '', 'mdi-settings', NULL, b'0', b'1');
INSERT INTO `menu` VALUES (3, '2020-03-14 16:58:55', '菜单管理', '/admin/menu/list', 'mdi-view-list', 2, b'0', b'1');
INSERT INTO `menu` VALUES (5, '2020-03-14 17:04:44', '新增', '/admin/menu/add', 'mdi-plus', 3, b'0', b'1');
INSERT INTO `menu` VALUES (7, '2020-03-14 17:07:43', '角色管理', '/admin/role/list', 'mdi-account-settings-variant', 2, b'0', b'1');
INSERT INTO `menu` VALUES (8, '2020-03-14 18:28:48', '编辑', 'edit(\'/admin/menu/edit\')', 'mdi-grease-pencil', 3, b'1', b'1');
INSERT INTO `menu` VALUES (9, '2020-03-14 18:30:00', '删除', 'del(\'/admin/menu/delete\')', 'mdi-close', 3, b'1', b'1');
INSERT INTO `menu` VALUES (10, '2020-03-15 12:12:00', '添加', '/admin/role/add', 'mdi-account-plus', 7, b'0', b'1');
INSERT INTO `menu` VALUES (11, '2020-03-15 12:12:36', '编辑', 'edit(\'/admin/role/edit\')', 'mdi-account-edit', 7, b'1', b'1');
INSERT INTO `menu` VALUES (12, '2020-03-15 12:13:19', '删除', 'del(\'/admin/role/delete\')', 'mdi-account-remove', 7, b'1', b'1');
INSERT INTO `menu` VALUES (13, '2020-03-15 12:14:52', '用户管理', '/admin/user/list', 'mdi-account-multiple', 2, b'0', b'1');
INSERT INTO `menu` VALUES (14, '2020-03-15 12:15:22', '添加', '/admin/user/add', 'mdi-account-plus', 13, b'0', b'1');
INSERT INTO `menu` VALUES (15, '2020-03-16 17:18:14', '编辑', 'edit(\'/admin/user/edit\')', 'mdi-account-edit', 13, b'1', b'1');
INSERT INTO `menu` VALUES (16, '2020-03-16 17:19:01', '删除', 'del(\'/admin/user/delete\')', 'mdi-account-remove', 13, b'1', b'1');
INSERT INTO `menu` VALUES (19, '2020-03-22 11:24:36', '上传图片', '/upload/upload_photo', 'mdi-arrow-up-bold-circle', 13, b'0', b'0');
INSERT INTO `menu` VALUES (20, '2020-03-22 14:09:35', '日志管理', '/admin/log/list', 'mdi-tag-multiple', 2, b'0', b'1');
INSERT INTO `menu` VALUES (21, '2020-03-22 14:11:39', '删除', 'del(\'/admin/log/delete\')', 'mdi-tag-remove', 20, b'1', b'1');
INSERT INTO `menu` VALUES (22, '2020-03-22 14:12:57', '清空日志', 'delAll(\'/admin/log/deleteAll\')', 'mdi-delete-circle', 20, b'1', b'1');
INSERT INTO `menu` VALUES (37, '2020-07-06 22:35:21', '商品设置', '', 'mdi-basket', NULL, b'0', b'1');
INSERT INTO `menu` VALUES (38, '2020-07-06 22:40:43', '分类管理', '/admin/category/list', 'mdi-svg', 37, b'0', b'1');
INSERT INTO `menu` VALUES (39, '2020-07-06 22:45:09', '添加', '/admin/category/add', 'mdi-plus', 38, b'0', b'1');
INSERT INTO `menu` VALUES (40, '2020-07-06 22:47:14', '编辑', 'edit(\'/admin/category/edit\')', 'mdi-box-cutter', 38, b'1', b'1');
INSERT INTO `menu` VALUES (41, '2020-07-06 22:48:58', '删除', 'del(\'/admin/category/delete\')', 'mdi-window-close', 38, b'1', b'1');
INSERT INTO `menu` VALUES (42, '2020-07-06 22:51:08', '商品管理', '/admin/good/list', 'mdi-baby-buggy', 37, b'0', b'1');
INSERT INTO `menu` VALUES (46, '2020-07-22 14:55:10', '删除', 'del(\'/admin/good/delete\')', 'mdi-window-close', 42, b'1', b'1');
INSERT INTO `menu` VALUES (47, '2020-07-22 16:47:28', '学生管理', '', 'mdi-account-multiple', NULL, b'0', b'1');
INSERT INTO `menu` VALUES (48, '2020-07-22 16:49:02', '学生列表', '/admin/student/list', 'mdi-account-settings', 47, b'0', b'1');
INSERT INTO `menu` VALUES (49, '2020-07-22 21:18:53', '冻结', 'freeze(\'/admin/student/update_status\')', 'mdi-account-settings-variant', 48, b'1', b'1');
INSERT INTO `menu` VALUES (50, '2020-07-22 21:20:43', '激活', 'openStudent(\'/admin/student/update_status\')', 'mdi-account-key', 48, b'1', b'1');
INSERT INTO `menu` VALUES (51, '2020-07-22 21:21:54', '删除', 'del(\'/admin/student/delete\')', 'mdi-account-remove', 48, b'1', b'1');
INSERT INTO `menu` VALUES (52, '2020-07-22 22:53:16', '评论管理', '', 'mdi-apple-keyboard-command', NULL, b'0', b'1');
INSERT INTO `menu` VALUES (53, '2020-07-22 22:54:26', '评论列表', '/admin/comment/list', 'mdi-atom', 52, b'0', b'1');
INSERT INTO `menu` VALUES (55, '2020-07-23 11:22:54', '删除', 'del(\'/admin/comment/delete\')', 'mdi-window-close', 53, b'1', b'1');
INSERT INTO `menu` VALUES (56, '2020-07-23 17:00:30', '新闻管理', '', 'mdi-file-document-box', NULL, b'0', b'1');
INSERT INTO `menu` VALUES (57, '2020-07-23 17:02:09', '新闻公告列表', '/admin/news/list', 'mdi-book-minus', 56, b'0', b'1');
INSERT INTO `menu` VALUES (58, '2020-07-23 20:33:08', '添加', '/admin/news/add', 'mdi-plus', 57, b'0', b'1');
INSERT INTO `menu` VALUES (59, '2020-07-23 20:34:35', '编辑', 'edit(\'/admin/news/edit\')', 'mdi-border-color', 57, b'1', b'1');
INSERT INTO `menu` VALUES (60, '2020-07-23 20:35:56', '删除', 'del(\'/admin/news/delete\')', 'mdi-window-close', 57, b'1', b'1');
INSERT INTO `menu` VALUES (61, '2020-07-25 13:48:48', '网站设置', '', 'mdi-settings', NULL, b'0', b'1');
INSERT INTO `menu` VALUES (62, '2020-07-25 13:53:21', '站点设置', '/admin/site_setting/setting', 'mdi-wrench', 61, b'0', b'1');
INSERT INTO `menu` VALUES (63, '2020-07-25 15:10:29', '修改', '/admin/site_setting/save_setting', 'mdi-approval', 62, b'0', b'0');
INSERT INTO `menu` VALUES (65, '2020-07-25 16:00:09', '监控管理', '/druid', 'mdi-cctv', 2, b'0', b'1');

-- ----------------------------
-- Table structure for news
-- ----------------------------
DROP TABLE IF EXISTS `news`;
CREATE TABLE `news`  (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `title` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `content` varchar(10240) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `view_number` int(12) NULL DEFAULT 0,
  `create_time` datetime(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of news
-- ----------------------------
INSERT INTO `news` VALUES (1, '广东理工校园二手市场账号注册规则', '注册时请填写详细的注册信息，学号为必填项', NULL, '2020-07-23 21:01:41');
INSERT INTO `news` VALUES (3, '广东理工校园二手市场发布商品规则', '1.禁止和限制发布物品管理规则\r\n2.重复铺货商品管理规则\r\n3.支付方式不符商品管理规则\r\n4.商品价格、邮费不符商品管理规则\r\n5.信用炒作商品管理规则', NULL, '2020-07-23 21:10:08');

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(18) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `remark` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` datetime(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES (1, '超级管理员', '超级管理员拥有最高的权限', '2020-07-04 11:10:26');
INSERT INTO `role` VALUES (2, '普通管理员', '普通管理员拥有部分权限', '2020-07-04 18:07:33');
INSERT INTO `role` VALUES (6, '小小的管理员', '监控SQL', '2020-07-05 16:07:14');

-- ----------------------------
-- Table structure for role_menu
-- ----------------------------
DROP TABLE IF EXISTS `role_menu`;
CREATE TABLE `role_menu`  (
  `role_id` int(11) NOT NULL,
  `menu_id` bigint(20) NOT NULL,
  INDEX `sdasdsad798fsaf`(`role_id`) USING BTREE,
  INDEX `sdsa5d4as2d1`(`menu_id`) USING BTREE,
  CONSTRAINT `sdasdsad798fsaf` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `sdsa5d4as2d1` FOREIGN KEY (`menu_id`) REFERENCES `menu` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of role_menu
-- ----------------------------
INSERT INTO `role_menu` VALUES (2, 2);
INSERT INTO `role_menu` VALUES (2, 3);
INSERT INTO `role_menu` VALUES (2, 5);
INSERT INTO `role_menu` VALUES (2, 7);
INSERT INTO `role_menu` VALUES (2, 11);
INSERT INTO `role_menu` VALUES (2, 13);
INSERT INTO `role_menu` VALUES (2, 16);
INSERT INTO `role_menu` VALUES (6, 2);
INSERT INTO `role_menu` VALUES (6, 7);
INSERT INTO `role_menu` VALUES (6, 10);
INSERT INTO `role_menu` VALUES (6, 11);
INSERT INTO `role_menu` VALUES (6, 12);
INSERT INTO `role_menu` VALUES (6, 20);
INSERT INTO `role_menu` VALUES (6, 21);
INSERT INTO `role_menu` VALUES (1, 2);
INSERT INTO `role_menu` VALUES (1, 3);
INSERT INTO `role_menu` VALUES (1, 5);
INSERT INTO `role_menu` VALUES (1, 8);
INSERT INTO `role_menu` VALUES (1, 9);
INSERT INTO `role_menu` VALUES (1, 7);
INSERT INTO `role_menu` VALUES (1, 10);
INSERT INTO `role_menu` VALUES (1, 11);
INSERT INTO `role_menu` VALUES (1, 12);
INSERT INTO `role_menu` VALUES (1, 13);
INSERT INTO `role_menu` VALUES (1, 14);
INSERT INTO `role_menu` VALUES (1, 15);
INSERT INTO `role_menu` VALUES (1, 16);
INSERT INTO `role_menu` VALUES (1, 19);
INSERT INTO `role_menu` VALUES (1, 20);
INSERT INTO `role_menu` VALUES (1, 21);
INSERT INTO `role_menu` VALUES (1, 22);
INSERT INTO `role_menu` VALUES (1, 65);
INSERT INTO `role_menu` VALUES (1, 37);
INSERT INTO `role_menu` VALUES (1, 38);
INSERT INTO `role_menu` VALUES (1, 39);
INSERT INTO `role_menu` VALUES (1, 40);
INSERT INTO `role_menu` VALUES (1, 41);
INSERT INTO `role_menu` VALUES (1, 42);
INSERT INTO `role_menu` VALUES (1, 46);
INSERT INTO `role_menu` VALUES (1, 47);
INSERT INTO `role_menu` VALUES (1, 48);
INSERT INTO `role_menu` VALUES (1, 49);
INSERT INTO `role_menu` VALUES (1, 50);
INSERT INTO `role_menu` VALUES (1, 51);
INSERT INTO `role_menu` VALUES (1, 52);
INSERT INTO `role_menu` VALUES (1, 53);
INSERT INTO `role_menu` VALUES (1, 55);
INSERT INTO `role_menu` VALUES (1, 56);
INSERT INTO `role_menu` VALUES (1, 57);
INSERT INTO `role_menu` VALUES (1, 58);
INSERT INTO `role_menu` VALUES (1, 59);
INSERT INTO `role_menu` VALUES (1, 60);
INSERT INTO `role_menu` VALUES (1, 61);
INSERT INTO `role_menu` VALUES (1, 62);
INSERT INTO `role_menu` VALUES (1, 63);

-- ----------------------------
-- Table structure for site_setting
-- ----------------------------
DROP TABLE IF EXISTS `site_setting`;
CREATE TABLE `site_setting`  (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `site_name` varchar(130) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `site_url` varchar(260) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `logo_1` varchar(260) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `logo_2` varchar(260) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `code` varchar(260) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `all_rights` varchar(260) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of site_setting
-- ----------------------------
INSERT INTO `site_setting` VALUES (1, '广东理工学院二手交易市场', 'www.gdlgxy.com', '20200725/1595661056400.jpg', '20200725/1595661066032.png', '20200725/1595661072543.jpg', '2020 广东理工学院 all rights reserved');

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student`  (
  `id` int(24) NOT NULL AUTO_INCREMENT COMMENT '学生id',
  `sno` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '学号',
  `password` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码',
  `name` varchar(18) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名字',
  `image` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '学生头像',
  `mobile` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `wx` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '微信号',
  `school` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '学校',
  `academy` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '所属学院',
  `grade` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '年级',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `status` bigint(1) NOT NULL DEFAULT 1 COMMENT '是否可用状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES (1, '171240260401', '123456', '王小兵', '20200712/1594517184940.JPG', '13985082842', 'wabng192', '广东理工学院', '计算机科学与技术', '大三', '2020-07-22 17:18:56', 1);
INSERT INTO `student` VALUES (2, '171240260402', '123456', '李晓婷', '20200714/1594741862961.JPG', '13513981234', 'hzd123', '广理', '计算机科学与技术', '大三', '2020-07-22 17:18:59', 1);
INSERT INTO `student` VALUES (3, '123456789123', '123456', '詹姆斯666', '20200711/1594482454144.JPG', '13050193942', 'hzd123456', '广东理工', '计算机科学与技术', '大三', '2020-07-22 17:20:11', 1);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(12) NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `username` varchar(18) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名',
  `password` varchar(24) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户密码',
  `sex` int(1) NULL DEFAULT NULL COMMENT '性别',
  `status` int(1) NULL DEFAULT NULL COMMENT '用户是否可用',
  `image` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户头像',
  `mobile` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '手机号',
  `create_time` datetime(6) NULL DEFAULT NULL COMMENT '创建时间',
  `email` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `role` int(11) NOT NULL COMMENT '权限id',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `abc`(`role`) USING BTREE,
  CONSTRAINT `abc` FOREIGN KEY (`role`) REFERENCES `role` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'zs', '123456', 1, 1, '20200704/1593866304679.JPG', '13042050121', '2020-06-28 22:32:39.000000', '344245001@qq.com', 1);
INSERT INTO `user` VALUES (2, '小明', '123456', 1, 1, '20200704/1593866722557.JPG', '13042050121', '2020-07-04 20:11:22.000000', '344245001@qq.com', 2);
INSERT INTO `user` VALUES (3, 'ljj', '123456', 2, 1, '20200704/1593870604090.JPG', '13042050121', '2020-07-04 21:50:29.000000', '344245001@qq.com', 2);
INSERT INTO `user` VALUES (4, '詹姆斯', '123456', 2, 1, '20200704/1593872733285.JPG', '13211062766', '2020-07-04 22:26:28.000000', '344245001@qq.com', 6);

SET FOREIGN_KEY_CHECKS = 1;
