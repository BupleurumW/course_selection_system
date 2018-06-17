<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">  
    <title>选课详情</title>
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
          	String username = (String)session.getAttribute("username");
          	String lessonNo = request.getParameter("lessonNo");
    	  %>
          <h1>欢迎<%= username %></h1>
        </header>
        <div class="mobile-menu-icon">
            <i class="fa fa-bars"></i>
          </div>
        <nav class="templatemo-left-nav">          
          <ul>
            <li><a href="index.jsp"><i class="fa fa-home fa-fw"></i>管理学生信息</a></li>
            <li><a href="course.jsp" class="active"><i class="fa fa-bar-chart fa-fw"></i>管理课程信息</a></li>
            <li><a href="reviseInfo.jsp"><i class="fa fa-users fa-fw"></i>修改信息</a></li>
            <li><a href="../login.jsp" onclick="return confirm('确认注销？');"><i class="fa fa-eject fa-fw"></i>注销</a></li>
          </ul>  
        </nav>
      </div>
      <!-- Main content --> 
      <div class="templatemo-content col-1 light-gray-bg">
      <%
      	//定义分页变量
      	int pageSize = 20,pageNow = 1,pageCount = 0,rowCount = 0;
      	Class.forName("com.mysql.jdbc.Driver");
      	Connection ct = DriverManager.getConnection("jdbc:mysql://localhost:3306/chooseLesson?characterEncoding=UTF-8","root","");
      	Statement st = ct.createStatement();
      	ResultSet rs = st.executeQuery("select count(*) from sc where lessonNo='"+lessonNo+"'");
      	if(rs.next()){
      		rowCount = rs.getInt(1);
      	}
      	if(rowCount%pageSize == 0){
      		pageCount = rowCount/pageSize;
      	}else{
      		pageCount = rowCount/pageSize + 1;
      	}
      	int start = 1,end = 5;
      	if(pageCount < end){
      		end = pageCount;
      	}
      	String pN = request.getParameter("pageNow");
      	if(pN != null){
      		pageNow = Integer.parseInt(pN);
      	}
      	String s = request.getParameter("start");
      	if(s != null){
      		start = Integer.parseInt(s);
      		if(start + 4 <= pageCount && start > 0){
      			end = start + 4;
      		}
      		else if(start <= 0){
      			start = 1;
      			end = 5;
      			if(pageCount < 5){
      				end = pageCount;
      			}
			}
      		else if(start + 4 > pageCount){
      			end = pageCount;
      			start = pageCount - 4;
      			if(pageCount < 5){
      				start = 1;
      			}
      		}
      	}
      %>
<!--       <div class="templatemo-content-widget white-bg"> -->
<!--         <form name="myform" action="search_c.jsp"> -->
<!--         	<input type="hidden" name="search_flag" id="sf" value=""> -->
<!--         	<input type="text" class="form-control" placeholder="搜索课程" name="searchInput" id="srch-term"> -->
<!--         <div text-align="left"> -->
<!--           	<ul class="search_tab"> -->
<!--   				<li><button type="submit" class="templatemo-edit-btn" id="CNo" onClick="searchStu(this)">按课程号搜索</button></li> -->
<!--   				<li><button type="submit" class="templatemo-edit-btn" id="CName" onClick="searchStu(this)">按课程名搜索</button></li> -->
<!-- 			</ul> -->
<!--         </div>  -->
<!--         </form> -->
<!--       </div>   -->
      	<div class="templatemo-content-widget white-bg">
            <h2 class="margin-bottom-10">选择课程（<%= lessonNo %>）的学生名单</h2>
