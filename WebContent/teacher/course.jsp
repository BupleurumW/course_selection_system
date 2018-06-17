<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">  
    <title>管理学生信息</title>
    <meta name="description" content="">
    <meta name="author" content="templatemo">
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,400italic,700' rel='stylesheet' type='text/css'>
    <link href="../css/font-awesome.min.css" rel="stylesheet">
    <link href="../css/bootstrap.min.css" rel="stylesheet">
    <link href="../css/templatemo-style.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="../css/style.css" />
  </head>

  <body>  
    <!-- Left column -->
    <div class="templatemo-flex-row">
      <div class="templatemo-sidebar">
        <header class="templatemo-site-header">
          <div class="square"></div>
          <%
//     		String username = request.getParameter("username");
//           	session.removeAttribute("searchInput");
			String update_info = request.getParameter("update_info");
			if(update_info != null){
				if(update_info.equals("1")){
					out.print("<script>alert('修改信息成功！');</script>");
				}else{
					out.print("<script>alert('修改信息失败！');</script>");
				}
			}
			String addGrade = request.getParameter("addGrade");
			if(addGrade != null){
				if(!addGrade.equals("0")){
					out.print("<script>alert('提交成绩成功！');</script>");
				}else{
					out.print("<script>alert('提交成绩失败！');</script>");
				}
			}
			String addCount = request.getParameter("addCount");
			if(addCount != null){
				if(!addCount.equals("0")){
					out.print("<script>alert('增加学生成功！');</script>");
				}else{
					out.print("<script>alert('增加学生失败！');</script>");
				}
			}
			String updateCount = request.getParameter("updateCount");
			if(updateCount != null){
				if(!updateCount.equals("0")){
					out.print("<script>alert('修改学生信息成功！');</script>");
				}else{
					out.print("<script>alert('修改学生信息失败！');</script>");
				}
			}
			String deleteCount = request.getParameter("deleteCount");
			if(deleteCount != null){
				if(!deleteCount.equals("0")){
					out.print("<script>alert('删除学生信息成功！');</script>");
				}else{
					out.print("<script>alert('删除学生信息失败！');</script>");
				}
			}
          	String username = (String)session.getAttribute("username");
    		Class.forName("com.mysql.jdbc.Driver");    
    		Connection ct = DriverManager.getConnection("jdbc:mysql://localhost:3306/chooseLesson","root","");      
    		Statement st = ct.createStatement();
    		ResultSet rs = st.executeQuery("select * from info where username ='"+username+"'");
    		String nickname = null;
    		String dept = null;
    		if(rs.next()){
    			nickname = rs.getString("nickname");
    			dept = rs.getString("dept");
    		}
    		ct.close();
    	  %>
          <h1>欢迎<%= nickname %></h1>
        </header>
        <div class="mobile-menu-icon">
            <i class="fa fa-bars"></i>
          </div>
        <nav class="templatemo-left-nav">          
          <ul>
            <li><a href="course.jsp" class="active"><i class="fa fa-home fa-fw"></i>管理课程信息</a></li>
<!--             <li><a href="index.jsp"><i class="fa fa-bar-chart fa-fw"></i>管理学生信息</a></li> -->
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
      	ct = DriverManager.getConnection("jdbc:mysql://localhost:3306/chooseLesson","root","");
      	st = ct.createStatement();
      	rs = st.executeQuery("select count(*) from teacher where username='"+username+"'");
      	if(rs.next()){
      		rowCount = rs.getInt(1);
      	}
      	if(rowCount%pageSize == 0){
      		pageCount = rowCount/pageSize;
      	}else{
      		pageCount = rowCount/pageSize + 1;
      	}
//       	out.print(pageCount);
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
<!--       	<div class="templatemo-content-widget white-bg"> -->
<!--         <form name="myform" action="search_stu.jsp"> -->
<!--         	<input type="hidden" name="search_flag" id="sf" value=""> -->
<!--         	<input type="text" class="form-control" placeholder="搜索学生" name="searchInput" id="srch-term"> -->
<!--         <div text-align="left"> -->
<!--           	<ul class="search_tab"> -->
<!--   				<li><button type="submit" class="templatemo-edit-btn" id="SNo" onClick="searchStu(this)">按学号搜索</button></li> -->
<!--   				<li><button type="submit" class="templatemo-edit-btn" id="SName" onClick="searchStu(this)">按姓名搜索</button></li> -->
<!--   				<li><button type="submit" class="templatemo-edit-btn" id="SSex" onClick="searchStu(this)">按性别搜索</button></li> -->
<!--   				<li><button type="submit" class="templatemo-edit-btn" id="SAge" onClick="searchStu(this)">按年龄搜索</button></li> -->
<!--   				<li><button type="submit" class="templatemo-edit-btn" id="SDept" onClick="searchStu(this)">按院系搜索</button></li> -->
<!-- 			</ul> -->
<!--         </div>  -->
<!--         </form> -->
<!--   		</div> -->
<!--       	<div class="templatemo-content-widget white-bg"> -->
<!--             <h2 class="margin-bottom-10">是否增加学生的信息</h2> -->
<!--            	<p class="margin-bottom-0">Yes goes to <a href="add_stu.jsp?add=1">add student</a>.</p>               -->
<!--       	</div> -->
		<div class="templatemo-content-widget white-bg">
            <h2 class="margin-bottom-10">所教课程:</h2>
