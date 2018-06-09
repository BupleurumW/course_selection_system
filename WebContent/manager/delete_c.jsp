<%@ page language="java" contentType="text/html;  charset=UTF-8" import="java.sql.*"  
    pageEncoding="UTF-8"%>  
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">  
<html>  
<head>  
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">  
<title>删除课程信息</title>  
</head>  

<body>  
  
<%  
    String lessonNo = request.getParameter("lessonNo");
	Class.forName("com.mysql.jdbc.Driver");
	Connection ct = DriverManager.getConnection("jdbc:mysql://localhost:3306/chooseLesson?characterEncoding=UTF-8","root","");
	Statement st = ct.createStatement();
	int deleteCount = st.executeUpdate("delete from lesson where lessonNo='"+lessonNo+"'");
	deleteCount += st.executeUpdate("delete from sc where lessonNo='"+lessonNo+"'");
// 	st.executeUpdate("insert into droped_course values('"+username+"','"+lessonNo+"')");
	ct.close();
	response.sendRedirect("course.jsp?deleteCount="+deleteCount+"");
%>  
</body>  
</html>