<!--            	<p class="margin-bottom-0">Yes goes to <a href="add_c.jsp?add=1">add course</a>.</p>               -->
      	</div>
        <div class="templatemo-content-container">
          <div class="templatemo-content-widget no-padding">
            <div class="panel panel-default table-responsive">
              <form name="myform">
              <table class="table table-striped table-bordered templatemo-user-table">
                <thead>
                  <tr>
                    <td>No.</td>
                    <td><a href="" class="white-text templatemo-sort-by">学号<span class="caret"></span></a></td>
                    <td><a href="" class="white-text templatemo-sort-by">姓名<span class="caret"></span></a></td>
                    <td><a href="" class="white-text templatemo-sort-by">性别<span class="caret"></span></a></td>
                    <td><a href="" class="white-text templatemo-sort-by">年龄<span class="caret"></span></a></td>
                    <td><a href="" class="white-text templatemo-sort-by">院系<span class="caret"></span></a></td>
                  </tr>
                </thead>
                <tbody>
                <%
            		rs = st.executeQuery("select username from sc where lessonNo='"+lessonNo+"' limit "+pageSize*(pageNow-1)+","+pageSize);
                	int i = 1; 
                	while(rs.next()){
                		String stu_no = rs.getString("username");
                		Statement st2 = ct.createStatement();
                		ResultSet rs2 = st2.executeQuery("select * from info where username='"+stu_no+"'");
                		if(rs2.next()){
        			%>
        			<tr>
           			<td><%= i++ %></td>
           			<td><%= rs2.getString("username") %></td>
           			<td><%= rs2.getString("nickname") %></td>
           			<td><%= rs2.getString("sex") %></td>
           			<td><%= rs2.getString("age") %></td>
           			<td><%= rs2.getString("dept") %></td>
       				</tr>
        			<%
                		}
        		  	}
        		  ct.close();          	
                  %>
                </tbody>
              </table>  
              </form>  
            </div>                          
          </div>    
          <div class="pagination-wrap">
          	<ul class="pagination">
          	  <input type="text" id="pageNow" class="form-control" placeholder="请输入要跳转的页面"> 
              <li><a href="javascript:jump()">goto</a></li>
              <li><a href="course.jsp?start=1&pageNow=<%= pageNow %>&lessonNo=<%= lessonNo %>">首页</a></li>
              <li><a href="course.jsp?start=<%= start-1 %>&pageNow=<%= pageNow %>&lessonNo=<%= lessonNo %>">◀</a></li>
           	  <%
           	  	int j; 
           	  	for(j=start;j<=end;j++){
           	  		if(j == pageNow){
           	  			%>
           	  			<li class="active"><a href="course.jsp?pageNow=<%= j %>&lessonNo=<%= lessonNo %>"><%= j %><span class="sr-only">(current)</span></a></li>
           	  			<%
           	  		}
           	  		else{
           	  			%>
       	  				<li><a href="course.jsp?pageNow=<%= j %>&start=<%= start %>&lessonNo=<%= lessonNo %>"><%= j %></a></li>
       	  				<%
           	  		}
           	  	}
              %>
              <%
              	int temp;
              	if(pageCount < 5)	temp = 1;
              	else temp = pageCount-4;
              %>
              <li><a href="course.jsp?start=<%= start+1 %>&pageNow=<%= pageNow %>&lessonNo=<%= lessonNo %>">▶</a></li>
              <li><a href="course.jsp?start=<%= temp %>&pageNow=<%= pageNow %>&lessonNo=<%= lessonNo %>">末页</a></li>
            </ul>
          </div>          
        </div>
      </div>
    </div>
    
    <!-- JS -->
    <script type="text/javascript" src="js/jquery.js"></script>
		<script type="text/javascript">
			
			function searchStu(obj){
			 if(obj.id=='CNo') {
				 document.getElementById("sf").value = "1";
				   document.myform.submit();
			 }else if(obj.id=='CName'){
				 document.getElementById("sf").value = "2";
				 document.myform.submit();
			 }  
			}
			
			function jump(){
				var pageNow = document.getElementById("pageNow").value;
				if(pageNow == ''){
					alert("请输入要跳转的页面！");
				}else{
					location.href='course.jsp?pageNow='+pageNow+'&start='+pageNow;
				}
			}
			
		</script>
    <script type="text/javascript" src="js/jquery-1.11.2.min.js"></script>      <!-- jQuery -->
    <script type="text/javascript" src="js/templatemo-script.js"></script>      <!-- Templatemo Script -->
    <script>
      $(document).ready(function(){
        // Content widget with background image
        var imageUrl = $('img.content-bg-img').attr('src');
        $('.templatemo-content-img-bg').css('background-image', 'url(' + imageUrl + ')');
        $('img.content-bg-img').hide();        
      });
    </script>
  </body>
</html>