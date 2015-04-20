
<%@page import="com.google.gson.Gson"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.HashMap"%>
<%@page import="schedule.data.Database"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

<%@page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%
	Statement stmt = Database.getConnection().createStatement();
	String term = request.getParameter("term");
	String type = request.getParameter("type");
	String sql = "SELECT oc.offid, "+
			   "CONCAT(`teachername`, ' - ', `title`, ' - ' , "+
			    "(SELECT GROUP_CONCAT(l.sectionname) "+
			      "FROM  `section` l, `sectiondetails` p "+
			      "WHERE oc.offid = p.offid AND p.secid = l.secid)"+
			   ") AS offcrs FROM (((offeredcourse2 oc LEFT JOIN course c ON ((oc.courseid = c.courseid))) LEFT JOIN teacher t ON ((oc.teacherid = t.teacherid))))";


	
	if(type.equals("offcrs")){
		//System.out.println(sql);
		ResultSet rs = stmt.executeQuery(sql +" WHERE CONCAT(`teachername`, ' - ', `title`, ' - ', (SELECT GROUP_CONCAT(l.sectionname) FROM  `section` l, `sectiondetails` p WHERE oc.offid = p.offid AND p.secid = l.secid)) LIKE '%"+term+"%' LIMIT 10");
		ArrayList<HashMap<String, Object>> list = new ArrayList<HashMap<String, Object>>();
	
		while (rs.next()) {
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("id", rs.getInt("offid"));
			map.put("label", rs.getString("offcrs"));
			map.put("value", rs.getString("offcrs"));
			list.add(map);
		}
		out.println(new Gson().toJson(list));
		rs.close();
	}

	if(type.equals("slot")){
		
	sql = "SELECT s.slotid, CONCAT(SUBSTRING(d.DayName, 1, 3), ' ', r.RoomNo, ' ',st.Duration,' (', r.Campus, ')') AS slotname, st.Occupied " + 
			"FROM slots s, days d, (SELECT * FROM (" +
        "SELECT p.SlotTypeId, c.Duration as 'Duration', p.SlotNo, p.SlotTypeId as 'Sort', " +
        "CASE when c.Duration LIKE '%00%' then 1 when c.Duration LIKE '%45%' then 2 END as Occupied " +
        "FROM slottype p, slottype c WHERE p.SlotTypeId = c.SubSlot " +
        "UNION " +
        "SELECT x.SlotTypeId, x.Duration, x.SlotNo, x.SlotTypeId - 0.5 as 'Sort', 3 as Occupied " +
        "FROM slottype x WHERE x.SlotType = 1 " +
    ") as tab ORDER BY sort, Occupied) as st, room r WHERE d.dayid = s.dayid AND st.SlotTypeId = s.SlotTypeId "+
			"AND r.roomid = s.roomid "+
			"AND CONCAT(SUBSTRING(d.DayName, 1, 3), ' ', r.RoomNo, ' ',st.Duration, ' (', r.Campus, ')') LIKE '%"+term+"%' LIMIT 20 ";
	
		ResultSet rs = stmt.executeQuery(sql);
	
		ArrayList<HashMap<String, Object>> list = new ArrayList<HashMap<String, Object>>();
	
		while (rs.next()) {
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("id", rs.getInt("slotid"));
			map.put("label", rs.getString("slotname"));
			map.put("value", rs.getString("slotname"));
			map.put("occupied", rs.getString("occupied"));
			
			list.add(map);
		}
		out.println(new Gson().toJson(list));
		rs.close();
	}

	if(type.equals("room")){
		ResultSet rs = stmt.executeQuery("SELECT roomid, CONCAT(RoomNo, ' ', Campus) as roomname FROM room  WHERE CONCAT(RoomNo, ' ', Campus) LIKE '%"+term+"%' LIMIT 10");
	
		ArrayList<HashMap<String, Object>> list = new ArrayList<HashMap<String, Object>>();
	
		while (rs.next()) {
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("id", rs.getInt("id"));
			map.put("label", rs.getString("roomname"));
			map.put("value", rs.getString("roomname"));
			list.add(map);
		}
		out.println(new Gson().toJson(list));
		rs.close();
	}
	
	stmt.close();

%>