

<%@page import="schedule.service.Crud"%>
<%
System.out.println("!: "+request.getParameter("oper"));
	String oper = request.getParameter("oper");
	if(oper.equals("insert")){
		String query = request.getParameter("query");
		String queryStatus = Crud.insertClasses(query);
		response.setContentType("text/plain");  // Set content type of the response so that jQuery knows what it can expect.
    	response.setCharacterEncoding("UTF-8"); // You want world domination, huh?
    		
    	if(queryStatus=="true"){
    		response.getWriter().write("true");       // Write response body.
   		}
	}
    if(oper.equals("delete"))
    {
		 String _schid = request.getParameter("_schid");
    	 int ScheduleKey =Integer.parseInt(_schid);
    	 System.out.println(ScheduleKey);
    	 String queryStatus = Crud.deleteFromTable(ScheduleKey);
 		 response.setContentType("text/plain");  // Set content type of the response so that jQuery knows what it can expect.
    	 response.setCharacterEncoding("UTF-8"); // You want world domination, huh?

     	if(queryStatus=="true"){
    		response.getWriter().write("true");       // Write response body.
   		}
	}
   
    
    
%>