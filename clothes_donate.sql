/*
SQLyog Ultimate v11.33 (64 bit)
MySQL - 5.1.49-community : Database - clothes_donate
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`clothes_donate` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `clothes_donate`;

/*Table structure for table `t_apply` */

DROP TABLE IF EXISTS `t_apply`;

CREATE TABLE `t_apply` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL COMMENT '用户id',
  `pants_num` int(11) DEFAULT NULL COMMENT '裤子数量',
  `clothes_num` int(11) DEFAULT NULL COMMENT '衣服数量',
  `status` char(1) DEFAULT '0' COMMENT '状态（0-用户申请，1-管理员同意（等待用户寄送衣服），2-用户已经寄出衣服，3-管理员收到衣服并且回执。）',
  `logistics_number` varchar(255) DEFAULT NULL COMMENT '物流单号',
  `logistics_company` varchar(255) DEFAULT NULL COMMENT '物流公司',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `apply_time` varchar(255) DEFAULT NULL COMMENT '申请时间',
  `update_time` varchar(255) DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_apply` */

/*Table structure for table `t_clothes` */

DROP TABLE IF EXISTS `t_clothes`;

CREATE TABLE `t_clothes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type_id` int(11) DEFAULT NULL COMMENT '衣服类型id',
  `desc` varchar(255) DEFAULT NULL COMMENT '衣服描述',
  `user_id` int(11) DEFAULT NULL COMMENT '所属用户id',
  `apply_id` int(11) DEFAULT NULL COMMENT '申请id',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `size` varchar(255) DEFAULT NULL COMMENT '衣服尺寸',
  `color` varchar(255) DEFAULT NULL COMMENT '衣服颜色',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_clothes` */

/*Table structure for table `t_clothes_type` */

DROP TABLE IF EXISTS `t_clothes_type`;

CREATE TABLE `t_clothes_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type_name` varchar(255) DEFAULT NULL COMMENT '衣服类型名字',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `type` char(1) DEFAULT NULL COMMENT '0-衣服，1-裤子，2-其他',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_clothes_type` */

/*Table structure for table `t_user` */

DROP TABLE IF EXISTS `t_user`;

CREATE TABLE `t_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userName` varchar(255) DEFAULT NULL COMMENT '用户名',
  `password` varchar(255) DEFAULT NULL COMMENT '密码',
  `phone` varchar(255) DEFAULT NULL COMMENT '电话',
  `email` varchar(255) DEFAULT NULL COMMENT '邮件',
  `type` char(1) DEFAULT '0' COMMENT '类型（1-管理员，0-普通用户）',
  `create_time` varchar(255) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户名';

/*Data for the table `t_user` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
