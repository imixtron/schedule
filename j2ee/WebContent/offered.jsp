<%@page import="schedule.service.Crud"%>
<%

String offeredcourses = request.getParameter("offeredCourses");
//System.out.println(offeredcourses);
Crud.insertOff(offeredcourses);

%>