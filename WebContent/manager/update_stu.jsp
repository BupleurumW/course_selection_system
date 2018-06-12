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
    String stu_no = request.getParameter("stu_no");
    String nickname = new String(request.getParameter("nickname").getBytes("ISO-8859-1"),"UTF-8");
    String cno = request.getParameter("cno");
    String sex = new String(request.getParameter("sex").getBytes("ISO-8859-1"),"UTF-8");
    String age = request.getParameter("age");
    String dept = new String(request.getParameter("dept").getBytes("ISO-8859-1"),"UTF-8");
    String grade = request.getParameter("grade");
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
    	int addCount = st.executeUpdate("insert into info values('"+stu_no+"','1','"+nickname+"','"+sex+"','"+age+
    															"','"+dept+"','"+grade+"')");
		response.sendRedirect("index.jsp?updateCount="+addCount);
    }else{
    	int updateCount = st.executeUpdate("update info set nickname='"+nickname+"',sex='"+sex+"',age='"+age+
    							"',dept='"+dept+"',grade='"+grade+"' where username='"+stu_no+"'");
		response.sendRedirect("index.jsp?updateCount="+updateCount);
    }
    ct.close();
%>  
</body>  
</html>