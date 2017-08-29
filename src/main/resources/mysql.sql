/*
SQLyog Ultimate v12.12 (64 bit)
MySQL - 5.6.35 : Database - test
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`test` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `test`;

/*Table structure for table `grades` */

DROP TABLE IF EXISTS `grades`;

CREATE TABLE `grades` (
  `studentID` int(11) NOT NULL,
  `teacherID` int(11) NOT NULL,
  `subjectID` int(11) NOT NULL,
  `grade` varchar(3) DEFAULT NULL,
  KEY `studentID` (`studentID`,`teacherID`,`subjectID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `grades` */

insert  into `grades`(`studentID`,`teacherID`,`subjectID`,`grade`) values (1,2,1,'A'),(1,2,2,'B'),(7,4,3,'C+'),(7,3,2,'F'),(6,2,1,'B+'),(2,4,3,'C'),(3,4,3,'B');

/*Table structure for table `students` */

DROP TABLE IF EXISTS `students`;

CREATE TABLE `students` (
  `sid` int(11) NOT NULL,
  `NAME` text NOT NULL,
  PRIMARY KEY (`sid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `students` */

insert  into `students`(`sid`,`NAME`) values (1,'Simon'),(2,'Alvin'),(3,'Theo'),(4,'Brittany'),(5,'Jenette'),(6,'Elenor'),(7,'Stu');

/*Table structure for table `subjects` */

DROP TABLE IF EXISTS `subjects`;

CREATE TABLE `subjects` (
  `subid` int(11) NOT NULL,
  `NAME` text NOT NULL,
  PRIMARY KEY (`subid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `subjects` */

insert  into `subjects`(`subid`,`NAME`) values (1,'History'),(2,'Biology'),(3,'SF');

/*Table structure for table `teachers` */

DROP TABLE IF EXISTS `teachers`;

CREATE TABLE `teachers` (
  `tid` int(11) NOT NULL,
  `NAME` text NOT NULL,
  PRIMARY KEY (`tid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `teachers` */

insert  into `teachers`(`tid`,`NAME`) values (1,'Washington'),(2,'Adams'),(3,'Jefferson'),(4,'Lincoln');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
