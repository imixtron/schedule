SELECT * FROM `vschedule`

SELECT oc.offid, CONCAT(`teachername`, ' - ', `title`, ' - ', `sectionname`) AS offcrs 
	FROM (
	  (
	    (
		offeredcourse2 oc 
		LEFT JOIN course c ON (oc.courseid = c.courseid)
	    )
	    LEFT JOIN teacher t ON ((oc.teacherid = t.teacherid))
	  )
          LEFT JOIN section s ON ((oc.secid = s.secid))
	)
	
SELECT * FROM offeredcourse2 oc 
		LEFT JOIN course c ON (oc.courseid = c.courseid)

AR - AWT - BABS2A & BABS 2B & BABS 2C
	
		
SELECT oc.offid, 
   CONCAT(`teachername`, ' - ', `title`, ' - ' ,
	(SELECT GROUP_CONCAT(l.sectionname)
	  FROM  `section` l, `sectiondetails` p
	  WHERE oc.offid = p.offid AND p.secid = l.secid)
   ) AS offcrs 
   FROM (((offeredcourse2 oc 
        LEFT JOIN course c ON ((oc.courseid = c.courseid))) 
        LEFT JOIN teacher t ON ((oc.teacherid = t.teacherid))
   ))
   WHERE CONCAT(`teachername`, ' - ', `title`, ' - ', (SELECT GROUP_CONCAT(l.sectionname) FROM  `section` l, `sectiondetails` p WHERE oc.offid = p.offid AND p.secid = l.secid)) LIKE '%asim%' LIMIT 10