<!--            	<p class="margin-bottom-0">Yes goes to <a href="add_stu.jsp?add=1">add student</a>.</p>               -->
      	</div>
        <div class="templatemo-content-container">
          <div class="templatemo-content-widget no-padding">
            <div class="panel panel-default table-responsive">
              <form name="myform">
              <table class="table table-striped table-bordered templatemo-user-table">
                <thead>
                  <tr>
                    <td><a href="" class="white-text templatemo-sort-by">No.<span class="caret"></span></a></td>
                    <td><a href="" class="white-text templatemo-sort-by">课程号<span class="caret"></span></a></td>
                    <td><a href="" class="white-text templatemo-sort-by">课程名<span class="caret"></span></a></td>
                    <td><a href="" class="white-text templatemo-sort-by">课程学分<span class="caret"></span></a></td>
                    <td></td>
                  </tr>
                </thead>
                <tbody>
                <%
                	rs = st.executeQuery("select * from teacher where username='"+username+"' limit "+pageSize*(pageNow-1)+","+pageSize);
                	int i = 1; 	
                	while(rs.next()){
                		String lessonNo = rs.getString("lessonNo");
                		Statement st2 = ct.createStatement();
                		ResultSet rs2 = st2.executeQuery("select * from lesson where lessonNo='"+lessonNo+"'");
                		if(rs2.next()){
        			%>
        			<tr>
           			<td><%= i++ %></td>
           			<td><%= rs2.getString("lessonNo") %></td>
           			<td><%= rs2.getString("lessonName") %></td>
           			<td><%= rs2.getString("credit") %></td>
           			<td><a href="index.jsp?lessonNo=<%= lessonNo %>" class="templatemo-edit-btn" >查看选课信息</a></td>
<%--            			<td><a href="delete_stu.jsp?stu_no=<%= rs.getString("username") %>" onClick="return confirm('确定删除该学生所有信息(包括课程)？');" class="templatemo-edit-btn" >删除</a></td> --%>
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
              <li><a href="index.jsp?start=1&pageNow=<%= pageNow %>">首页</a></li>
              <li><a href="index.jsp?start=<%= start-1 %>&pageNow=<%= pageNow %>">◀</a></li>
           	  <%
           	  	int j; 
           	  	for(j=start;j<=end;j++){
           	  		if(j == pageNow){
           	  			%>
           	  			<li class="active"><a href="index.jsp?pageNow=<%= j %>"><%= j %><span class="sr-only">(current)</span></a></li>
           	  			<%
           	  		}
           	  		else{
           	  			%>
       	  				<li><a href="index.jsp?pageNow=<%= j %>&start=<%= start %>"><%= j %></a></li>
       	  				<%
           	  		}
           	  	}
              %>
              <%
              	int temp;
              	if(pageCount < 5)	temp = 1;
              	else temp = pageCount-4;
              %>
              <li><a href="index.jsp?start=<%= start+1 %>&pageNow=<%= pageNow %>">▶</a></li>
              <li><a href="index.jsp?start=<%= temp %>&pageNow=<%= pageNow %>">末页</a></li>
            </ul>
          </div>          
        </div>
      </div>
    </div>
    
    <!-- JS -->
    <script type="text/javascript" src="js/jquery.js"></script>
		<script type="text/javascript">
			
			function searchStu(obj){
				 if(obj.id=='SNo') {
					 document.getElementById("sf").value = "1";
					   alert(document.myform.search_flag.value);
					   document.myform.submit();
				 }else if(obj.id=='SName'){
					 document.getElementById("sf").value = "2";
					 document.myform.submit();
				 }else if(obj.id=='SSex'){
					 document.getElementById("sf").value = "3";
					 document.myform.submit();
				 }
				 else if(obj.id=='SAge'){
					 document.getElementById("sf").value = "4";
					 document.myform.submit();
				 }
				 else if(obj.id=='SDept'){
					 document.getElementById("sf").value = "5";
					 document.myform.submit();
				 }
			}
			
			function jump(){
				var pageNow = document.getElementById("pageNow").value;
				if(pageNow == ''){
					alert("请输入要跳转的页面！");
				}else{
					location.href='index.jsp?pageNow='+pageNow+'&start='+pageNow;
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