/*
SQLyog Ultimate v11.24 (32 bit)
MySQL - 5.5.53 : Database - testshopping
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`testshopping` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `testshopping`;

/*Table structure for table `book` */

DROP TABLE IF EXISTS `book`;

CREATE TABLE `book` (
  `id` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `author` varchar(100) DEFAULT NULL,
  `price` float(8,2) DEFAULT NULL,
  `imageName` varchar(300) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `category_id` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `category_id_fk` (`category_id`),
  CONSTRAINT `category_id_fk` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FKe4psgwi6953wvbqxruna75yax` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `book` */

insert  into `book`(`id`,`name`,`author`,`price`,`imageName`,`description`,`category_id`) values ('29c8552d-9960-4672-9bab-47ad2fffb32e','12312','12312',123123.00,'files/ac6bbdac-d553-4c8a-a01e-e3c90a91950fHadoop技术内幕.jpg','12312312312','893c5acd-7d86-4fea-8872-2fc701e42f21'),('32a65c64-e1a9-4b71-9218-e40aa2b8187a','44444','44444',123.00,'files/d856bf7f-bc64-4119-abba-6e8a5bad9a0f循序渐进Oracle-数据库管理优化与备份恢复.jpg','6666','f3f6f3b2-3d0e-4ecf-bbb8-708ab29f5cf3'),('4028938162f5a03e0162f5a045f70000','asdsad','asdsad',112.00,'files/c2d9de37-dbb5-4b3e-88a0-0550427d628cJavaScript权威指南（第6版）.jpg','xxxxx','893c5acd-7d86-4fea-8872-2fc701e42f21'),('4028938162f794a90162f79792960005','12321','213',123.00,'files/ac6bbdac-d553-4c8a-a01e-e3c90a91950fHadoop技术内幕.jpg','21321','893c5acd-7d86-4fea-8872-2fc701e42f21'),('a2c3e946-8ec8-487c-a0e5-e6624ee5a382','213123','213123',213213.00,'files/c2d9de37-dbb5-4b3e-88a0-0550427d628cJavaScript权威指南（第6版）.jpg','231312adfdsafsf','893c5acd-7d86-4fea-8872-2fc701e42f21');

/*Table structure for table `category` */

DROP TABLE IF EXISTS `category`;

CREATE TABLE `category` (
  `id` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `category` */

insert  into `category`(`id`,`name`,`description`) values ('893c5acd-7d86-4fea-8872-2fc701e42f21','数据结构','佛挡杀佛'),('a2711cc9-1854-4d12-b09c-b9d62351e5e9','程序语言','阿道夫'),('f3f6f3b2-3d0e-4ecf-bbb8-708ab29f5cf3','计算机网络','网络相关');

/*Table structure for table `orderinfo` */

DROP TABLE IF EXISTS `orderinfo`;

CREATE TABLE `orderinfo` (
  `id` varchar(100) NOT NULL,
  `orderId` varchar(100) NOT NULL,
  `num` int(11) DEFAULT NULL,
  `price` float(8,2) DEFAULT NULL,
  `status` int(11) DEFAULT '0',
  `user_id` varchar(100) DEFAULT NULL,
  `createTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `book_id` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `orderId` (`orderId`),
  KEY `user_id_fk` (`user_id`),
  KEY `book_id_fk2` (`book_id`),
  CONSTRAINT `FK6pls811dhxqbx3ljwc1dr9a0x` FOREIGN KEY (`book_id`) REFERENCES `book` (`id`),
  CONSTRAINT `FKggbu7l08g3k6t2nstnsa1gud1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `FKjvc7966pukv9ypc9ug43lqw0u` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `orderinfo` */

insert  into `orderinfo`(`id`,`orderId`,`num`,`price`,`status`,`user_id`,`createTime`,`book_id`) values ('4028938162f6b6a00162f6b72f0a0002','41b9f452d4f0499e8e991f3b20180424',1,123123.00,0,'1ee589b2-13a2-4c9b-a4fd-3e93dfd0a115','2018-04-24 16:15:10','29c8552d-9960-4672-9bab-47ad2fffb32e'),('4028938162f6b6a00162f6b741f60004','34dabf9c900145aca032dd5b20180424',1,123123.00,0,'1ee589b2-13a2-4c9b-a4fd-3e93dfd0a115','2018-04-24 16:15:11','29c8552d-9960-4672-9bab-47ad2fffb32e'),('4028938162f6b6a00162f6b76fb70006','e3b8b365d7394e2ea983906520180424',1,123.00,0,'1ee589b2-13a2-4c9b-a4fd-3e93dfd0a115','2018-04-24 16:15:11','32a65c64-e1a9-4b71-9218-e40aa2b8187a'),('4028938162f6dfc00162f6e377c1000a','60feb7da590e467fb4e735ff20180424',1,123.00,2,'4ce37e2e-3583-40e5-a884-474881fbfac1','2018-04-24 17:02:05','32a65c64-e1a9-4b71-9218-e40aa2b8187a'),('4028938162f6dfc00162f6e3a9e2000e','61faacba6ccf4134b0f6c50220180424',1,112.00,2,'4ce37e2e-3583-40e5-a884-474881fbfac1','2018-04-24 17:02:18','4028938162f5a03e0162f5a045f70000'),('4028938162f6dfc00162f6e44f3e0014','e8bf36d1d74742caa046261b20180424',1,123123.00,2,'4ce37e2e-3583-40e5-a884-474881fbfac1','2018-04-24 17:03:00','29c8552d-9960-4672-9bab-47ad2fffb32e'),('4028938162f78a900162f78bda850000','d2e73e70388b4e3b90ac26af20180424',1,123123.00,1,'4ce37e2e-3583-40e5-a884-474881fbfac1','2018-04-24 20:06:00','29c8552d-9960-4672-9bab-47ad2fffb32e'),('4028938162f794a90162f797d0dd0006','88a87c0a6a7e4578a4ff0ccc20180424',1,213213.00,0,'4ce37e2e-3583-40e5-a884-474881fbfac1','2018-04-24 20:19:04','a2c3e946-8ec8-487c-a0e5-e6624ee5a382');

/*Table structure for table `orderitem` */

DROP TABLE IF EXISTS `orderitem`;

CREATE TABLE `orderitem` (
  `id` varchar(100) NOT NULL,
  `num` int(11) DEFAULT NULL,
  `price` float(8,2) DEFAULT NULL,
  `orderInfo_id` varchar(100) DEFAULT NULL,
  `book_id` varchar(100) DEFAULT NULL,
  `createTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `orderInfo_id_fk` (`orderInfo_id`),
  KEY `book_id_fk` (`book_id`),
  CONSTRAINT `book_id_fk` FOREIGN KEY (`book_id`) REFERENCES `book` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK1ahrocgy5xqgxlcgvie01ymfm` FOREIGN KEY (`book_id`) REFERENCES `book` (`id`),
  CONSTRAINT `FKmkqdppg04t2mb9b9wyre88okn` FOREIGN KEY (`orderInfo_id`) REFERENCES `orderinfo` (`id`),
  CONSTRAINT `orderInfo_id_fk` FOREIGN KEY (`orderInfo_id`) REFERENCES `orderinfo` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `orderitem` */

insert  into `orderitem`(`id`,`num`,`price`,`orderInfo_id`,`book_id`,`createTime`) values ('4028938162f6b6a00162f6b72f1a0003',1,123123.00,'4028938162f6b6a00162f6b72f0a0002','29c8552d-9960-4672-9bab-47ad2fffb32e',NULL),('4028938162f6b6a00162f6b741f60005',1,123123.00,'4028938162f6b6a00162f6b741f60004','29c8552d-9960-4672-9bab-47ad2fffb32e',NULL),('4028938162f6b6a00162f6b76fbd0007',1,123.00,'4028938162f6b6a00162f6b76fb70006','32a65c64-e1a9-4b71-9218-e40aa2b8187a',NULL),('4028938162f6dfc00162f6e377c1000b',1,123.00,'4028938162f6dfc00162f6e377c1000a','32a65c64-e1a9-4b71-9218-e40aa2b8187a','2018-04-24 18:09:35'),('4028938162f6dfc00162f6e3a9e2000f',1,112.00,'4028938162f6dfc00162f6e3a9e2000e','4028938162f5a03e0162f5a045f70000','2018-04-24 18:19:40'),('4028938162f6dfc00162f6e44f3e0015',1,123123.00,'4028938162f6dfc00162f6e44f3e0014','29c8552d-9960-4672-9bab-47ad2fffb32e','2018-04-24 20:19:11'),('4028938162f78a900162f78bdab40001',1,123123.00,'4028938162f78a900162f78bda850000','29c8552d-9960-4672-9bab-47ad2fffb32e','2018-04-24 20:06:16'),('4028938162f794a90162f797d0ec0007',1,213213.00,'4028938162f794a90162f797d0dd0006','a2c3e946-8ec8-487c-a0e5-e6624ee5a382',NULL);

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` varchar(100) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) DEFAULT NULL,
  `cellphone` varchar(20) DEFAULT NULL,
  `mobilephone` varchar(20) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `users` */

insert  into `users`(`id`,`username`,`password`,`cellphone`,`mobilephone`,`address`,`email`) values ('1ee589b2-13a2-4c9b-a4fd-3e93dfd0a115','zhangsan123','123','fafasdasd2132132','dasdasda','123123123','xxxx1111'),('2b7e6269-d8cc-4c06-9aae-1a9c94b9cf4b','你好','123','312321321165156','312321321','123213','123'),('4028938162f72cbc0162f72e264f0007','asdas','asdsad','sadsa','adsdsa','asdasd','asdsadas'),('4028938162f794a90162f79835c80008','cccc','cccc','12321','31232123','12321','21321312'),('4563000a-a78b-4835-9188-6a9984e7ab4a','cfl3','qwe','21321321','3123123123','1232131','2131313'),('4ce37e2e-3583-40e5-a884-474881fbfac1','cfl','123','1111','111','1111','1111'),('b73f46af-526f-48f4-9b73-6ce38434ddae','阿斯顿发生','123','213213','12312321','2132132','3123123'),('c29599a6-e8a2-4b8d-9124-d6e14af21e06','250','123','213213','213213','213213','21321321'),('f1c360b5-0a70-49d2-84c7-2686510f120a','范德萨','123','12312','12312','312321','312323');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
