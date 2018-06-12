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
    <title>修改课程信息</title>
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
          	String lessonNo = request.getParameter("lessonNo");
  			Class.forName("com.mysql.jdbc.Driver");    
  			Connection ct = DriverManager.getConnection("jdbc:mysql://localhost:3306/chooseLesson","root","");      
  			Statement st = ct.createStatement();
  			ResultSet rs = st.executeQuery("select * from lesson where lessonNo ='"+lessonNo+"'");
  			String lessonName = null;
  			String credit = null;
//   			float credit;
  			if(rs.next()){
  				lessonName = rs.getString("lessonName");
  				credit = rs.getString("credit");
  			}
//   			if(cre != null){
//   				credit = Float.parseFloat(cre);
//   			}
  			ct.close();
    	  %>
          <h1>欢迎<%= username %></h1>
        </header>
        <div class="mobile-menu-icon">
            <i class="fa fa-bars"></i>
          </div>
        <nav class="templatemo-left-nav">
          <ul>
            <li><a href="index.jsp"><i class="fa fa-home fa-fw"></i>管理学生信息</a></li>
            <li><a href="course.jsp"  class="active"><i class="fa fa-bar-chart fa-fw"></i>管理课程信息</a></li>
            <li><a href="reviseInfo.jsp"><i class="fa fa-users fa-fw"></i>修改信息</a></li>
            <li><a href="../login.jsp" onclick="return confirm('确认注销？');"><i class="fa fa-eject fa-fw"></i>注销</a></li>
          </ul>
        </nav>
      </div>
      <!-- Main content -->
      <div class="templatemo-content col-1 light-gray-bg">
      	<div class="col-1">
        	<div class="panel panel-default margin-10">
              <div class="panel-heading"><h2 class="text-uppercase">修改课程(<%= lessonName %>)的信息</h2></div>
                <div class="panel-body">
                  <form name="myform" action="update_c.jsp" class="templatemo-login-form">
                    <div class="form-group">
                      <label>课程号</label>
                      <label type="text" class="form-control" name="lessonNo"><%= lessonNo%></label>
                      <input type="hidden" class="form-control" name="lessonNo" value="<%= lessonNo%>">
                    </div>
                    <div class="form-group">                      
                      <label>课程名称</label>
                      <input type="text" class="form-control" name="lessonName" value="<%= lessonName %>">
                      </div>
                    <div class="form-group">                      
                      <label>课程学分</label>
                      <input type="text" class="form-control" name="credit" value="<%= credit %>">                                 
                    </div>
                    <div class="form-group">
                      <button type="button" class="templatemo-blue-button" onclick="check()">Submit</button>
                      <button type="reset" class="templatemo-blue-button" onclick="return confirm('确认重置？');">Reset</button>
                      <a href="course.jsp" class="templatemo-blue-button" onclick="return confirm('确认要取消？');" >cancel</a>
                    </div>
                  </form>
                </div>                
            </div>              
        </div>
      </div>
    </div>
	<script type="text/javascript">
		function check(){
			if(document.myform.lessonNo.value == ""){
				alert("课程号不能为空！");
			}else if(document.myform.lessonName.value == ""){
				alert("课程名称不能为空！");
			}else if(document.myform.credit.value == ""){
				alert("课程学分不能为空！");
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
