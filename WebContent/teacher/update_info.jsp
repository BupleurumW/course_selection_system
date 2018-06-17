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
    String oldPwd = request.getParameter("oldPwd");  
    String newPwd = request.getParameter("newPwd");
    String confirmPwd = request.getParameter("confirmPwd");  
    String nickname = new String(request.getParameter("Nickname").getBytes("ISO-8859-1"),"UTF-8");
    String u = (String)session.getAttribute("username");
  
    Class.forName("com.mysql.jdbc.Driver");    
    Connection ct = DriverManager.getConnection("jdbc:mysql://localhost:3306/chooseLesson?characterEncoding=UTF-8","root","");      
    Statement st = ct.createStatement();
    ResultSet rs = st.executeQuery("select passwd from info where username ='"+u+"'");
    if(rs.next()){
    	out.print(rs.getString("passwd"));
    	out.print(oldPwd);
    	if(rs.getString("passwd").equals(oldPwd)){
    	    	st.executeUpdate("update info set nickname=N'"+nickname+"',passwd=N'"+newPwd+"' where username ='"+u+"'");
    			response.sendRedirect("index.jsp?update_info=1");	
    	}else{
    		response.sendRedirect("reviseInfo.jsp?error=1");
//     		out.print("密码错误!");
    	}
    }else{
//     	response.sendRedirect("login.jsp?error=2");
//     	out.print("用户名错误!");
    }
    ct.close();
%>  
</body>  
</html>