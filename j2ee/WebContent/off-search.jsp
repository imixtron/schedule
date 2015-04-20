<%@page import="com.google.gson.Gson"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@page import="schedule.data.Database"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%
String sql = "";
Statement stmt = Database.getConnection().createStatement();

String term = request.getParameter("term");
String type = request.getParameter("type");

	if(type.equals("course")){
		sql = "SELECT * FROM course WHERE title LIKE '%"+term+"%' ORDER BY title LIMIT 10 ";
		ResultSet rs = stmt.executeQuery(sql);

		ArrayList<HashMap<String, Object>> list = new ArrayList<HashMap<String, Object>>();

		while (rs.next()) {
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("id", rs.getInt("courseid"));
			map.put("value", rs.getString("title"));
			
			list.add(map);
		}
		out.println(new Gson().toJson(list));
		rs.close();
	}
	else if(type.equals("teacher")){
		sql = "SELECT * FROM teacher WHERE teachername REGEXP '"+term+"' ORDER BY teachername LIMIT 10";
		ResultSet rs = stmt.executeQuery(sql);

		ArrayList<HashMap<String, Object>> list = new ArrayList<HashMap<String, Object>>();

		while (rs.next()) {
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("id", rs.getInt("teacherid"));
			map.put("value", rs.getString("teachername"));
			
			list.add(map);
		}
		out.println(new Gson().toJson(list));
		rs.close();
	}
	else if(type.equals("section")){
		sql = "SELECT * FROM section";
		sql = "SELECT * FROM section WHERE sectionname REGEXP '"+term+"' ORDER BY sectionname LIMIT 10";
		ResultSet rs = stmt.executeQuery(sql);

		ArrayList<HashMap<String, Object>> list = new ArrayList<HashMap<String, Object>>();

		while (rs.next()) {
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("id", rs.getInt("secid"));
			map.put("value", rs.getString("sectionname"));
			
			list.add(map);
		}
		out.println(new Gson().toJson(list));
		rs.close();
	}

	stmt.close();


%>