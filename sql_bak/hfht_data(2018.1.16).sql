/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50553
Source Host           : localhost:3306
Source Database       : hfht_data

Target Server Type    : MYSQL
Target Server Version : 50553
File Encoding         : 65001

Date: 2018-01-16 13:34:54
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for addedamount
-- ----------------------------
DROP TABLE IF EXISTS `addedamount`;
CREATE TABLE `addedamount` (
  `addedamount_id` int(50) NOT NULL AUTO_INCREMENT COMMENT '赠款id',
  `addedamount_amount` decimal(11,3) DEFAULT NULL COMMENT '金额',
  `addedamount_time` datetime DEFAULT NULL COMMENT '时间',
  `id` int(50) DEFAULT NULL COMMENT '用户id',
  PRIMARY KEY (`addedamount_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of addedamount
-- ----------------------------

-- ----------------------------
-- Table structure for asynchronous
-- ----------------------------
DROP TABLE IF EXISTS `asynchronous`;
CREATE TABLE `asynchronous` (
  `orderid` varchar(50) CHARACTER SET utf8 NOT NULL COMMENT '订单编号',
  `url` text CHARACTER SET utf8 COMMENT '异步地址',
  `relust` varchar(50) DEFAULT NULL,
  `number` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`orderid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of asynchronous
-- ----------------------------

-- ----------------------------
-- Table structure for balance
-- ----------------------------
DROP TABLE IF EXISTS `balance`;
CREATE TABLE `balance` (
  `id` int(50) NOT NULL,
  `amount` decimal(11,3) DEFAULT NULL COMMENT '实际金额',
  `cardamount` decimal(11,3) DEFAULT NULL COMMENT '点卡金额',
  `deductedcard` decimal(11,3) DEFAULT NULL COMMENT '扣除点卡金额',
  `netamount` decimal(11,3) DEFAULT NULL COMMENT '网银金额',
  `deductednet` decimal(11,3) DEFAULT NULL COMMENT '网银扣除金额',
  `waitamount` decimal(11,3) DEFAULT NULL COMMENT '等待入账金额',
  `newamount` decimal(11,3) DEFAULT NULL COMMENT '新进金额',
  `settlement` decimal(11,3) DEFAULT NULL COMMENT '可结算金额',
  `settlementauthority` int(2) DEFAULT NULL COMMENT '结算权限(1:T+0,   2:T+1)',
  `cashleast` decimal(11,3) DEFAULT NULL COMMENT '提现最小金额',
  `refundamout` decimal(11,3) DEFAULT NULL COMMENT '已结算金额',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of balance
-- ----------------------------
INSERT INTO `balance` VALUES ('22', '2599.049', '0.840', '0.160', '2567.209', '2.911', '110.000', '0.000', '2490.049', '1', '0.000', '81.000');
INSERT INTO `balance` VALUES ('23', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '0.000', '2', '100.000', '0.000');

-- ----------------------------
-- Table structure for caifutong
-- ----------------------------
DROP TABLE IF EXISTS `caifutong`;
CREATE TABLE `caifutong` (
  `id` int(50) NOT NULL COMMENT '用户id',
  `caifu_account` varchar(100) CHARACTER SET utf8 DEFAULT NULL COMMENT '财付通账户',
  `caifu_rate` decimal(11,3) DEFAULT NULL COMMENT '财付通费率',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of caifutong
-- ----------------------------

-- ----------------------------
-- Table structure for caifutongorder
-- ----------------------------
DROP TABLE IF EXISTS `caifutongorder`;
CREATE TABLE `caifutongorder` (
  `sp_billno` varchar(50) CHARACTER SET utf8 NOT NULL COMMENT '订单号',
  `transaction_id` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '财付通订单号',
  `purchaser_id` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '用户财付通账号',
  `date` datetime DEFAULT NULL COMMENT '商户时间',
  `total_fee` decimal(11,3) DEFAULT NULL COMMENT '订单总金额',
  `bus_args` varchar(100) CHARACTER SET utf8 DEFAULT NULL COMMENT '业务参数，特定格式的字符串，格式为：(账户^金额^角色)[|(账户^金额^角色)]*',
  `pay_result` varchar(10) CHARACTER SET utf8 DEFAULT NULL COMMENT '分账回退结果，详见“返回码”, 0—成功',
  `pay_info` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '分账回退结果信息',
  `refund_id` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '退款单ID',
  PRIMARY KEY (`sp_billno`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of caifutongorder
-- ----------------------------

-- ----------------------------
-- Table structure for cardcode
-- ----------------------------
DROP TABLE IF EXISTS `cardcode`;
CREATE TABLE `cardcode` (
  `codeid` int(11) NOT NULL,
  `payable` varchar(100) CHARACTER SET utf8 NOT NULL COMMENT '编码名称',
  `participate` varchar(100) CHARACTER SET utf8 NOT NULL COMMENT '接入代码',
  `rate` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '费率名称',
  `seventy_participate` varchar(50) DEFAULT NULL COMMENT '70卡编码',
  PRIMARY KEY (`codeid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of cardcode
-- ----------------------------
INSERT INTO `cardcode` VALUES ('30', '骏网一卡通', '000501', 'junwang', 'jw');
INSERT INTO `cardcode` VALUES ('31', '盛大卡', '000601', 'grand', 'sd');
INSERT INTO `cardcode` VALUES ('32', '神州行', '000101', 'shenzhouxing', 'cm');
INSERT INTO `cardcode` VALUES ('33', '征途卡', '000901', 'journey', 'zt');
INSERT INTO `cardcode` VALUES ('34', 'Q币卡', '000701', 'qqcoins', 'qq');
INSERT INTO `cardcode` VALUES ('35', '联通卡', '000201', 'chinaunicom', 'cc');
INSERT INTO `cardcode` VALUES ('36', '久游卡', '001201', 'travel', 'jy');
INSERT INTO `cardcode` VALUES ('37', '网易卡', '001001', 'netease', 'wy');
INSERT INTO `cardcode` VALUES ('38', '完美卡', '000801', 'perfect', 'wm');
INSERT INTO `cardcode` VALUES ('39', '搜狐卡', '001101', 'sohu', 'sh');
INSERT INTO `cardcode` VALUES ('40', '电信卡', '000301', 'telecom', 'dx');
INSERT INTO `cardcode` VALUES ('41', '纵游一卡通', '001601', 'longitudinal', 'zy');
INSERT INTO `cardcode` VALUES ('42', '天下一卡通', '001401', 'theworld', 'tx');
INSERT INTO `cardcode` VALUES ('43', '天宏一卡通', '001301', 'tianhong', 'th');
INSERT INTO `cardcode` VALUES ('44', '中国电信充值卡(大面值)', '002501', 'telecom', 'dxb');
INSERT INTO `cardcode` VALUES ('45', '天下一卡通（专项卡）', '001801', 'theworld', 'txzx');
INSERT INTO `cardcode` VALUES ('46', '神州行全国卡(大面值)', '001901', 'shenzhouxing', 'cmb');
INSERT INTO `cardcode` VALUES ('47', '神州行地方卡(浙江)', '002001', 'shenzhouxing', 'cd');
INSERT INTO `cardcode` VALUES ('48', '神州行地方卡(福建)', '002101', 'shenzhouxing', 'cd');
INSERT INTO `cardcode` VALUES ('49', '神州行地方卡(广东)', '002201', 'shenzhouxing', 'cd');
INSERT INTO `cardcode` VALUES ('50', '神州行地方卡(辽宁)', '002301', 'shenzhouxing', 'cd');
INSERT INTO `cardcode` VALUES ('51', '32一卡通', '002401', 'thirtytwo', 'se');
INSERT INTO `cardcode` VALUES ('52', '纵游一卡通', '001701', 'longitudinal', 'zy');

-- ----------------------------
-- Table structure for cardorder
-- ----------------------------
DROP TABLE IF EXISTS `cardorder`;
CREATE TABLE `cardorder` (
  `orderid` varchar(50) CHARACTER SET utf8 NOT NULL COMMENT '订单编号',
  `p0_Cmd` varchar(20) CHARACTER SET utf8 NOT NULL COMMENT '业务类型',
  `r1_Code` int(50) NOT NULL COMMENT '提交状态',
  `p1_MerId` int(11) NOT NULL COMMENT '商户编号',
  `p2_Order` varchar(50) CHARACTER SET utf8 NOT NULL COMMENT '商户订单号',
  `p3_Amt` decimal(11,3) NOT NULL COMMENT '支付金额',
  `p4_verifyAmt` varchar(20) CHARACTER SET utf8 NOT NULL COMMENT '是否较验订单金额',
  `p5_Pid` varchar(30) CHARACTER SET utf8 DEFAULT NULL COMMENT ' 产品名称',
  `p6_Pcat` varchar(30) CHARACTER SET utf8 DEFAULT NULL COMMENT '产品类型',
  `p7_Pdesc` varchar(30) CHARACTER SET utf8 DEFAULT NULL COMMENT '产品描述',
  `p8_Url` varchar(200) CHARACTER SET utf8 DEFAULT NULL COMMENT '商户接收支付成功数据的地址',
  `pa_MP` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '商户扩展信息',
  `pa7_cardAmt` varchar(100) CHARACTER SET utf8 DEFAULT NULL COMMENT '卡面额组',
  `pa8_cardNo` varchar(300) CHARACTER SET utf8 DEFAULT NULL COMMENT '卡号组',
  `pa9_cardPwd` varchar(300) CHARACTER SET utf8 DEFAULT NULL COMMENT '卡密组',
  `pd_FrpId` varchar(10) CHARACTER SET utf8 DEFAULT NULL COMMENT '支付通道编码',
  `pr_NeedResponse` int(1) DEFAULT NULL COMMENT '应答机制',
  `pz_userId` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '用户ID',
  `pz1_userRegTime` datetime DEFAULT NULL COMMENT '用户注册时间',
  `CreateTime` datetime DEFAULT NULL COMMENT '创建时间',
  `hmac` varchar(32) CHARACTER SET utf8 NOT NULL COMMENT '签名数据',
  `ip` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '用户ip地址',
  `amount` decimal(11,3) DEFAULT NULL COMMENT '实际金额',
  `success` int(2) DEFAULT NULL COMMENT '是否反馈',
  `deducted` decimal(11,3) DEFAULT NULL COMMENT '扣除金额',
  `rq_ReturnMsg` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '错误代码',
  `lock` int(2) DEFAULT NULL COMMENT '是否被锁定',
  PRIMARY KEY (`orderid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of cardorder
-- ----------------------------

-- ----------------------------
-- Table structure for circlip
-- ----------------------------
DROP TABLE IF EXISTS `circlip`;
CREATE TABLE `circlip` (
  `circlipid` varchar(50) CHARACTER SET utf8 NOT NULL COMMENT '默认销卡编号',
  `superiorid` varchar(50) DEFAULT NULL COMMENT '上家订单号',
  `cardcode` varchar(12) CHARACTER SET utf8 DEFAULT NULL COMMENT '卡类代码',
  `cardno` varchar(32) CHARACTER SET utf8 DEFAULT NULL COMMENT '充值卡的卡号',
  `cardpass` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '充值卡密码',
  `datetime` datetime DEFAULT NULL COMMENT '创建时间',
  `sign` varchar(32) CHARACTER SET utf8 DEFAULT NULL COMMENT '签名（参见Sign计算方法）',
  `billid` varchar(32) CHARACTER SET utf8 DEFAULT NULL COMMENT '欧飞系统生成的相对应的订单号',
  `result` varchar(4) CHARACTER SET utf8 DEFAULT NULL COMMENT '返回代码2001表示成功接收',
  `info` varchar(100) CHARACTER SET utf8 DEFAULT NULL COMMENT '交易情况说明，与result相对应的文字说明。',
  `amount` varchar(11) CHARACTER SET utf8 DEFAULT NULL COMMENT '金额',
  `actual` decimal(11,3) DEFAULT NULL COMMENT '实际金额',
  `xml` varchar(500) CHARACTER SET utf8 DEFAULT NULL COMMENT 'xml',
  `accountvalue` decimal(11,3) DEFAULT NULL COMMENT '最后结算',
  `usermoney` decimal(11,3) DEFAULT NULL COMMENT '上家结算给我们的金额',
  `id` int(50) DEFAULT NULL COMMENT '用户编号',
  `deducted` decimal(11,3) DEFAULT NULL COMMENT '扣除金额',
  `cardid` int(11) DEFAULT NULL COMMENT '卡类id',
  PRIMARY KEY (`circlipid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of circlip
-- ----------------------------

-- ----------------------------
-- Table structure for dynamic
-- ----------------------------
DROP TABLE IF EXISTS `dynamic`;
CREATE TABLE `dynamic` (
  `dynamicid` int(50) NOT NULL AUTO_INCREMENT COMMENT '动态id',
  `title` varchar(200) CHARACTER SET utf8 DEFAULT NULL COMMENT '标题',
  `content` longtext CHARACTER SET utf8 COMMENT '内容',
  `createtime` datetime DEFAULT NULL COMMENT '创建时间',
  `employeeid` int(50) DEFAULT NULL COMMENT '员工id',
  PRIMARY KEY (`dynamicid`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of dynamic
-- ----------------------------
INSERT INTO `dynamic` VALUES ('9', '关于老商户D0结算及WAP端口开放通告', '<p>6月14日开放如下：</p><p>1.针对日流水达到10万用户开放D0结算端口</p><p>2.开放微信WAP/支付宝WAP支付D0结算端口</p><p>3.新增独立代理模式，只需提供域名可享受搭建独立平台独立运营</p><p>4.由于工作原因，免除金牌代理曹海涛一切权限，对应名下客户正常交易</p>', '2017-06-14 10:31:02', '1');
INSERT INTO `dynamic` VALUES ('10', '关于汇付恒通平台上线通告', '<p>尊敬的各位代理、合作伙伴、各级商户：</p><p>&nbsp;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 汇付恒通发展至今，感谢各位的一路相随与鼎立支持，汇付恒通致力于全新聚合支付结算，以实时、高效的结算立足与行业；为了提高各位代理、合作伙伴、各级商户的支付及管理体验，经过为期3个月的内测及通道压力测试，汇付恒通将定于6月18日启用全新支付系统平台，届时将以全新面貌呈现给各位，新版预告如下:</p><p>&nbsp;</p><p>1. 新增商户验证功能：实名认证，提款短信认证，邮箱绑定认证</p><p>2. 新增在线代付提交功能： 在线录入所需代付明细金额，与主账户同步提现</p><p>3. 开放站内代理管理功能，同样享受在线代付，商户管理，费率设定等重要功能</p><p>4. 全渠道支持：微信支付宝WAP 微信支付宝扫码 网银在线 QQ钱包 点卡消耗等</p><p>5. 采用全新C语言编写搭配SQL跨平台数据库，运行速度更快更稳定，真正减少掉单机率</p><p>6. 新签5家内部合作通道，支付宝微信扫码费率低至千分之5，网银低至千分之三</p><p>7. 针对部分用户开放D0实时结算功能，我们将以企业QQ发送邀请或邮箱邀请内测体验</p><p><br /></p><p><br /></p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;成都华翔通达网络科技有限公司</p><p><br /></p>', '2017-06-16 17:42:39', '1');

-- ----------------------------
-- Table structure for employee
-- ----------------------------
DROP TABLE IF EXISTS `employee`;
CREATE TABLE `employee` (
  `employeeid` int(50) NOT NULL AUTO_INCREMENT COMMENT '员工编号',
  `powerid` int(50) DEFAULT NULL COMMENT '权限',
  `password` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '密码',
  `phone` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '手机号',
  `address` varchar(100) CHARACTER SET utf8 DEFAULT NULL COMMENT '地址',
  `creationtime` datetime DEFAULT NULL COMMENT '创建时间',
  `email` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '邮箱',
  `account` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '账号',
  `name` varchar(100) CHARACTER SET utf8 DEFAULT NULL COMMENT '名称',
  `iflock` int(2) DEFAULT NULL COMMENT '是否锁定(1、正常，2、锁定)',
  `commission` decimal(11,3) DEFAULT NULL COMMENT '员工提成',
  `haveroyalty` decimal(11,3) DEFAULT NULL COMMENT '已经提成',
  PRIMARY KEY (`employeeid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of employee
-- ----------------------------
INSERT INTO `employee` VALUES ('1', '1', 'e10adc3949ba59abbe56e057f20f883e', '18754521921', '烟台海阳', '2013-12-09 14:40:56', '18754521921@139.com', 'admin', '管理员', '1', null, null);

-- ----------------------------
-- Table structure for employee_person
-- ----------------------------
DROP TABLE IF EXISTS `employee_person`;
CREATE TABLE `employee_person` (
  `id` int(50) NOT NULL COMMENT '用户id',
  `employeeid` int(50) DEFAULT NULL COMMENT '员工id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of employee_person
-- ----------------------------
INSERT INTO `employee_person` VALUES ('23', '1');

-- ----------------------------
-- Table structure for gateway
-- ----------------------------
DROP TABLE IF EXISTS `gateway`;
CREATE TABLE `gateway` (
  `gateway_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '网关id',
  `gateway_name` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '网关名称',
  `gateway_merid` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '商户id',
  `gateway_key` varchar(2000) CHARACTER SET utf8 DEFAULT NULL COMMENT '商户key',
  `gateway_channelid` varchar(2000) CHARACTER SET utf8 DEFAULT NULL COMMENT '通道号',
  `gateway_function` int(50) DEFAULT NULL COMMENT '接口方法',
  PRIMARY KEY (`gateway_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1 COMMENT='网关表';

-- ----------------------------
-- Records of gateway
-- ----------------------------
INSERT INTO `gateway` VALUES ('1', '易宝接口', '27', '111111111111111111', null, '1');
INSERT INTO `gateway` VALUES ('20', '汇付恒通', '22', '1111111111111111', null, '20');

-- ----------------------------
-- Table structure for logrecord
-- ----------------------------
DROP TABLE IF EXISTS `logrecord`;
CREATE TABLE `logrecord` (
  `id` int(50) DEFAULT NULL COMMENT '用户id',
  `landingip` varchar(100) DEFAULT NULL COMMENT '登陆ip',
  `landingtime` datetime DEFAULT NULL COMMENT '登陆时间',
  `exittime` datetime DEFAULT NULL COMMENT '退出时间',
  `logid` int(50) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`logid`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of logrecord
-- ----------------------------
INSERT INTO `logrecord` VALUES ('22', '127.0.0.1', '2017-12-26 17:49:08', '2017-12-26 18:20:38', '1');
INSERT INTO `logrecord` VALUES ('22', '127.0.0.1', '2017-12-27 15:46:37', '2017-12-27 15:46:37', '2');
INSERT INTO `logrecord` VALUES ('22', '127.0.0.1', '2017-12-27 16:41:53', '2017-12-27 16:41:53', '3');
INSERT INTO `logrecord` VALUES ('22', '0:0:0:0:0:0:0:1', '2017-12-28 09:36:17', '2017-12-28 09:36:17', '4');
INSERT INTO `logrecord` VALUES ('22', '0:0:0:0:0:0:0:1', '2017-12-28 15:50:21', '2017-12-28 16:48:01', '5');
INSERT INTO `logrecord` VALUES ('22', '0:0:0:0:0:0:0:1', '2017-12-28 17:25:11', '2017-12-28 18:01:02', '6');
INSERT INTO `logrecord` VALUES ('22', '0:0:0:0:0:0:0:1', '2017-12-29 09:31:08', '2017-12-29 09:31:08', '7');
INSERT INTO `logrecord` VALUES ('22', '0:0:0:0:0:0:0:1', '2017-12-29 09:36:55', '2017-12-29 09:36:55', '8');
INSERT INTO `logrecord` VALUES ('22', '0:0:0:0:0:0:0:1', '2017-12-29 09:37:43', '2017-12-29 09:37:43', '9');
INSERT INTO `logrecord` VALUES ('22', '0:0:0:0:0:0:0:1', '2017-12-29 09:39:17', '2017-12-29 09:39:17', '10');
INSERT INTO `logrecord` VALUES ('22', '0:0:0:0:0:0:0:1', '2017-12-29 09:42:40', '2017-12-29 09:51:35', '11');
INSERT INTO `logrecord` VALUES ('23', '0:0:0:0:0:0:0:1', '2017-12-29 09:51:45', '2017-12-29 09:59:29', '12');
INSERT INTO `logrecord` VALUES ('23', '0:0:0:0:0:0:0:1', '2017-12-29 09:59:49', '2017-12-29 09:59:49', '13');
INSERT INTO `logrecord` VALUES ('23', '0:0:0:0:0:0:0:1', '2017-12-29 09:59:49', '2017-12-29 09:59:49', '14');
INSERT INTO `logrecord` VALUES ('23', '0:0:0:0:0:0:0:1', '2017-12-29 09:59:49', '2017-12-29 12:05:21', '15');

-- ----------------------------
-- Table structure for navigation
-- ----------------------------
DROP TABLE IF EXISTS `navigation`;
CREATE TABLE `navigation` (
  `navid` int(50) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `node` int(50) DEFAULT NULL COMMENT '节点是否父子',
  `ownership` int(50) DEFAULT NULL COMMENT '节点归属',
  `url` varchar(200) CHARACTER SET utf8 DEFAULT NULL COMMENT '地址',
  `name` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '名称',
  PRIMARY KEY (`navid`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of navigation
-- ----------------------------
INSERT INTO `navigation` VALUES ('3', '1', '1', '', '订单管理');
INSERT INTO `navigation` VALUES ('4', '2', '3', '/net?pageNum=1&numPerPage=20&netstarttime=&netendtime=&netparticipate=0&netstate=0&netorderid=&netname=&netlock=0', '网银订单');
INSERT INTO `navigation` VALUES ('5', '2', '3', '/card?pageNum=1&numPerPage=20&cardstarttime=&cardendtime=&cardparticipate=0&cardstate=0&cardorderid=&cardname=&cardlock=0', '点卡订单');
INSERT INTO `navigation` VALUES ('6', '1', '1', '', '提现管理');
INSERT INTO `navigation` VALUES ('7', '2', '6', '/refund?pageNum=1&numPerPage=15&refustarttime=&refuendtime=&refustate=0&refuid=&refuname=&settlementauthority=0&refundanother=1', '提现列表');
INSERT INTO `navigation` VALUES ('8', '1', '1', '', '首页新闻');
INSERT INTO `navigation` VALUES ('9', '2', '8', '/dynamic?pageNum=1&numPerPage=20&starttime=&endtime=&title=', '新闻管理');
INSERT INTO `navigation` VALUES ('11', '1', '1', '', '客户管理');
INSERT INTO `navigation` VALUES ('12', '2', '11', '/person?pageNum=1&numPerPage=20&starttime=&endtime=&id=&iflock=0&iflogin=0&ifnet=0', '客户列表');
INSERT INTO `navigation` VALUES ('13', '1', '1', '', '员工管理');
INSERT INTO `navigation` VALUES ('14', '2', '13', '/employee?pageNum=1&numPerPage=20&starttime=&endtime=&id=&iflock=0&employeeid=&powerid=', '员工管理');
INSERT INTO `navigation` VALUES ('15', '2', '13', '/power?pageNum=1&numPerPage=20&powerid=', '权限管理');
INSERT INTO `navigation` VALUES ('17', '1', '1', null, '财务管理');
INSERT INTO `navigation` VALUES ('18', '2', '17', '/statistics/', '财务统计');
INSERT INTO `navigation` VALUES ('19', '2', '3', '/recharge?pageNum=1&numPerPage=20&rechstarttime=&rechendtime=&rechparticipate=0&rechstate=0&rechid=&rechname', '充值订单');
INSERT INTO `navigation` VALUES ('20', '2', '3', '/circlip?pageNum=1&numPerPage=20&circstarttime=&circendtime=&circparticipate=0&circstate=0', '销卡订单');
INSERT INTO `navigation` VALUES ('21', '1', '1', null, '通道管理');
INSERT INTO `navigation` VALUES ('22', '2', '21', '/gateway', '通道管理');
INSERT INTO `navigation` VALUES ('23', '2', '6', '/caifutong?pageNum=1&numPerPage=20', '财付通支付列表');
INSERT INTO `navigation` VALUES ('24', '1', '1', null, '系统设置');
INSERT INTO `navigation` VALUES ('25', '2', '24', '/system', '系统信息');
INSERT INTO `navigation` VALUES ('26', '2', '24', '/system/systemInterface', '系统接口设置');
INSERT INTO `navigation` VALUES ('27', '2', '24', '/system/showSystemQQ?pageNum=1&numPerPage=20', '系统QQ客服');
INSERT INTO `navigation` VALUES ('28', '2', '3', '/phonerecharge?pageNum=1&numPerPage=20&starttime=&endtime=&ret_code=0&sporder_id=', '充值订单');
INSERT INTO `navigation` VALUES ('29', '2', '3', '/transfer?pageNum=1&numPerPage=20&starttime=&endtime=&transfer_id=&pname=&pename=', '转账管理');
INSERT INTO `navigation` VALUES ('30', '2', '3', '/net?pageNum=1&numPerPage=20&netstarttime=&netendtime=&netparticipate=44&netstate=0&netorderid=&netname=&netlock=0', '微信扫码订单');
INSERT INTO `navigation` VALUES ('31', '2', '3', '/net?pageNum=1&numPerPage=20&netstarttime=&netendtime=&netparticipate=49&netstate=0&netorderid=&netname=&netlock=0', '微信WAP订单');
INSERT INTO `navigation` VALUES ('32', '2', '3', '/net?pageNum=1&numPerPage=20&netstarttime=&netendtime=&netparticipate=46&netstate=0&netorderid=&netname=&netlock=0', '支付宝扫码订单');
INSERT INTO `navigation` VALUES ('33', '2', '3', '/net?pageNum=1&numPerPage=20&netstarttime=&netendtime=&netparticipate=45&netstate=0&netorderid=&netname=&netlock=0', '支付宝WAP订单');
INSERT INTO `navigation` VALUES ('34', '2', '3', '/net?pageNum=1&numPerPage=20&netstarttime=&netendtime=&netparticipate=50&netstate=0&netorderid=&netname=&netlock=0', '手机QQ扫码订单');

-- ----------------------------
-- Table structure for onlineorder
-- ----------------------------
DROP TABLE IF EXISTS `onlineorder`;
CREATE TABLE `onlineorder` (
  `sporder_id` varchar(50) NOT NULL COMMENT '手机充值订单号',
  `cardnum` varchar(20) CHARACTER SET utf8 DEFAULT NULL COMMENT '面值',
  `sporder_time` datetime DEFAULT NULL COMMENT '订单时间',
  `game_userid` varchar(20) CHARACTER SET utf8 DEFAULT NULL COMMENT '手机号',
  `md5_str` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT 'MD5后字符串',
  `ret_code` varchar(3) CHARACTER SET utf8 DEFAULT NULL COMMENT '充值后状态',
  `ordersuccesstime` datetime DEFAULT NULL COMMENT '处理时间',
  `err_msg` varchar(20) CHARACTER SET utf8 DEFAULT NULL COMMENT '失败原因',
  PRIMARY KEY (`sporder_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of onlineorder
-- ----------------------------

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `orderid` varchar(50) CHARACTER SET utf8 NOT NULL COMMENT '订单编号',
  `p0_Cmd` varchar(20) CHARACTER SET utf8 NOT NULL COMMENT '业务类型',
  `r1_Code` int(2) NOT NULL COMMENT '支付结果',
  `p1_MerId` int(11) NOT NULL COMMENT '商户编号',
  `r2_TrxId` varchar(100) CHARACTER SET utf8 DEFAULT NULL COMMENT '易宝支付交易流水号',
  `p2_Order` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '商户订单号',
  `p3_Amt` decimal(11,3) DEFAULT NULL COMMENT '支付金额',
  `p4_Cur` varchar(10) CHARACTER SET utf8 NOT NULL COMMENT '交易币种',
  `p5_Pid` varchar(20) CHARACTER SET utf8 DEFAULT NULL COMMENT '商品名称',
  `p6_Pcat` varchar(20) CHARACTER SET utf8 DEFAULT NULL COMMENT '商品种类',
  `p7_Pdesc` varchar(200) CHARACTER SET utf8 DEFAULT NULL COMMENT '商品描述',
  `p8_Url` varchar(200) CHARACTER SET utf8 DEFAULT NULL COMMENT '商户接收支付成功数据的地址',
  `p9_SAF` int(2) DEFAULT NULL COMMENT '送货地址',
  `pa_MP` varchar(200) CHARACTER SET utf8 DEFAULT NULL COMMENT '商户扩展信息',
  `pd_FrpId` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '支付通道编码',
  `open_id` varchar(200) DEFAULT NULL COMMENT '微信open_id',
  `ro_BankOrderId` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '银行订单号',
  `rp_PayDate` datetime DEFAULT NULL COMMENT '支付成功时间',
  `ru_Trxtime` datetime DEFAULT NULL COMMENT '交易结果通知时间',
  `pr_NeedResponse` int(1) DEFAULT NULL COMMENT '应答机制',
  `CreateTime` datetime DEFAULT NULL COMMENT '创建时间',
  `hmac` varchar(32) CHARACTER SET utf8 NOT NULL COMMENT '签名数据',
  `ip` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '用户ip地址',
  `success` int(2) DEFAULT NULL COMMENT '是否反馈',
  `remark` text CHARACTER SET utf8 COMMENT '反馈后得到的内容',
  `amount` decimal(11,3) DEFAULT NULL COMMENT '实际金额',
  `deducted` decimal(11,3) DEFAULT NULL,
  `lock` int(2) DEFAULT NULL COMMENT '是否锁定',
  PRIMARY KEY (`orderid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of orders
-- ----------------------------

-- ----------------------------
-- Table structure for participate
-- ----------------------------
DROP TABLE IF EXISTS `participate`;
CREATE TABLE `participate` (
  `codeid` int(50) NOT NULL AUTO_INCREMENT COMMENT '接入编码id',
  `payable` varchar(100) NOT NULL COMMENT '编码名称',
  `participate` varchar(100) NOT NULL COMMENT '接入代码',
  `paytype` varchar(100) NOT NULL COMMENT '1网银或2点卡',
  `fastmoney_participate` varchar(100) DEFAULT NULL COMMENT '快钱代码',
  `baopay_participate` varchar(100) DEFAULT NULL COMMENT '宝付代码',
  `payment_participate` varchar(100) DEFAULT NULL COMMENT '支付通银行编码',
  `alipay_participate` varchar(100) DEFAULT NULL COMMENT '支付宝银行编码',
  `dinpay_participate` varchar(100) DEFAULT NULL COMMENT '智付银行编码',
  `allinpay_participate` varchar(100) DEFAULT NULL COMMENT '通联手机接口编码',
  `ease_participate` varchar(100) DEFAULT NULL COMMENT '首信易编码',
  `ecpss_participate` varchar(100) DEFAULT NULL COMMENT '汇潮银行编码',
  `ips_participate` varchar(100) DEFAULT NULL COMMENT '环迅编码',
  `w95epay_participate` varchar(100) DEFAULT NULL COMMENT '双乾编码',
  `hundred_participate` varchar(100) DEFAULT NULL COMMENT '101卡编码',
  `shpay_participate` varchar(100) DEFAULT NULL COMMENT '山海编码',
  `jdpay_participate` varchar(100) DEFAULT NULL COMMENT '吉店编码',
  `gopay_participate` varchar(100) DEFAULT NULL COMMENT '国付宝编码',
  `seventy_participate` varchar(100) DEFAULT NULL COMMENT '70卡世界编码',
  `zhipay_participate` varchar(100) DEFAULT NULL COMMENT '新智付编码',
  `zfhuipay_participate` varchar(100) DEFAULT NULL COMMENT '支付汇编码',
  `ysspay_participate` varchar(100) DEFAULT NULL COMMENT '亿汇付编码',
  PRIMARY KEY (`codeid`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of participate
-- ----------------------------
INSERT INTO `participate` VALUES ('1', '工商银行', 'ICBC-NET-B2C', '1', 'ICBC', '1002', '1037', 'ICBCB2C', 'ICBC', 'icbc', null, 'ICBC', '中国工商银行', 'ICBC', 'ICBC-WAP', 'ICBC', null, 'ICBC', '1002', 'ICBC', 'ICBC', 'J_ICBC');
INSERT INTO `participate` VALUES ('2', '招商银行', 'CMBCHINA-NET-B2C', '1', 'CMB', '1001', '1031', 'CMB', 'CMB', 'cmb', '3', 'CMB', '招商银行', 'CMB', 'CMBCHINA-WAP', 'CMB', null, 'CMB', '1001', 'CMB', 'CMB', 'J_CMB');
INSERT INTO `participate` VALUES ('3', '中国农业银行', 'ABC-NET-B2C', '1', 'ABC', '1005', '1005', 'ABC', 'ABC', null, null, 'ABC', '中国农业银行', 'ABC', 'ABC-WAP', 'ABC', null, 'ABC', '1005', 'ABC', 'ABC', 'ABC');
INSERT INTO `participate` VALUES ('4', '建设银行', 'CCB-NET-B2C', '1', 'CCB', '1003', '1034', 'CCB', 'CCB', 'ccb', '4', 'CCB', '中国建设银行', 'CCB', 'CCB-WAP', 'CCB', null, 'CCB', '1003', 'CCB', 'CCB', 'CCB');
INSERT INTO `participate` VALUES ('5', '北京银行', 'BCCB-NET-B2C', '1', 'BOB', '1032', '1032', 'BJBANK', null, null, '50', 'BCCB', '北京银行', '', null, 'BOB', null, 'BOBJ', '1032', null, null, 'BOB');
INSERT INTO `participate` VALUES ('6', '交通银行', 'BOCO-NET-B2C', '1', 'BCOM', '1020', '1020', 'COMM-DEBIT', 'BCOM', 'comm', '67', 'BOCOM', '交通银行', 'BOCOM', null, 'BCOM', null, 'BOCOM', '1020', 'BCOM', 'BCOM', 'BCOM');
INSERT INTO `participate` VALUES ('7', '兴业银行', 'CIB-NET-B2C', '1', 'CIB', '1009', '1009', 'CIB', 'CIB', null, '33', 'CIB', '兴业银行', 'CIB', 'CIB-WAP', 'CIB', null, 'CIB', '1009', 'CIB', 'CIB', 'CIB');
INSERT INTO `participate` VALUES ('8', '南京银行', 'NJCB-NET-B2C', '1', 'NJCB', '1080', '0', 'NJCB', null, null, null, 'UNIONPAY', null, '', null, 'NJCB', null, 'NJCB', null, null, null, 'NJCB');
INSERT INTO `participate` VALUES ('9', '中国民生银行', 'CMBC-NET-B2C', '1', 'CMBC', '1006', '1006', 'CMBC', 'CMBC', null, null, 'CMBC', '民生银行', 'CMBC', 'CMBC-WAP', 'CMBC', null, 'CMBC', '1006', 'CMBC', 'CMBC', 'CMBC');
INSERT INTO `participate` VALUES ('10', '光大银行', 'CEB-NET-B2C', '1', 'CEB', '1022', '1022', 'CEBBANK', 'CEBB', 'ceb', '74', 'CEB', '中国光大银行', 'CEB', 'CEB-WAP', 'CEB', null, 'CEB', '1022', 'CEBB', 'CEBB', 'CEB');
INSERT INTO `participate` VALUES ('11', '中国银行', 'BOC-NET-B2C', '1', 'BOC', '1026', '1052', 'BOCB2C', 'BOC', 'boc', null, 'BOCSH', '中国银行', 'BOCSH', 'BOC-WAP', 'BOC', null, 'BOC', '1052', 'BOC', 'BOC', 'BOC');
INSERT INTO `participate` VALUES ('12', '平安银行', 'PINGANBANK-NET', '1', 'PAB', '1035', '1010', 'SPABANK', 'SPABANK', null, '14', 'PAB', '平安银行', '', 'PINGANBANK-WAP', 'PAB', null, 'PAB', '1010', 'SPABANK', 'SPABANK', 'PAB');
INSERT INTO `participate` VALUES ('13', '渤海银行', 'CBHB-NET-B2C', '1', 'CBHB', '1034', '0', 'BOHAIB', null, null, '83', 'UNIONPAY', null, '', null, 'CBHB', null, '', null, null, null, 'CBHB');
INSERT INTO `participate` VALUES ('14', '东亚银行', 'HKBEA-NET-B2C', '1', 'BEA', '1033', '0', 'HKBEA', 'BEA', null, null, 'UNIONPAY', null, '', null, 'BEA', null, '', null, 'BEA', 'BEA', 'BEA');
INSERT INTO `participate` VALUES ('15', '宁波银行', 'NBCB-NET-B2C', '1', 'NBCB', '1046', '0', 'NBBANK', null, null, null, 'UNIONPAY', null, '', null, 'NBCB', null, 'NBCB', null, null, null, 'NBCB');
INSERT INTO `participate` VALUES ('16', '中信银行', 'ECITIC-NET-B2C', '1', 'CITIC', '1039', '1021', 'CITIC', 'ECITIC', null, null, 'CNCB', '中信银行', 'CNCB', 'ECITIC-WAP', 'CITIC', null, 'CITIC', '1021', 'ECITIC', 'ECITIC', 'CITIC');
INSERT INTO `participate` VALUES ('17', '深圳发展银行', 'SDB-NET-B2C', '1', 'SDB', '1080', '1008', 'SPABANK', 'SDB', null, null, 'UNIONPAY', '深圳发展银行', '', null, 'SDB', null, '', '1008', 'SDB', 'SDB', 'SDB');
INSERT INTO `participate` VALUES ('18', '广发银行', 'GDB-NET-B2C', '1', 'GDB', '1036', '1027', 'GDB', 'GDB', null, null, 'GDB', '广东发展银行', 'GDB', 'GDB-WAP', 'GDB', null, 'GDB', '1027', 'GDB', 'GDB', 'GDB');
INSERT INTO `participate` VALUES ('19', '上海银行', 'SHB-NET-B2C', '1', 'SHB', '1059', '0', 'SHBANK', null, null, null, 'BOS', null, '', 'SHB-WAP', 'SHB', null, 'BOS', '1024', null, null, 'SHB');
INSERT INTO `participate` VALUES ('20', '上海浦东发展银行', 'SPDB-NET-B2C', '1', 'SPDB', '1004', '1004', 'SPDB', 'SPDB', null, '69', 'SPDB', '浦东发展银行', 'SPDB', 'SPDB-WAP', 'SPDB', null, 'SPDB', '1004', 'SPDB', 'SPDB', 'SPDB');
INSERT INTO `participate` VALUES ('22', '中国邮政', 'POST-NET-B2C', '1', 'PSBC', '1038', '0', 'POSTGC', 'PSBC', null, null, 'PSBC', '邮政储蓄', 'PSBC', null, 'PSBC', null, 'PSBC', '1028', 'PSBC', 'PSBC', 'PSBC');
INSERT INTO `participate` VALUES ('23', '北京农村商业银行', 'BJRCB-NET-B2C', '1', 'BJRCB', '1080', '0', 'BJRCB', null, null, null, 'UNIONPAY', null, '', null, 'BJRCB', null, '', null, null, null, 'BJRCB');
INSERT INTO `participate` VALUES ('24', '浙商银行', 'CZ-NET-B2C', '1', 'CZB', '1080', '0', 'CZBANK', null, null, null, 'UNIONPAY', null, '', null, 'CZB', null, '', null, null, null, 'CZB');
INSERT INTO `participate` VALUES ('25', '杭州银行', 'HZBANK-NET-B2C', '1', 'HZB', '1080', '0', 'HZCBB2C', null, null, null, 'UNIONPAY', null, '', null, 'HZB', null, '', null, null, null, 'HZB');
INSERT INTO `participate` VALUES ('26', '上海农商银行', 'SRCB-NET-B2C', '1', 'SRCB', '1037', '0', 'SHRCB', null, null, null, 'SRCB', null, '', null, 'SRCB', null, '', null, null, null, 'SRCB');
INSERT INTO `participate` VALUES ('27', '南洋商业银行', 'NCBBANK-NET-B2C', '1', 'UPOP', '1080', '0', 'NCBANK', null, null, null, 'UNIONPAY', null, '', null, 'UPOP', null, '', null, null, null, 'UPOP');
INSERT INTO `participate` VALUES ('28', '河北银行', 'SCCB-NET-B2C', '1', 'UPOP', '1048', '0', 'BHB', null, null, null, 'UNIONPAY', null, '', null, 'UPOP', null, '', null, null, null, 'UPOP');
INSERT INTO `participate` VALUES ('29', '泰隆银行', 'ZJTLCB-NET-B2C', '1', 'UPOP', '1080', '0', 'ZJTLCB', null, null, null, 'UNIONPAY', null, '', null, 'UPOP', null, '', null, null, null, 'UPOP');
INSERT INTO `participate` VALUES ('30', '骏网一卡通', '000501', '2', null, null, null, null, null, null, null, '', null, '', null, null, null, null, null, null, null, null);
INSERT INTO `participate` VALUES ('31', '盛大卡', '000601', '2', null, null, null, null, null, null, null, '', null, '', null, null, null, null, null, null, null, null);
INSERT INTO `participate` VALUES ('32', '神州行', '000101', '2', null, null, null, null, null, null, null, '', null, '', null, null, null, null, null, null, null, null);
INSERT INTO `participate` VALUES ('33', '征途卡', '000901', '2', null, null, null, null, null, null, null, '', null, '', null, null, null, null, null, null, null, null);
INSERT INTO `participate` VALUES ('34', 'Q币卡', '000701', '2', null, null, null, null, null, null, null, '', null, '', null, null, null, null, null, null, null, null);
INSERT INTO `participate` VALUES ('35', '联通卡', '000201', '2', null, null, null, null, null, null, null, '', null, '', null, null, null, null, null, null, null, null);
INSERT INTO `participate` VALUES ('36', '久游卡', '001201', '2', null, null, null, null, null, null, null, '', null, '', null, null, null, null, null, null, null, null);
INSERT INTO `participate` VALUES ('37', '网易卡', '001001', '2', null, null, null, null, null, null, null, '', null, '', null, null, null, null, null, null, null, null);
INSERT INTO `participate` VALUES ('38', '完美卡', '000801', '2', null, null, null, null, null, null, null, '', null, '', null, null, null, null, null, null, null, null);
INSERT INTO `participate` VALUES ('39', '搜狐卡', '001101', '2', null, null, null, null, null, null, null, '', null, '', null, null, null, null, null, null, null, null);
INSERT INTO `participate` VALUES ('40', '电信卡', '000301', '2', null, null, null, null, null, null, null, '', null, '', null, null, null, null, null, null, null, null);
INSERT INTO `participate` VALUES ('41', '纵游一卡通', '001601', '2', null, null, null, null, null, null, null, '', null, '', null, null, null, null, null, null, null, null);
INSERT INTO `participate` VALUES ('42', '天下一卡通', '001401', '2', null, null, null, null, null, null, null, '', null, '', null, null, null, null, null, null, null, null);
INSERT INTO `participate` VALUES ('43', '天宏一卡通', '001301', '2', null, null, null, null, null, null, null, '', null, '', null, null, null, null, null, null, null, null);
INSERT INTO `participate` VALUES ('44', '微信扫码支付', 'weixin', '1', null, null, null, null, 'weixin_scan', null, null, null, null, null, 'WeiXin', 'weixin', '02_00_0701', null, '2001', 'weixin_scan', 'weixin_scan', 'wxpay_scan');
INSERT INTO `participate` VALUES ('45', '支付宝WAP支付', 'alipaywap', '1', null, null, null, 'alipaywap', null, null, null, null, null, null, 'alipaywap', 'zfb52', '01_00_0701', null, '2007', 'alipay_h5', 'alipay_h5', '');
INSERT INTO `participate` VALUES ('46', '支付宝扫码支付', 'alipay', '1', null, null, null, null, 'alipay_scan', null, null, null, null, null, 'alipay', 'zfb34', null, null, '2003', 'alipay_scan', 'alipay_scan', 'alipay_scan');
INSERT INTO `participate` VALUES ('47', '财付通扫码支付', 'tenpay', '1', null, null, null, null, '', null, null, null, null, null, 'tenpay', 'cft', null, null, '2008', 'tenpay_scan', 'tenpay_scan', '');
INSERT INTO `participate` VALUES ('48', '财付通WAP支付', 'tenpaywap', '1', null, null, null, null, null, null, null, null, null, null, 'tenpaywap', null, null, null, '2009', null, null, null);
INSERT INTO `participate` VALUES ('49', '微信WAP支付', 'wxwap', '1', null, null, null, null, null, null, null, null, null, null, 'wxwap', 'wxwap', null, null, '2005', 'wxpub_pay', 'wxpub_pay', '');
INSERT INTO `participate` VALUES ('50', '手机QQ扫码支付', 'qqcode', '1', null, null, null, null, 'tenpay_scan', null, null, null, null, null, null, 'qqmobile', '010500_00_0701', null, '2008', 'tenpay_scan', 'tenpay_scan', '');
INSERT INTO `participate` VALUES ('51', '手机QQ钱包支付', 'qqwap', '1', null, null, null, null, null, null, null, null, null, null, null, null, '010500_01_0702', null, '2009', null, null, null);
INSERT INTO `participate` VALUES ('52', '微信条码支付', 'weixincode', '1', null, null, null, null, null, null, null, null, null, null, null, null, '02_01_0702', null, null, null, null, null);
INSERT INTO `participate` VALUES ('53', '支付宝条码支付', 'alipaycode', '1', null, null, null, null, null, null, null, null, null, null, null, null, '01_01_0702', null, null, null, null, null);
INSERT INTO `participate` VALUES ('54', '华夏银行', 'HXBC-NET-B2C', '1', null, null, null, null, null, null, null, null, null, null, null, null, null, 'HXBC', '1025', null, null, null);
INSERT INTO `participate` VALUES ('55', '中国电信充值卡(大面值)', '002501', '2', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `participate` VALUES ('56', '天下一卡通（专项卡）', '001801', '2', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `participate` VALUES ('57', '神州行全国卡(大面值)', '001901', '2', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `participate` VALUES ('58', '神州行地方卡(浙江)', '002001', '2', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `participate` VALUES ('59', '神州行地方卡(福建)', '002101', '2', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `participate` VALUES ('60', '神州行地方卡(广东)', '002201', '2', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `participate` VALUES ('61', '神州行地方卡(辽宁)', '002301', '2', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `participate` VALUES ('62', '32一卡通', '002401', '2', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `participate` VALUES ('63', '纵游一卡通', '001701', '2', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for payment
-- ----------------------------
DROP TABLE IF EXISTS `payment`;
CREATE TABLE `payment` (
  `id` int(50) NOT NULL COMMENT '用户id',
  `payment` varchar(100) CHARACTER SET utf8 NOT NULL COMMENT '支付密码',
  `key` varchar(100) CHARACTER SET utf8 NOT NULL COMMENT '密钥',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of payment
-- ----------------------------
INSERT INTO `payment` VALUES ('22', '14e1b600b1fd579f47433b88e8d85291', 'dG0fKUNaLOUueASPYj8XzHpIegOCTFxc');
INSERT INTO `payment` VALUES ('23', '14e1b600b1fd579f47433b88e8d85291', 'uRO0uQo1m26Uk8Sp0iMMP7CWIe5q5AVL');

-- ----------------------------
-- Table structure for person
-- ----------------------------
DROP TABLE IF EXISTS `person`;
CREATE TABLE `person` (
  `id` int(50) NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `email` varchar(50) CHARACTER SET utf8 NOT NULL COMMENT '邮箱',
  `password` varchar(100) CHARACTER SET utf8 NOT NULL COMMENT '用户密码',
  `webName` varchar(100) CHARACTER SET utf8 NOT NULL COMMENT '网站名称',
  `website` varchar(100) CHARACTER SET utf8 NOT NULL COMMENT '网站网址',
  `herolist` int(2) NOT NULL COMMENT '0党政机关、1商业、2制造业、3服务业、4农业牧渔也、5其它行业',
  `huge` int(2) NOT NULL COMMENT '1企业、0个人',
  `name` varchar(100) CHARACTER SET utf8 NOT NULL COMMENT '名称（企业写企业名称，个人写个人姓名）',
  `contacts` varchar(100) CHARACTER SET utf8 NOT NULL COMMENT '联系人名称',
  `idcard` varchar(100) CHARACTER SET utf8 NOT NULL COMMENT '身份证，如果是企业的话是营业执照licence',
  `address` varchar(100) CHARACTER SET utf8 NOT NULL COMMENT '联系地址',
  `phone` varchar(12) CHARACTER SET utf8 NOT NULL COMMENT '手机号码',
  `qq` varchar(20) CHARACTER SET utf8 NOT NULL COMMENT '用户QQ号码',
  `time` datetime NOT NULL COMMENT '注册时间',
  `iflogin` int(2) DEFAULT NULL COMMENT '是否登录(1、登录2、未登录)',
  `iflock` int(2) DEFAULT NULL COMMENT '是否锁定(1、正常，2、锁定)',
  `ifnet` int(2) DEFAULT NULL COMMENT '是否开通网银（1、开通，2、未开通）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of person
-- ----------------------------
INSERT INTO `person` VALUES ('22', '123456@qq.com', 'e10adc3949ba59abbe56e057f20f883e', '华翔网络', 'www.miaojiesuan.net', '1', '1', '成都华翔网络科技有限公司', '华翔网络', '005101062013696', '成都市', '15508423999', '123456', '2013-12-05 16:14:33', '2', '1', '1');
INSERT INTO `person` VALUES ('23', '1234567@qq.com', 'e10adc3949ba59abbe56e057f20f883e', '测试', 'http://123.com', '0', '1', '12345678902', '123', '12345678902', '12345678902', '12345678902', '12345678902', '2017-12-29 09:51:18', '2', '1', '1');

-- ----------------------------
-- Table structure for person_gateway
-- ----------------------------
DROP TABLE IF EXISTS `person_gateway`;
CREATE TABLE `person_gateway` (
  `id` int(50) NOT NULL COMMENT '用户id',
  `gateway_id` int(11) DEFAULT NULL COMMENT '网关id',
  `title` varchar(1000) CHARACTER SET utf8 DEFAULT NULL COMMENT '通道文字',
  `titletime` varchar(100) CHARACTER SET utf8 DEFAULT NULL COMMENT '通道提交时间（毫秒）',
  `paygete_id1` int(11) DEFAULT NULL COMMENT '充值1',
  `paygete_id2` int(11) DEFAULT NULL,
  `paygete_id3` int(11) DEFAULT NULL,
  `paygete_id4` int(11) DEFAULT NULL,
  `paygete_id5` int(11) DEFAULT NULL,
  `weixin_id` int(11) DEFAULT NULL,
  `wxwap_id` int(11) DEFAULT NULL,
  `alipay_id` int(11) DEFAULT NULL,
  `alipaywap_id` int(11) DEFAULT NULL,
  `tenpay_id` int(11) DEFAULT NULL,
  `tenpaywap_id` int(11) DEFAULT NULL,
  `qqwap_id` int(11) DEFAULT NULL,
  `qqcode_id` int(11) DEFAULT NULL,
  `card_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of person_gateway
-- ----------------------------
INSERT INTO `person_gateway` VALUES ('22', '5', '请勿重复提交订单，如网络延迟请稍后再试', '10', '16', '16', '16', '16', '16', '5', '24', '25', '25', '6', '16', '16', '16', '16');
INSERT INTO `person_gateway` VALUES ('23', '1', '66', '6666', '20', '20', '20', '20', '20', '1', '1', '1', '1', '20', '1', '1', '1', '1');

-- ----------------------------
-- Table structure for power
-- ----------------------------
DROP TABLE IF EXISTS `power`;
CREATE TABLE `power` (
  `powerid` int(50) NOT NULL AUTO_INCREMENT COMMENT '权限id',
  `name` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '名称',
  `explain` varchar(100) CHARACTER SET utf8 DEFAULT NULL COMMENT '说明',
  PRIMARY KEY (`powerid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of power
-- ----------------------------
INSERT INTO `power` VALUES ('1', '最高管理员', '至高无上');
INSERT INTO `power` VALUES ('3', '代理部', '');
INSERT INTO `power` VALUES ('4', '商务部', '商户部');

-- ----------------------------
-- Table structure for powerid_navid
-- ----------------------------
DROP TABLE IF EXISTS `powerid_navid`;
CREATE TABLE `powerid_navid` (
  `powerid` int(50) DEFAULT NULL COMMENT '权限',
  `navid` int(50) DEFAULT NULL COMMENT '列表id'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of powerid_navid
-- ----------------------------
INSERT INTO `powerid_navid` VALUES ('1', '3');
INSERT INTO `powerid_navid` VALUES ('1', '4');
INSERT INTO `powerid_navid` VALUES ('1', '5');
INSERT INTO `powerid_navid` VALUES ('1', '6');
INSERT INTO `powerid_navid` VALUES ('1', '7');
INSERT INTO `powerid_navid` VALUES ('1', '8');
INSERT INTO `powerid_navid` VALUES ('1', '9');
INSERT INTO `powerid_navid` VALUES ('1', '10');
INSERT INTO `powerid_navid` VALUES ('1', '11');
INSERT INTO `powerid_navid` VALUES ('1', '12');
INSERT INTO `powerid_navid` VALUES ('1', '13');
INSERT INTO `powerid_navid` VALUES ('1', '14');
INSERT INTO `powerid_navid` VALUES ('1', '15');
INSERT INTO `powerid_navid` VALUES ('1', '16');
INSERT INTO `powerid_navid` VALUES ('1', '17');
INSERT INTO `powerid_navid` VALUES ('1', '18');
INSERT INTO `powerid_navid` VALUES ('1', '19');
INSERT INTO `powerid_navid` VALUES ('1', '20');
INSERT INTO `powerid_navid` VALUES ('1', '21');
INSERT INTO `powerid_navid` VALUES ('1', '22');
INSERT INTO `powerid_navid` VALUES ('1', '23');
INSERT INTO `powerid_navid` VALUES ('1', '25');
INSERT INTO `powerid_navid` VALUES ('1', '26');
INSERT INTO `powerid_navid` VALUES ('1', '24');
INSERT INTO `powerid_navid` VALUES ('1', '27');
INSERT INTO `powerid_navid` VALUES ('1', '28');
INSERT INTO `powerid_navid` VALUES ('1', '29');
INSERT INTO `powerid_navid` VALUES ('1', '30');
INSERT INTO `powerid_navid` VALUES ('1', '31');
INSERT INTO `powerid_navid` VALUES ('1', '32');
INSERT INTO `powerid_navid` VALUES ('1', '33');
INSERT INTO `powerid_navid` VALUES ('1', '34');
INSERT INTO `powerid_navid` VALUES ('3', '3');
INSERT INTO `powerid_navid` VALUES ('3', '4');
INSERT INTO `powerid_navid` VALUES ('3', '5');
INSERT INTO `powerid_navid` VALUES ('3', '19');
INSERT INTO `powerid_navid` VALUES ('3', '20');
INSERT INTO `powerid_navid` VALUES ('3', '28');
INSERT INTO `powerid_navid` VALUES ('3', '29');
INSERT INTO `powerid_navid` VALUES ('3', '30');
INSERT INTO `powerid_navid` VALUES ('3', '31');
INSERT INTO `powerid_navid` VALUES ('3', '32');
INSERT INTO `powerid_navid` VALUES ('3', '33');
INSERT INTO `powerid_navid` VALUES ('3', '34');
INSERT INTO `powerid_navid` VALUES ('3', '11');
INSERT INTO `powerid_navid` VALUES ('3', '12');

-- ----------------------------
-- Table structure for rate
-- ----------------------------
DROP TABLE IF EXISTS `rate`;
CREATE TABLE `rate` (
  `id` int(50) NOT NULL COMMENT '用户id',
  `banking` decimal(11,3) DEFAULT NULL COMMENT '网银支付',
  `weixin` decimal(11,3) DEFAULT NULL COMMENT '微信扫码',
  `wxwap` decimal(11,3) DEFAULT NULL COMMENT '微信WAP',
  `alipay` decimal(11,3) DEFAULT NULL COMMENT '支付宝扫码',
  `alipaywap` decimal(11,3) DEFAULT NULL COMMENT '支付宝WAP',
  `tenpay` decimal(11,3) DEFAULT NULL COMMENT '财付通扫码',
  `tenpaywap` decimal(11,3) DEFAULT NULL COMMENT '财付通WAP',
  `qqcode` decimal(11,3) DEFAULT NULL COMMENT 'qq扫码',
  `qqwap` decimal(11,3) DEFAULT NULL COMMENT 'qq钱包',
  `netease` decimal(11,3) DEFAULT NULL COMMENT '网易一卡通',
  `travel` decimal(11,3) DEFAULT NULL COMMENT '久游一卡通',
  `qqcoins` decimal(11,3) DEFAULT NULL COMMENT 'QQ币充值卡',
  `journey` decimal(11,3) DEFAULT NULL COMMENT '征途游戏卡',
  `grand` decimal(11,3) DEFAULT NULL COMMENT '盛大一卡通',
  `theworld` decimal(11,3) DEFAULT NULL COMMENT '天下一卡通',
  `perfect` decimal(11,3) DEFAULT NULL COMMENT '完美一卡通',
  `chinaunicom` decimal(11,3) DEFAULT NULL COMMENT '联通充值卡',
  `tianhong` decimal(11,3) DEFAULT NULL COMMENT '天宏一卡通',
  `sohu` decimal(11,3) DEFAULT NULL COMMENT '搜狐一卡通',
  `junwang` decimal(11,3) DEFAULT NULL COMMENT '骏网一卡通',
  `shenzhouxing` decimal(11,3) DEFAULT NULL COMMENT '全国神州行',
  `telecom` decimal(11,3) DEFAULT NULL COMMENT '电信充值卡',
  `longitudinal` decimal(11,3) DEFAULT NULL COMMENT '纵游一卡通',
  `thirtytwo` decimal(11,3) DEFAULT NULL COMMENT '32一卡通',
  `refund` decimal(11,3) DEFAULT NULL COMMENT '退款',
  `dfrefund` decimal(11,3) DEFAULT NULL COMMENT '代付提现',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of rate
-- ----------------------------
INSERT INTO `rate` VALUES ('22', '0.985', '0.999', '0.999', '0.999', '0.999', '0.999', '0.999', '0.999', '0.980', '0.860', '0.810', '0.820', '0.850', '0.865', '0.850', '0.850', '0.950', '0.840', '0.850', '0.855', '0.965', '0.850', '0.960', '0.980', '0.200', '5.000');
INSERT INTO `rate` VALUES ('23', '0.990', '0.990', '0.990', '0.990', '0.990', '0.990', '0.990', '0.990', '0.990', '0.990', '0.810', '0.820', '0.850', '0.865', '0.850', '0.850', '0.950', '0.840', '0.850', '0.855', '0.965', '0.960', '0.850', '0.850', '2.000', '5.000');

-- ----------------------------
-- Table structure for recharge
-- ----------------------------
DROP TABLE IF EXISTS `recharge`;
CREATE TABLE `recharge` (
  `rechargeid` varchar(50) CHARACTER SET utf8 NOT NULL COMMENT '订单编号',
  `p0_Cmd` varchar(20) CHARACTER SET utf8 NOT NULL COMMENT '业务类型',
  `r1_Code` int(2) NOT NULL COMMENT '支付结果',
  `p1_MerId` int(11) NOT NULL COMMENT '商户编号',
  `r2_TrxId` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '易宝支付交易流水号',
  `p2_Order` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '商户订单号',
  `p3_Amt` decimal(11,3) DEFAULT NULL COMMENT '支付金额',
  `p4_Cur` varchar(10) CHARACTER SET utf8 NOT NULL COMMENT '交易币种',
  `p5_Pid` varchar(20) CHARACTER SET utf8 DEFAULT NULL COMMENT '商品名称',
  `p6_Pcat` varchar(20) CHARACTER SET utf8 DEFAULT NULL COMMENT '商品种类',
  `p7_Pdesc` varchar(20) CHARACTER SET utf8 DEFAULT NULL COMMENT '商品描述',
  `p8_Url` varchar(200) CHARACTER SET utf8 DEFAULT NULL COMMENT '商户接收支付成功数据的地址',
  `p9_SAF` int(2) DEFAULT NULL COMMENT '送货地址',
  `pa_MP` varchar(200) CHARACTER SET utf8 DEFAULT NULL COMMENT '商户扩展信息',
  `pd_FrpId` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '支付通道编码',
  `ro_BankOrderId` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '银行订单号',
  `rp_PayDate` datetime DEFAULT NULL COMMENT '支付成功时间',
  `ru_Trxtime` datetime DEFAULT NULL COMMENT '交易结果通知时间',
  `pr_NeedResponse` int(1) DEFAULT NULL COMMENT '应答机制',
  `CreateTime` datetime DEFAULT NULL COMMENT '创建时间',
  `hmac` varchar(32) CHARACTER SET utf8 NOT NULL COMMENT '签名数据',
  `ip` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '用户ip地址',
  `success` int(2) DEFAULT NULL COMMENT '是否反馈',
  `amount` decimal(11,3) DEFAULT NULL COMMENT '实际金额',
  `deducted` decimal(11,3) DEFAULT NULL,
  `lock` int(2) DEFAULT NULL COMMENT '是否锁定',
  PRIMARY KEY (`rechargeid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of recharge
-- ----------------------------

-- ----------------------------
-- Table structure for refund
-- ----------------------------
DROP TABLE IF EXISTS `refund`;
CREATE TABLE `refund` (
  `refund_id` varchar(50) CHARACTER SET utf8 NOT NULL COMMENT '退款订单id',
  `refund_amount` decimal(11,3) DEFAULT NULL COMMENT '退款金额',
  `refund_types` int(2) DEFAULT NULL COMMENT '退款账户类型',
  `refund_another` int(2) NOT NULL DEFAULT '1' COMMENT '体现或代付',
  `createtime` datetime DEFAULT NULL COMMENT '申请时间',
  `explain` varchar(100) CHARACTER SET utf8 DEFAULT NULL COMMENT '退款说明',
  `refund_state` int(2) DEFAULT NULL COMMENT '退款状态',
  `id` int(50) DEFAULT NULL COMMENT '用户id',
  `settlementauthority` int(2) DEFAULT NULL COMMENT '提现权限',
  `refund_actual` decimal(11,3) DEFAULT NULL COMMENT '实际金额',
  `refund_fees` decimal(11,3) DEFAULT NULL COMMENT '手续费',
  `account_name` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '开户姓名/真实姓名',
  `branch` varchar(100) CHARACTER SET utf8 DEFAULT NULL COMMENT '开户支行/网络账号类型',
  `account` varchar(100) CHARACTER SET utf8 DEFAULT NULL COMMENT '账号',
  `net_name` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '银行名字/网络账号名字',
  `branchsheng` varchar(100) CHARACTER SET utf8 DEFAULT NULL COMMENT '收款人开户行的省名',
  `branchshi` varchar(100) CHARACTER SET utf8 DEFAULT NULL COMMENT '收款人开户行的市名',
  PRIMARY KEY (`refund_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of refund
-- ----------------------------
INSERT INTO `refund` VALUES ('TX2017123621012694011854622', '66.000', '1', '1', '2017-12-28 10:11:54', '提现处理中 ', '2', '22', '1', '65.800', '0.200', '华翔网络', '5', '123456789123456', '工商银行', '6', '6');

-- ----------------------------
-- Table structure for settlement_account
-- ----------------------------
DROP TABLE IF EXISTS `settlement_account`;
CREATE TABLE `settlement_account` (
  `id` int(50) NOT NULL COMMENT '用户id',
  `account_types` int(2) DEFAULT NULL COMMENT '账户类型(1.银行，2.网络)',
  `account_name` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '开户姓名/真实姓名',
  `branch` varchar(100) CHARACTER SET utf8 DEFAULT NULL COMMENT '开户支行/网络账号类型',
  `account` varchar(100) CHARACTER SET utf8 DEFAULT NULL COMMENT '账号',
  `codeid` int(50) DEFAULT NULL COMMENT '银行id',
  `branchsheng` varchar(100) CHARACTER SET utf8 DEFAULT NULL COMMENT '收款人开户行的省名',
  `branchshi` varchar(100) CHARACTER SET utf8 DEFAULT NULL COMMENT '收款人开户行的市名'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of settlement_account
-- ----------------------------
INSERT INTO `settlement_account` VALUES ('22', '1', '华翔网络', '5', '123456789123456', '1', '6', '6');

-- ----------------------------
-- Table structure for seventycard
-- ----------------------------
DROP TABLE IF EXISTS `seventycard`;
CREATE TABLE `seventycard` (
  `id` varchar(50) NOT NULL COMMENT '默认销卡编号',
  `cardcode` varchar(12) DEFAULT NULL COMMENT '卡类代码',
  `cardno` varchar(32) DEFAULT NULL COMMENT '充值卡的卡号',
  `cardpass` varchar(50) DEFAULT NULL COMMENT '充值卡密码',
  `datetime` datetime DEFAULT NULL COMMENT '创建时间',
  `sign` varchar(32) DEFAULT NULL COMMENT '签名（参见Sign计算方法）',
  `billid` varchar(32) DEFAULT NULL COMMENT '欧飞系统生成的相对应的订单号',
  `result` varchar(4) DEFAULT NULL COMMENT '返回代码2001表示成功接收',
  `info` varchar(100) DEFAULT NULL COMMENT '交易情况说明，与result相对应的文字说明。',
  `amount` varchar(11) DEFAULT NULL COMMENT '金额',
  `actual` decimal(11,3) unsigned zerofill DEFAULT NULL COMMENT '实际金额',
  `xml` varchar(500) DEFAULT NULL COMMENT 'xml',
  `accountvalue` decimal(11,3) unsigned zerofill DEFAULT NULL COMMENT '最后结算',
  `memberid` int(50) DEFAULT NULL COMMENT '用户编号',
  `deducted` decimal(11,3) DEFAULT NULL COMMENT '扣除金额',
  `cardid` int(11) DEFAULT NULL COMMENT '卡类id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of seventycard
-- ----------------------------

-- ----------------------------
-- Table structure for seventycode
-- ----------------------------
DROP TABLE IF EXISTS `seventycode`;
CREATE TABLE `seventycode` (
  `codeid` int(11) NOT NULL,
  `payable` varchar(200) DEFAULT NULL,
  `participate` varchar(200) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `rate` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`codeid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of seventycode
-- ----------------------------
INSERT INTO `seventycode` VALUES ('1', '骏网一卡通', 'jw', '4,5,6,10,15,20,30,50,100,200,500', 'junwang');
INSERT INTO `seventycode` VALUES ('2', '盛大一卡通', 'sd', '1,2,3,5,9,10,15,25,30,45,50,100,350,1000', 'grand');
INSERT INTO `seventycode` VALUES ('3', '征途一卡通', 'zt', '5,10,15,20,25,30,50,60,100,300,500,1000', 'journey');
INSERT INTO `seventycode` VALUES ('4', '联通全国充值卡', 'cc', '20,30,50,100', 'chinaunicom');
INSERT INTO `seventycode` VALUES ('5', '久游一卡通', 'jy', '5,10,15,20,25,30,50,100', 'travel');
INSERT INTO `seventycode` VALUES ('6', '网易一卡通', 'wy', '10,15,30,50', 'netease');
INSERT INTO `seventycode` VALUES ('7', '完美一卡通', 'wm', '15,30,50,100', 'perfect');
INSERT INTO `seventycode` VALUES ('8', '搜狐一卡通', 'sh', '5,15,30,40,100', 'sohu');
INSERT INTO `seventycode` VALUES ('9', '纵游一卡通', 'zy', '10,15,30,50,100', 'longitudinal');
INSERT INTO `seventycode` VALUES ('10', '天下一卡通', 'tx', '10,20,30,40,50,60,70,80,90,100', 'theworld');
INSERT INTO `seventycode` VALUES ('11', '天宏一卡通', 'th', '5,10,15,30,50,100', 'tianhong');
INSERT INTO `seventycode` VALUES ('12', '天下一卡通（专项卡）', 'txzx', '10,20,30,40,50,60,70,80,90,100', 'theworld');
INSERT INTO `seventycode` VALUES ('13', '光宇一卡通', 'gy', '5,10,20,30,50,100', null);
INSERT INTO `seventycode` VALUES ('14', '中国电信充值卡', 'dx', '10,20,30,50,100', 'telecom');
INSERT INTO `seventycode` VALUES ('15', '中国电信充值卡(大面值)', 'dxb', '200,300,500', 'telecom');
INSERT INTO `seventycode` VALUES ('16', 'QQ卡', 'qq', '5,10,15,20,30,60,100,200', 'qqcoins');
INSERT INTO `seventycode` VALUES ('17', '盛付通卡', 'sft', '1,2,3,4,5,9,10,15,25,30,35,45,50,100,350,1000', null);
INSERT INTO `seventycode` VALUES ('18', '联通全国充值卡(大面值)', 'ccb', '300,500', 'chinaunicom');
INSERT INTO `seventycode` VALUES ('19', '神州行全国卡', 'cm', '10,20,30,50,100', 'shenzhouxing');
INSERT INTO `seventycode` VALUES ('20', '神州行全国卡(大面值)', 'cmb', '200,300,500', 'shenzhouxing');
INSERT INTO `seventycode` VALUES ('21', '神州行地方卡(浙江)', 'cd', '10,20,30,50,100,300', 'shenzhouxing');
INSERT INTO `seventycode` VALUES ('22', '神州行地方卡(福建)', 'cd', '50,100', 'shenzhouxing');
INSERT INTO `seventycode` VALUES ('23', '神州行地方卡(广东)', 'cd', '10,30,50,100,300', 'shenzhouxing');
INSERT INTO `seventycode` VALUES ('24', '神州行地方卡(辽宁)', 'cd', '50,100', 'shenzhouxing');
INSERT INTO `seventycode` VALUES ('25', '32一卡通', 'se', '10,15,20,30,50,60,100', null);

-- ----------------------------
-- Table structure for seventyorders
-- ----------------------------
DROP TABLE IF EXISTS `seventyorders`;
CREATE TABLE `seventyorders` (
  `orderid` varchar(50) NOT NULL COMMENT '订单编号',
  `p0_Cmd` varchar(20) NOT NULL COMMENT '业务类型',
  `r1_Code` int(50) NOT NULL DEFAULT '0' COMMENT '提交状态',
  `p1_MerId` int(11) NOT NULL COMMENT '商户编号',
  `p2_Order` varchar(50) NOT NULL COMMENT '商户订单号',
  `p3_Amt` decimal(11,3) NOT NULL COMMENT '支付金额',
  `p4_verifyAmt` varchar(20) NOT NULL COMMENT '是否较验订单金额',
  `p5_Pid` varchar(30) DEFAULT NULL COMMENT ' 产品名称',
  `p6_Pcat` varchar(30) DEFAULT NULL COMMENT '产品类型',
  `p7_Pdesc` varchar(30) DEFAULT NULL COMMENT '产品描述',
  `p8_Url` varchar(200) DEFAULT NULL COMMENT '商户接收支付成功数据的地址',
  `pa_MP` varchar(50) DEFAULT NULL COMMENT '商户扩展信息',
  `pa7_cardAmt` varchar(100) DEFAULT NULL COMMENT '卡面额',
  `pa8_cardNo` varchar(300) DEFAULT NULL COMMENT '卡号',
  `pa9_cardPwd` varchar(300) DEFAULT NULL COMMENT '卡密',
  `pd_FrpId` varchar(10) DEFAULT NULL COMMENT '支付通道编码',
  `pr_NeedResponse` int(1) DEFAULT NULL COMMENT '应答机制',
  `pz_userId` varchar(50) DEFAULT NULL COMMENT '用户ID',
  `pz1_userRegTime` datetime DEFAULT NULL COMMENT '用户注册时间',
  `CreateTime` datetime DEFAULT NULL COMMENT '创建时间',
  `hmac` varchar(32) NOT NULL COMMENT '签名数据',
  `result` varchar(4) DEFAULT NULL COMMENT '返回代码2001表示成功接收',
  `info` varchar(255) NOT NULL COMMENT '服务商返回情况',
  `ip` varchar(50) DEFAULT NULL COMMENT '用户ip地址',
  `amount` decimal(11,3) DEFAULT NULL COMMENT '实际金额',
  `success` int(2) DEFAULT NULL COMMENT '是否反馈',
  `deducted` decimal(11,3) DEFAULT NULL COMMENT '扣除金额',
  `rq_ReturnMsg` varchar(50) DEFAULT NULL COMMENT '错误代码',
  `lock` int(2) DEFAULT NULL COMMENT '是否被锁定',
  PRIMARY KEY (`orderid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of seventyorders
-- ----------------------------

-- ----------------------------
-- Table structure for singlecard
-- ----------------------------
DROP TABLE IF EXISTS `singlecard`;
CREATE TABLE `singlecard` (
  `orderno` varchar(32) CHARACTER SET utf8 NOT NULL COMMENT '合作伙伴方定单号，要求系统唯一\r\n[注：该字段为字符串，不能有空格，不能任意补０ 合法字符a-z A-Z 0-9，]',
  `cardcode` varchar(12) CHARACTER SET utf8 DEFAULT NULL COMMENT '卡类代码\r\n采用卡类前缀加面值的方式进行组装，比如移动神州行卡前缀为000101，由此前缀加上声明面值组50，得到cardcode为: 00010150, 100元的则为:000101100.',
  `cardno` varchar(32) CHARACTER SET utf8 DEFAULT NULL COMMENT '充值卡的卡号',
  `cardpass` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '充值卡密码\r\n该参数可以使用RSA加密发送。',
  `sign` varchar(32) CHARACTER SET utf8 DEFAULT NULL COMMENT '签名（参见Sign计算方法）',
  `datetime` datetime DEFAULT NULL COMMENT '日期时间，格式：YYYYMMDDHHMMSS，如 20110515080808',
  `billid` varchar(32) CHARACTER SET utf8 DEFAULT NULL COMMENT '欧飞系统生成的相对应的订单号',
  `result` varchar(4) CHARACTER SET utf8 DEFAULT NULL COMMENT '返回代码2001表示成功接收，其他见附录 ',
  `info` varchar(100) CHARACTER SET utf8 DEFAULT NULL COMMENT '交易情况说明，与result相对应的文字说明。',
  `orderid` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '订单编号',
  `value` decimal(11,3) DEFAULT NULL COMMENT '面值',
  `actual` decimal(11,3) DEFAULT NULL COMMENT '实际金额',
  `xml` varchar(500) CHARACTER SET utf8 DEFAULT NULL COMMENT 'xml',
  `accountvalue` decimal(11,3) DEFAULT NULL COMMENT '最后结算',
  `deducted` decimal(11,3) DEFAULT NULL COMMENT '扣除金额',
  `cardid` int(11) DEFAULT NULL COMMENT '卡类id',
  PRIMARY KEY (`orderno`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of singlecard
-- ----------------------------

-- ----------------------------
-- Table structure for system
-- ----------------------------
DROP TABLE IF EXISTS `system`;
CREATE TABLE `system` (
  `system_id` int(50) NOT NULL AUTO_INCREMENT COMMENT '系统id',
  `system_webName` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '网站名称',
  `system_keyword` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '网站关键字',
  `system_included` longtext CHARACTER SET utf8 COMMENT '流量代码',
  `system_filings` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '备案号',
  `system_company` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '公司具体名称',
  `system_firm` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '公司简称',
  `system_address` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '公司地址',
  `system_telephone` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '客服电话',
  `system_smsphone` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '短信接收手机号',
  PRIMARY KEY (`system_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of system
-- ----------------------------
INSERT INTO `system` VALUES ('1', '汇付恒通|致力于快捷支付、点卡回收、微信在线支付畅快体验', '第三方支付,点卡回收,话费卡回收,T0结算通道', 'var cnzz_protocol = ((\"https:\" == document.location.protocol) ? \" https://\" : \" http://\");\r\n	document.write(unescape(\"%3Cspan id=\'cnzz_stat_icon_5805509\'%3E%3C/span%3E%3Cscript src=\'\" + cnzz_protocol + \"s13.cnzz.com/stat.php%3Fid%3D5805509%26show%3Dpic\' type=\'text/javascript\'%3E%3C/script%3E\"));', '蜀ICP备17000687号', '成都华翔通达网络科技有限公司', '秒付宝', '成都市高新区二环路南三段18号1-1幢3层5-1号', '0830-3153101', '15508423999');

-- ----------------------------
-- Table structure for system_interface
-- ----------------------------
DROP TABLE IF EXISTS `system_interface`;
CREATE TABLE `system_interface` (
  `system_interface_id` int(50) NOT NULL AUTO_INCREMENT COMMENT '系统接口id',
  `system_interface_usercode` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '殴飞合作账号',
  `system_interface_md5key` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '殴飞密钥',
  `system_interface_fastmoneykey` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '块钱证书密码',
  `system_interface_caifutongemial` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '财付通账号',
  `system_interface_alipayemail` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '支付宝账号',
  `system_interface_httpurl` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '网站网址',
  `system_interface_smsurl` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '短信接口',
  `system_interface_smsaccount` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '短信接口账号',
  `system_interface_smspassword` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '短信接口密码',
  `system_interface_haousercode` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '浩付点卡',
  `system_interface_haomd5key` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '浩付点卡key',
  `system_interface_channel` int(3) DEFAULT NULL COMMENT '点卡通道',
  `system_interface_person` int(3) DEFAULT NULL COMMENT '注册商户ID',
  PRIMARY KEY (`system_interface_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of system_interface
-- ----------------------------
INSERT INTO `system_interface` VALUES ('1', '1111', '1111', '1111', '1111', '1111', 'http://www.hfht123.com', 'http://sms.106jiekou.com/utf8/sms.aspx', 'hk\\', '42\\', '11', '11', '1', '77001001');

-- ----------------------------
-- Table structure for system_qq
-- ----------------------------
DROP TABLE IF EXISTS `system_qq`;
CREATE TABLE `system_qq` (
  `qq_id` int(50) NOT NULL AUTO_INCREMENT COMMENT 'qqid',
  `qq_number` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT 'QQ号码',
  `qq_name` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT 'qq名称',
  PRIMARY KEY (`qq_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of system_qq
-- ----------------------------
INSERT INTO `system_qq` VALUES ('1', '3002924736', '企业QQ');

-- ----------------------------
-- Table structure for transfer
-- ----------------------------
DROP TABLE IF EXISTS `transfer`;
CREATE TABLE `transfer` (
  `transfer_id` int(50) NOT NULL AUTO_INCREMENT COMMENT '转账id',
  `transfer_usero` int(50) DEFAULT NULL COMMENT '转账账户',
  `transfer_usert` int(50) DEFAULT NULL COMMENT '转账接收账户',
  `transfer_time` datetime DEFAULT NULL COMMENT '转账时间',
  `transfer_explain` varchar(100) CHARACTER SET utf8 DEFAULT NULL COMMENT '转账说明',
  `transfer_amount` decimal(11,3) DEFAULT NULL,
  PRIMARY KEY (`transfer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of transfer
-- ----------------------------
