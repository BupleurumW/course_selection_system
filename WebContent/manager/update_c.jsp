<%@ page language="java" contentType="text/html;  charset=UTF-8" import="java.sql.*"  
    pageEncoding="UTF-8"%>  
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">  
<html>  
<head>  
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">  
<title>修改信息</title>  
</head>  

<body>  
  
<%  
    String lessonNo = request.getParameter("lessonNo");
    String lessonName = new String(request.getParameter("lessonName").getBytes("ISO-8859-1"),"UTF-8");
    String credit = request.getParameter("credit");
//     float credit;
//     if(cre != null){
//     	credit = Float.parseFloat(cre);
//     }
    String add = request.getParameter("add");
    int addflag;
    if(add != null){
    	addflag = Integer.parseInt(add);
    }else{
    	addflag = 0;
    }
//   	out.print(addflag);
    Class.forName("com.mysql.jdbc.Driver");    
    Connection ct = DriverManager.getConnection("jdbc:mysql://localhost:3306/chooseLesson?characterEncoding=UTF-8","root","");      
    Statement st = ct.createStatement();
    if(addflag == 1){
    	int addCount = st.executeUpdate("insert into lesson values('"+lessonNo+"','"+lessonName+"',"+credit+")");
//     	addCount += st.executeUpdate("insert into users values('"+stu_no+"','"+nickname+"','"+grade+"')");
		response.sendRedirect("course.jsp?addCount="+addCount);
    }else{
    	int updateCount = st.executeUpdate("update lesson set lessonName='"+lessonName+"',credit="+credit+
    									" where lessonNo='"+lessonNo+"'");
		response.sendRedirect("course.jsp?updateCount="+updateCount);
    }
    ct.close();
%>  
</body>  
</html>