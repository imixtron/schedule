/*
SQLyog Ultimate v11.11 (64 bit)
MySQL - 5.0.67-community-nt : Database - schedule
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`schedule` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `schedule`;

/*Table structure for table `course` */

DROP TABLE IF EXISTS `course`;

CREATE TABLE `course` (
  `courseid` int(11) NOT NULL default '0',
  `code` varchar(15) default NULL,
  `title` varchar(100) default NULL,
  `hours` varchar(10) default NULL,
  `abbrev` varchar(15) default NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Table structure for table `days` */

DROP TABLE IF EXISTS `days`;

CREATE TABLE `days` (
  `dayid` int(11) NOT NULL default '0',
  `dayname` varchar(20) default NULL,
  PRIMARY KEY  (`dayid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Table structure for table `offeredcourse` */

DROP TABLE IF EXISTS `offeredcourse`;

CREATE TABLE `offeredcourse` (
  `offid` int(11) NOT NULL default '0',
  `secid` int(11) default NULL,
  `courseid` int(11) default NULL,
  `teacherid` int(11) default NULL,
  PRIMARY KEY  (`offid`),
  KEY `FK_SECTION` (`secid`),
  KEY `FK_COURSE` (`courseid`),
  KEY `FK_TEACHER` (`teacherid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Table structure for table `offeredcourse2` */

DROP TABLE IF EXISTS `offeredcourse2`;

CREATE TABLE `offeredcourse2` (
  `offid` int(11) NOT NULL,
  `courseid` int(11) NOT NULL,
  `teacherid` int(11) default NULL
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Table structure for table `room` */

DROP TABLE IF EXISTS `room`;

CREATE TABLE `room` (
  `roomid` int(11) NOT NULL default '0',
  `roomno` varchar(20) default NULL,
  `campus` varchar(20) default NULL,
  `roomtype` varchar(25) default NULL,
  PRIMARY KEY  (`roomid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Table structure for table `schedule` */

DROP TABLE IF EXISTS `schedule`;

CREATE TABLE `schedule` (
  `schid` int(11) NOT NULL auto_increment,
  `offid` int(11) default NULL,
  `slotid` int(11) default NULL,
  `occupied` int(11) default NULL,
  PRIMARY KEY  (`schid`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Table structure for table `section` */

DROP TABLE IF EXISTS `section`;

CREATE TABLE `section` (
  `secid` int(11) NOT NULL default '0',
  `sectionname` varchar(25) default NULL,
  PRIMARY KEY  (`secid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Table structure for table `sectiondetails` */

DROP TABLE IF EXISTS `sectiondetails`;

CREATE TABLE `sectiondetails` (
  `offid` int(11) NOT NULL,
  `secid` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Table structure for table `slots` */

DROP TABLE IF EXISTS `slots`;

CREATE TABLE `slots` (
  `slotid` int(11) NOT NULL auto_increment,
  `dayid` int(11) NOT NULL default '0',
  `slottypeid` int(11) NOT NULL,
  `roomid` int(11) NOT NULL default '0',
  PRIMARY KEY  (`slotid`)
) ENGINE=MyISAM AUTO_INCREMENT=1289 DEFAULT CHARSET=latin1;

/*Table structure for table `slottype` */

DROP TABLE IF EXISTS `slottype`;

CREATE TABLE `slottype` (
  `slottypeid` int(11) NOT NULL,
  `duration` varchar(50) default NULL,
  `slotno` int(11) default NULL,
  `slottype` int(11) default NULL,
  `subslot` int(11) default NULL,
  PRIMARY KEY  (`slottypeid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Table structure for table `teacher` */

DROP TABLE IF EXISTS `teacher`;

CREATE TABLE `teacher` (
  `teacherid` int(11) NOT NULL default '0',
  `teachername` varchar(50) default NULL,
  PRIMARY KEY  (`teacherid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Table structure for table `vschedule` */

DROP TABLE IF EXISTS `vschedule`;

/*!50001 DROP VIEW IF EXISTS `vschedule` */;
/*!50001 DROP TABLE IF EXISTS `vschedule` */;

/*!50001 CREATE TABLE  `vschedule`(
 `schid` int(11) ,
 `offid` int(11) ,
 `teacherid` int(11) ,
 `teachername` varchar(50) ,
 `courseid` int(11) ,
 `title` varchar(100) ,
 `sectionid` varchar(1) ,
 `sectionname` longtext ,
 `slotid` int(11) ,
 `dayid` int(11) ,
 `dayname` varchar(20) ,
 `duration` varchar(50) ,
 `slotno` int(11) ,
 `subslotid` int(11) ,
 `occupied` int(11) ,
 `roomid` int(11) ,
 `roomno` varchar(20) ,
 `campus` varchar(20) ,
 `roomtype` varchar(25) 
)*/;

/*Table structure for table `vschedule2` */

DROP TABLE IF EXISTS `vschedule2`;

/*!50001 DROP VIEW IF EXISTS `vschedule2` */;
/*!50001 DROP TABLE IF EXISTS `vschedule2` */;

/*!50001 CREATE TABLE  `vschedule2`(
 `schid` int(11) ,
 `offid` int(11) ,
 `teacherid` int(11) ,
 `teachername` varchar(50) ,
 `courseid` int(11) ,
 `title` varchar(100) ,
 `secid` int(11) ,
 `sectionname` varchar(25) ,
 `slotid` int(11) ,
 `dayid` int(11) ,
 `dayname` varchar(20) ,
 `duration` varchar(50) ,
 `slotno` int(11) ,
 `subslotid` int(11) ,
 `occupied` int(11) ,
 `roomid` int(11) ,
 `roomno` varchar(20) ,
 `campus` varchar(20) ,
 `roomtype` varchar(25) 
)*/;

/*Table structure for table `vslottype` */

DROP TABLE IF EXISTS `vslottype`;

/*!50001 DROP VIEW IF EXISTS `vslottype` */;
/*!50001 DROP TABLE IF EXISTS `vslottype` */;

/*!50001 CREATE TABLE  `vslottype`(
 `slottypeid` int(11) ,
 `duration` varchar(50) ,
 `slotno` int(11) ,
 `sort` decimal(12,1) ,
 `subslotid` int(11) ,
 `occupied` bigint(20) 
)*/;

/*View structure for view vschedule */

/*!50001 DROP TABLE IF EXISTS `vschedule` */;
/*!50001 DROP VIEW IF EXISTS `vschedule` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vschedule` AS select distinct `s`.`schid` AS `schid`,`s`.`offid` AS `offid`,`t`.`teacherid` AS `teacherid`,`t`.`teachername` AS `teachername`,`c`.`courseid` AS `courseid`,`c`.`title` AS `title`,_utf8'1' AS `sectionid`,(select group_concat(_latin1' ',`l`.`sectionname` separator ',') AS `GROUP_CONCAT(" ", l.sectionname)` from (`section` `l` join `sectiondetails` `p`) where ((`o`.`offid` = `p`.`offid`) and (`p`.`secid` = `l`.`secid`))) AS `sectionname`,`s`.`slotid` AS `slotid`,`d`.`dayid` AS `dayid`,`d`.`dayname` AS `dayname`,`v`.`duration` AS `duration`,`st`.`slotno` AS `slotno`,`v`.`subslotid` AS `subslotid`,`s`.`occupied` AS `occupied`,`r`.`roomid` AS `roomid`,`r`.`roomno` AS `roomno`,`r`.`campus` AS `campus`,`r`.`roomtype` AS `roomtype` from ((((((((((`schedule` `s` join `offeredcourse2` `o`) join `sectiondetails` `sd`) join `section` `sec`) join `teacher` `t`) join `course` `c`) join `slots` `sl`) join `days` `d`) join `vslottype` `st`) join `vslottype` `v`) join `room` `r`) where ((`s`.`offid` = `o`.`offid`) and (`o`.`offid` = `sd`.`offid`) and (`sd`.`secid` = `sec`.`secid`) and (`o`.`teacherid` = `t`.`teacherid`) and (`o`.`courseid` = `c`.`courseid`) and (`s`.`slotid` = `sl`.`slotid`) and (`sl`.`dayid` = `d`.`dayid`) and (`sl`.`slottypeid` = `st`.`subslotid`) and (`sl`.`roomid` = `r`.`roomid`) and (`st`.`slotno` = `v`.`slotno`) and (`s`.`occupied` = `v`.`occupied`)) */;

/*View structure for view vschedule2 */

/*!50001 DROP TABLE IF EXISTS `vschedule2` */;
/*!50001 DROP VIEW IF EXISTS `vschedule2` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vschedule2` AS select `s`.`schid` AS `schid`,`s`.`offid` AS `offid`,`t`.`teacherid` AS `teacherid`,`t`.`teachername` AS `teachername`,`c`.`courseid` AS `courseid`,`c`.`title` AS `title`,`sec`.`secid` AS `secid`,`sec`.`sectionname` AS `sectionname`,`s`.`slotid` AS `slotid`,`d`.`dayid` AS `dayid`,`d`.`dayname` AS `dayname`,`v`.`duration` AS `duration`,`st`.`slotno` AS `slotno`,`v`.`subslotid` AS `subslotid`,`s`.`occupied` AS `occupied`,`r`.`roomid` AS `roomid`,`r`.`roomno` AS `roomno`,`r`.`campus` AS `campus`,`r`.`roomtype` AS `roomtype` from ((((((((((`schedule` `s` join `offeredcourse2` `o`) join `sectiondetails` `sd`) join `section` `sec`) join `teacher` `t`) join `course` `c`) join `slots` `sl`) join `days` `d`) join `vslottype` `st`) join `vslottype` `v`) join `room` `r`) where ((`s`.`offid` = `o`.`offid`) and (`o`.`offid` = `sd`.`offid`) and (`sd`.`secid` = `sec`.`secid`) and (`o`.`teacherid` = `t`.`teacherid`) and (`o`.`courseid` = `c`.`courseid`) and (`s`.`slotid` = `sl`.`slotid`) and (`sl`.`dayid` = `d`.`dayid`) and (`sl`.`slottypeid` = `st`.`subslotid`) and (`sl`.`roomid` = `r`.`roomid`) and (`st`.`slotno` = `v`.`slotno`) and (`s`.`occupied` = `v`.`occupied`)) */;

/*View structure for view vslottype */

/*!50001 DROP TABLE IF EXISTS `vslottype` */;
/*!50001 DROP VIEW IF EXISTS `vslottype` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vslottype` AS select `p`.`slottypeid` AS `slottypeid`,`c`.`duration` AS `duration`,`p`.`slotno` AS `slotno`,`p`.`slottypeid` AS `sort`,`c`.`slottypeid` AS `subslotid`,(case when (`c`.`duration` like _latin1'%00%') then 1 when (`c`.`duration` like _latin1'%45%') then 2 end) AS `occupied` from (`slottype` `p` join `slottype` `c`) where (`p`.`slottypeid` = `c`.`subslot`) union select `x`.`slottypeid` AS `slottypeid`,`x`.`duration` AS `duration`,`x`.`slotno` AS `slotno`,(`x`.`slottypeid` - 0.5) AS `sort`,`x`.`slottypeid` AS `subslotid`,3 AS `occupied` from `slottype` `x` where (`x`.`slottype` = 1) order by `sort`,`occupied` */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
