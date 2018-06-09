<%@ page language="java" contentType="text/html;  charset=UTF-8" import="java.sql.*"  
    pageEncoding="UTF-8"%>  
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">  
<html>  
<head>  
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">  
<title>选课</title>  
</head>  

<body>  
  
<%  
	String username = (String)session.getAttribute("username");
	Class.forName("com.mysql.jdbc.Driver");
	Connection ct = DriverManager.getConnection("jdbc:mysql://localhost:3306/chooseLesson?characterEncoding=UTF-8","root","");
	Statement st = ct.createStatement();
	String[] list = request.getParameterValues("checklist");
	if(list != null){
		int chooseCount = 0;
		for(int i=0;i<list.length;i++){
			chooseCount += st.executeUpdate("insert into sc values('"+username+"','"+list[i]+"',-1)");
		}
		response.sendRedirect("lesson.jsp?chooseCount="+chooseCount+"");
	}else{
		String lessonNo = request.getParameter("lessonNo");
		int chooseCount = st.executeUpdate("insert into sc values('"+username+"','"+lessonNo+"',-1)");
		response.sendRedirect("lesson.jsp?chooseCount="+chooseCount+"");
	}
	ct.close();
%>  
</body>  
</html>