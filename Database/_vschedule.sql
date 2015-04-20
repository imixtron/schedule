DELIMITER $$

USE `schedule`$$

DROP VIEW IF EXISTS `vschedule`$$

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vschedule` AS 
SELECT DISTINCT
  `s`.`schid`         AS `schid`,
  `s`.`offid`         AS `offid`,
  `t`.`teacherid`     AS `teacherid`,
  `t`.`teachername`   AS `teachername`,
  `c`.`courseid`      AS `courseid`,
  `c`.`title`         AS `title`,
  "1"		      AS sectionid,
  (SELECT GROUP_CONCAT(" ", l.sectionname)
  FROM  `section` l, `sectiondetails` p
  WHERE o.offid = p.offid AND p.secid = l.secid) AS sectionname,
  `s`.`slotid`        AS `slotid`,
  `d`.`dayid`         AS `dayid`,
  `d`.`dayname`       AS `dayname`,
  `v`.`duration`      AS `duration`,
  `st`.`slotno`       AS `slotno`,
  `v`.`subslotid`     AS `subslotid`,
  `s`.`occupied`      AS `occupied`,
  `r`.`roomid`        AS `roomid`,
  `r`.`roomno`        AS `roomno`,
  `r`.`campus`        AS `campus`,
  `r`.`roomtype`      AS `roomtype`
FROM ((((((((((`schedule` `s`
           JOIN `offeredcourse2` `o`)
           JOIN `sectiondetails` `sd`)
          JOIN `section` `sec`)
         JOIN `teacher` `t`)
        JOIN `course` `c`)
       JOIN `slots` `sl`)
      JOIN `days` `d`)
     JOIN `vslottype` `st`)
    JOIN `vslottype` `v`)
   JOIN `room` `r`)
WHERE ((`s`.`offid` = `o`.`offid`)
       AND (`o`.`offid` = `sd`.`offid`)
       AND (`sd`.`secid` = `sec`.`secid`)
       AND (`o`.`teacherid` = `t`.`teacherid`)
       AND (`o`.`courseid` = `c`.`courseid`)
       AND (`s`.`slotid` = `sl`.`slotid`)
       AND (`sl`.`dayid` = `d`.`dayid`)
       AND (`sl`.`slottypeid` = `st`.`subslotid`)
       AND (`sl`.`roomid` = `r`.`roomid`)
       AND (`st`.`slotno` = `v`.`slotno`)
       AND (`s`.`occupied` = `v`.`occupied`))$$

DELIMITER ;

