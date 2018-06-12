<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">  
    <title>选课</title>
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
//     		String dept = null;
//     		int age;
    		if(rs.next()){
    			nickname = rs.getString("nickname");
//     			dept = rs.getString("dept");
//     			age = Integer.parseInt(rs.getString("age"));
    		}
    		ct.close();
//       	String searchInput = new String(request.getParameter("searchInput").getBytes("ISO-8859-1"),"UTF-8");
//       		request.setCharacterEncoding("UTF-8");
// 			String searchInput = request.getParameter("searchInput");
//       		if(searchInput != null){
//       			searchInput = new String(request.getParameter("searchInput").getBytes("ISO-8859-1"),"UTF-8");
//       			if(searchInput == ""){
//       				out.print("no result");
//       				response.sendRedirect("choose.jsp");
//       			}
//       		}else{
//       			response.sendRedirect("choose.jsp");
//       		}
    	  %>
          <h1>欢迎<%= nickname %></h1>
        </header>
        <div class="mobile-menu-icon">
            <i class="fa fa-bars"></i>
          </div>
        <nav class="templatemo-left-nav">          
          <ul>
            <li><a href="index.jsp"><i class="fa fa-home fa-fw"></i>个人信息</a></li>
            <li><a href="#" class="active"><i class="fa fa-bar-chart fa-fw"></i>选课</a></li>
            <li><a href="lesson.jsp"><i class="fa fa-map-marker fa-fw"></i>修读课程</a></li>
            <li><a href="reviseInfo.jsp"><i class="fa fa-users fa-fw"></i>修改信息</a></li>
            <li><a href="../login.jsp" onclick="return confirm('确认注销？');"><i class="fa fa-eject fa-fw"></i>注销</a></li>
          </ul>  
        </nav>
      </div>
      <!-- Main content --> 
      <div class="templatemo-content col-1 light-gray-bg">
      	<div class="templatemo-content-widget white-bg">
        <form name="myform2" action="searchCourse.jsp">
        	<input type="hidden" name="search_flag" id="sf" value="">
        	<input type="text" class="form-control" placeholder="搜索课程" name="searchInput" id="srch-term">
        <div text-align="left">
          	<ul class="search_tab">
  				<li><button type="submit" class="templatemo-edit-btn" id="CNo" onClick="searchStu(this)">按课程号搜索</button></li>
  				<li><button type="submit" class="templatemo-edit-btn" id="CName" onClick="searchStu(this)">按课程名搜索</button></li>
			</ul>
        </div> 
        </form>
        </div>
      <%
      	//定义分页变量
      	int pageSize = 8,pageNow = 1,pageCount = 0,rowCount = 0;
      	Class.forName("com.mysql.jdbc.Driver");
      	ct = DriverManager.getConnection("jdbc:mysql://localhost:3306/chooseLesson?useUnicode=true&characterEncoding=UTF-8","root","");
      	st = ct.createStatement();
      	String search_flag = request.getParameter("search_flag");
      	String searchInput = null;
		if(search_flag != null){
			searchInput = new String(request.getParameter("searchInput").getBytes("ISO-8859-1"),"UTF-8");
// 			out.print(searchInput);
			if(searchInput != null){
				if(search_flag.equals("1")){
					rs = st.executeQuery("select count(*) from lesson where lessonNo not in "+
							"(select lessonNo from sc where username='"+username+
							"') and lessonNo like '%"+searchInput+"%'" 
							+" limit "+pageSize*(pageNow-1)+","+pageSize);
				}else if(search_flag.equals("2")){
					rs = st.executeQuery("select count(*) from lesson where lessonNo not in "+
							"(select lessonNo from sc where username='"+username+
							"') and lessonName like '%"+searchInput+"%'" 
							+" limit "+pageSize*(pageNow-1)+","+pageSize);
				}
			}
			
		}else{
			response.sendRedirect("lesson.jsp");
		}
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
        <div class="templatemo-content-container">
        <p class="margin-bottom-5">
        Click to submit all courses：
        <button type="button" onClick="submitCourse()" class="templatemo-blue-button">submit</button>
        </p>
          <div class="templatemo-content-widget no-padding">
            <div class="panel panel-default table-responsive">
              <form name="myform" action="choose_lesson.jsp">
              <table class="table table-striped table-bordered templatemo-user-table">
                <thead>
                  <tr>
                    <td>
           				<input type="checkbox" id="all" onclick="checkAll()">
           				<label for="all" class="font-weight-400"><span></span>全选</label>
           			</td>
                    <td><a href="" class="white-text templatemo-sort-by">课程号<span class="caret"></span></a></td>
                    <td><a href="" class="white-text templatemo-sort-by">课程名<span class="caret"></span></a></td>
                    <td><a href="" class="white-text templatemo-sort-by">课程学分<span class="caret"></span></a></td>
                    <td>选课</td>
                  </tr>
                </thead>
                <tbody>
                <%
                	if(search_flag != null){
        				searchInput = new String(request.getParameter("searchInput").getBytes("ISO-8859-1"),"UTF-8");
//         				out.print(searchInput);
        				if(searchInput != null){
        					if(search_flag.equals("1")){
        						rs = st.executeQuery("select * from lesson where lessonNo not in "+
        								"(select lessonNo from sc where username='"+username+
        								"') and lessonNo like '%"+searchInput+"%'" 
        								+" limit "+pageSize*(pageNow-1)+","+pageSize);
        					}else if(search_flag.equals("2")){
        						rs = st.executeQuery("select * from lesson where lessonNo not in "+
        								"(select lessonNo from sc where username='"+username+
        								"') and lessonName like '%"+searchInput+"%'" 
        								+" limit "+pageSize*(pageNow-1)+","+pageSize);
        					}
        				}
        			}else{
        				response.sendRedirect("lesson.jsp");
        			}
          			int i = 1; 
        			while(rs.next()){
        			%>
        			<tr>
           			<td>
           				<input type="checkbox" id="<%= i %>" name="checklist" value="<%= rs.getString("lessonNo") %>">
           				<label for="<%= i %>" class="font-weight-400"><span></span><%= i++ %></label>
           			</td>
           			<td><%= rs.getString("lessonNo") %></td>
           			<td><%= rs.getString("lessonName") %></td>
           			<td><%= rs.getString("credit") %></td>
           			<td><a href="choose_lesson.jsp?lessonNo=<%= rs.getString("lessonNo") %>" onclick="return confirm('确认选课？');" class="templatemo-edit-btn" >选课</a></td>
       				</tr>
        			<%
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
              <li><a href="searchCourse.jsp?start=1&pageNow=<%= pageNow %>&searchInput=<%= searchInput %>&search_flag=<%= search_flag %>">首页</a></li>
              <li><a href="searchCourse.jsp?start=<%= start-1 %>&pageNow=<%= pageNow %>&searchInput=<%= searchInput %>&search_flag=<%= search_flag %>">◀</a></li>
           	  <%
           	  	int j; 
           	  	for(j=start;j<=end;j++){
           	  		if(j == pageNow){
           	  			%>
           	  			<li class="active"><a href="searchCourse.jsp?pageNow=<%= j %>&searchInput=<%= searchInput %>&search_flag=<%= search_flag %>"><%= j %><span class="sr-only">(current)</span></a></li>
           	  			<%
           	  		}
           	  		else{
           	  			%>
       	  				<li><a href="searchCourse.jsp?pageNow=<%= j %>&start=<%= start %>&searchInput=<%= searchInput %>&search_flag=<%= search_flag %>"><%= j %></a></li>
       	  				<%
           	  		}
           	  	}
              %>
              <%
              	int temp;
              	if(pageCount < 5)	temp = 1;
              	else temp = pageCount-4;
              %>
              <li><a href="searchCourse.jsp?start=<%= start+1 %>&pageNow=<%= pageNow %>&searchInput=<%= searchInput %>&search_flag=<%= search_flag %>">▶</a></li>
              <li><a href="searchCourse.jsp?start=<%= temp %>&pageNow=<%= pageNow %>&searchInput=<%= searchInput %>&search_flag=<%= search_flag %>">末页</a></li>
            </ul>
          </div>          
        </div>
      </div>
    </div>
    
    <!-- JS -->
    <script>
    	function checkAll(){
    		var all=document.getElementById('all');//获取到点击全选的那个复选框的id  
    		var one=document.getElementsByName('checklist');//获取到复选框的名称  
    		for(var i=0;i<one.length;i++){  
    			one[i].checked=all.checked; 
    		}  
    	}  
    	function submitCourse(){
    		var one=document.getElementsByName('checklist');
    		var i;
    		for(i=0;i<one.length;i++){
    			if(one[i].checked == true){
    				break;
    			}
    		}
    		if(i < one.length){ //有选中
    			if(confirm('确认选课？')){
    				document.myform.submit();
    			}
    		}else{
    			alert("至少选一门课后再提交选课！");
    		}
    	}
    	function searchStu(obj){
			 if(obj.id=='CNo') {
				 document.getElementById("sf").value = "1";
				   alert(document.myform.search_flag.value);
				   document.myform2.submit();
			 }else if(obj.id=='CName'){
				 document.getElementById("sf").value = "2";
				 document.myform2.submit();
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