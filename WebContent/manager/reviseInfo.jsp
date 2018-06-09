<%@page import="java.io.Console"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>修改信息</title>
    <meta name="description" content="">
    <meta name="author" content="templatemo">
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,400italic,700' rel='stylesheet' type='text/css'>
    <link href="../css/font-awesome.min.css" rel="stylesheet">
    <link href="../css/bootstrap.min.css" rel="stylesheet">
    <link href="../css/templatemo-style.css" rel="stylesheet">
  </head>
  
  <body>
    <!-- Left column -->
    <div class="templatemo-flex-row">
      <div class="templatemo-sidebar">
        <header class="templatemo-site-header">
          <div class="square"></div>
          <%
//     		String username = request.getParameter("username");
          	String username = (String)session.getAttribute("username");
    		Class.forName("com.mysql.jdbc.Driver");    
    		Connection ct = DriverManager.getConnection("jdbc:mysql://localhost:3306/chooseLesson","root","");      
    		Statement st = ct.createStatement();
    		ResultSet rs = st.executeQuery("select * from info where username ='"+username+"'");
    		String nickname = null;
    		if(rs.next()){
    			nickname = rs.getString("nickname");
    		}
    		ResultSet rs2 = st.executeQuery("select * from users where username ='"+username+"'");
    		String passwd = null;
    		if(rs2.next()){
    			passwd = rs2.getString("passwd");
    		}
    		ct.close();
    		
    		String error = request.getParameter("error");
          	if(error != null){
          		int flag = Integer.parseInt(error);
          		if(flag == 1)
          		{
          			out.print("<script>alert('原密码输入错误，修改失败！');</script>");
          		}
         	 }
    	  %>
          <h1>欢迎<%= nickname %></h1>
        </header>
<!--         <div class="profile-photo-container"> -->
<!--           <img src="images/profile-photo.jpg" alt="Profile Photo" class="img-responsive"> -->
<!--           <div class="profile-photo-overlay"></div> -->
<!--         </div> -->
        <div class="mobile-menu-icon">
            <i class="fa fa-bars"></i>
          </div>
        <nav class="templatemo-left-nav">
          <ul>
            <li><a href="index.jsp"><i class="fa fa-home fa-fw"></i>管理学生信息</a></li>
            <li><a href="course.jsp"><i class="fa fa-bar-chart fa-fw"></i>管理课程信息</a></li>
            <li><a href="reviseInfo.jsp" class="active"><i class="fa fa-users fa-fw"></i>修改信息</a></li>
            <li><a href="../login.jsp" onclick="return confirm('确认注销？');"><i class="fa fa-eject fa-fw"></i>注销</a></li>
          </ul>
        </nav>
      </div>
      <!-- Main content -->
      <div class="templatemo-content col-1 light-gray-bg">
        <div class="templatemo-content-container">
          <div class="templatemo-content-widget white-bg">
            <h2 class="margin-bottom-10">欢迎</h2>
            <p>Here goes another form and form controls.</p>
            <form action="update_info.jsp" name="myform" class="templatemo-login-form" method="post">
              <div class="row form-group">
                <div class="col-lg-6 col-md-6 form-group">                  
                    <label for="inputFirstName">username</label>
                    <label type="text" class="form-control" id="inputUserName"><%= username %></label>                  
                </div>
                <div class="col-lg-6 col-md-6 form-group">                  
                    <label for="inputLastName">nickname</label>
                    <input type="text" class="form-control" id="inputNickName" name="Nickname" value="<%= nickname %>" >                  
                </div> 
              </div>
              <div class="row form-group">
                <div class="col-lg-6 col-md-6 form-group">                  
                    <label for="inputCurrentPassword">Password</label>
                    <input type="password" class="form-control highlight" id="inputCurrentPassword" name="oldPwd">                  
                </div>                
              </div>
              <div class="row form-group">
                <div class="col-lg-6 col-md-6 form-group">                  
                    <label for="inputNewPassword">New Password</label>
                    <input type="password" class="form-control" id="inputNewPassword" name="newPwd">
                </div>
                <div class="col-lg-6 col-md-6 form-group">                  
                    <label for="inputConfirmNewPassword">Confirm New Password</label>
                    <input type="password" class="form-control" id="inputConfirmNewPassword" name="confirmPwd">
                </div> 
              </div>
              <div class="form-group text-right">
                <button type="button" class="templatemo-blue-button" onClick="check()">Update</button>
                <button type="reset" class="templatemo-white-button">Reset</button>
              </div>                           
            </form>
          </div>
        </div>
      </div>
    </div>
	<script type="text/javascript">
		function check(){
			if(document.getElementById("inputCurrentPassword").value == ""){
				alert("请输入原密码！");
			}else if(document.getElementById("inputNewPassword").value == ""){
				alert("请输入新密码！");
			}else if(document.getElementById("inputConfirmNewPassword").value == ""){
				alert("请确认新密码！");
			}else if(document.getElementById("inputNickName").value == ""){
				alert("请输入昵称！");
			}else if(document.getElementById("inputNewPassword").value != document.getElementById("inputConfirmNewPassword").value){
				alert("两次输入的新密码必须相同！");
			}else{
				if(confirm("确定要修改？")){
					document.myform.submit();
				}
			}
		}
	</script>
    <!-- JS -->
    <script type="text/javascript" src="js/jquery-1.11.2.min.js"></script>        <!-- jQuery -->
    <script type="text/javascript" src="js/bootstrap-filestyle.min.js"></script>  <!-- http://markusslima.github.io/bootstrap-filestyle/ -->
    <script type="text/javascript" src="js/templatemo-script.js"></script>        <!-- Templatemo Script -->
  </body>
</html>
