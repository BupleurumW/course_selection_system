<%@page import="com.sun.java.swing.plaf.windows.resources.windows"%>
<%@page import="javafx.scene.control.Alert"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8">
	    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	    <meta name="viewport" content="width=device-width, initial-scale=1">  
	    <title>选课系统</title>
        <meta name="description" content="">
        <meta name="author" content="templatemo">
	    <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,400italic,700' rel='stylesheet' type='text/css'>
	    <link href="css/font-awesome.min.css" rel="stylesheet">
	    <link href="css/bootstrap.min.css" rel="stylesheet">
		<link href="css/templatemo-style.css" rel="stylesheet">
		<script type="text/javascript">
			function check(){
				if(document.getElementById("user").value=="")
				{
					alert("登录名或密码不能为空！")
					return false;
				}else if(document.getElementById("pwd").value=="")
				{
					alert("登录名或密码不能为空！")
					return false;
				}
				document.myform.submit();
			}
		</script>
	</head>

	<body class="light-gray-bg">
		<%
			session.removeAttribute("username");
			int flag;
			String s = request.getParameter("error");
			if(s != null){
				flag = Integer.parseInt(s);
				if(flag == 1){
					out.print("<script>alert('密码错误！');</script>");					
				}else if(flag == 2){
					out.print("<script>alert('用户名不存在！');</script>");					
				}
			}
		%>
		<br>
		<br>
		<div class="templatemo-content-widget templatemo-login-widget white-bg">
			<header class="text-center">
	          <div class="square"></div>
	          <h1>登录选课系统</h1>
	        </header>
	        <form action="judge.jsp" name="myform" class="templatemo-login-form">
	        	<div class="form-group">
	        		<div class="input-group">
		        		<div class="input-group-addon"><i class="fa fa-user fa-fw"></i></div>	        		
		              	<input id="user" type="text" name="username" class="form-control" placeholder="username">           
		          	</div>	
	        	</div>
	        	<div class="form-group">
	        		<div class="input-group">
		        		<div class="input-group-addon"><i class="fa fa-key fa-fw"></i></div>	        		
		              	<input id="pwd" type="password" name="passwd" class="form-control" placeholder="password">           
		          	</div>	
	        	</div>	          	
	          	<div class="form-group">
				    <div class="checkbox squaredTwo">
				        <input type="checkbox" id="c1" name="cc" />
						<!-- <label for="c1"><span></span>Remember me</label> -->
				    </div>				    
				</div>
				<div class="form-group">
					<button type="button" onClick="check()" class="templatemo-blue-button width-100">Login</button>
				</div>
	        </form>
		</div>
	</body>
</html>