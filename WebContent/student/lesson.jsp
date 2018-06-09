<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">  
    <title>选修课程</title>
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
          	String chooseCount = request.getParameter("chooseCount");
          	if(chooseCount != null){
          		if(!chooseCount.equals("0")){
          			out.print("<script>alert('选课成功！');</script>");
          		}else{
          			out.print("<script>alert('选课失败，请重选！');</script>");
          		}
          	}
          	String username = (String)session.getAttribute("username");
    		Class.forName("com.mysql.jdbc.Driver");    
    		Connection ct = DriverManager.getConnection("jdbc:mysql://localhost:3306/chooseLesson","root","");      
    		Statement st = ct.createStatement();
    		ResultSet rs = st.executeQuery("select * from info where username ='"+username+"'");
    		String nickname = null;
    		String dept = null;
    		int age;
    		String in_year = null;
    		if(rs.next()){
    			nickname = rs.getString("nickname");
    			dept = rs.getString("dept");
    			age = Integer.parseInt(rs.getString("age"));
    			in_year = rs.getString("in_year");
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
            <li><a href="index.jsp"><i class="fa fa-home fa-fw"></i>个人信息</a></li>
            <li><a href="choose.jsp"><i class="fa fa-bar-chart fa-fw"></i>选课</a></li>
            <li><a href="#" class="active"><i class="fa fa-map-marker fa-fw"></i>修读课程</a></li>
<!--             <li><a href="#"><i class="fa fa-users fa-fw"></i>选课记录</a></li> -->
            <li><a href="reviseInfo.jsp"><i class="fa fa-users fa-fw"></i>修改信息</a></li>
            <li><a href="../login.jsp" onclick="return confirm('确认注销？');"><i class="fa fa-eject fa-fw"></i>注销</a></li>
          </ul>  
        </nav>
      </div>
      <!-- Main content --> 
      <div class="templatemo-content col-1 light-gray-bg">
      <%
      	//定义分页变量
      	int pageSize = 8,pageNow = 1,pageCount = 0,rowCount = 0;
      	Class.forName("com.mysql.jdbc.Driver");
      	ct = DriverManager.getConnection("jdbc:mysql://localhost:3306/chooseLesson","root","");
      	st = ct.createStatement();
      	rs = st.executeQuery("select count(*) from sc where username="+username+"");
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
            <div class="col-1">
              <div class="panel panel-default templatemo-content-widget white-bg no-padding templatemo-overflow-hidden">
                <i class="fa fa-times"></i>
                <div class="panel-heading templatemo-position-relative"><h2 class="text-uppercase">已修课程</h2></div>
                <div class="table-responsive">
                  <table class="table table-striped table-bordered">
                    <thead>
                      <tr>
                        <td>No.</td>
                        <td>课程号</td>
                        <td>课程名称</td>
                        <td>课程学分</td>
                        <td>补退选</td>
                      </tr>
                    </thead>
                    <tbody>
                    <%
                    rs = st.executeQuery("select * from lesson where lessonNo in "+
      						"(select lessonNo from sc where username="+username+") limit "
      						+pageSize*(pageNow-1)+","+pageSize+"");
                  	int i = 1; 
                	while(rs.next()){
                		%>
                		<tr>
                    	<td><%= i++ %></td>
                    	<td><%= rs.getString("lessonNo") %></td>
                    	<td><%= rs.getString("lessonName") %></td>
                    	<td><%= rs.getString("credit") %></td>
                    	<td><a href="drop_lesson.jsp?lessonNo=<%= rs.getString("lessonNo") %>" onclick="return confirm('确认退课？');" class="templatemo-edit-btn">退课</a></td>
                 		</tr>
                		<%
                	}
                	ct.close();
                  	%>                    
                    </tbody>
                  </table>    
                </div>                                  
          </div>        
        </div>
        <div class="pagination-wrap">
            <ul class="pagination">
              <li><a href="lesson.jsp?start=1&pageNow=<%= pageNow %>">首页</a></li>
              <li><a href="lesson.jsp?start=<%= start-1 %>&pageNow=<%= pageNow %>">◀</a></li>
           	  <%
           	  	int j; 
           	  	for(j=start;j<=end;j++){
           	  		if(j == pageNow){
           	  			%>
           	  			<li class="active"><a href="lesson.jsp?pageNow=<%= j %>"><%= j %><span class="sr-only">(current)</span></a></li>
           	  			<%
           	  		}
           	  		else{
           	  			%>
       	  				<li><a href="lesson.jsp?pageNow=<%= j %>&start=<%= start %>"><%= j %></a></li>
       	  				<%
           	  		}
           	  	}
              %>
              <%
              	int temp;
              	if(pageCount < 5)	temp = 1;
              	else temp = pageCount-4;
              %>
              <li><a href="lesson.jsp?start=<%= start+1 %>&pageNow=<%= pageNow %>">▶</a></li>
              <li><a href="lesson.jsp?start=<%= temp %>&pageNow=<%= pageNow %>">末页</a></li>
            </ul>
          </div>
      </div>
    </div>
    
    <!-- JS -->
    <script src="js/jquery-1.11.2.min.js"></script>      <!-- jQuery -->
    <script src="js/jquery-migrate-1.2.1.min.js"></script> <!--  jQuery Migrate Plugin -->
    <script src="https://www.google.com/jsapi"></script> <!-- Google Chart -->
    <script>
      /* Google Chart 
      -------------------------------------------------------------------*/
      // Load the Visualization API and the piechart package.
      google.load('visualization', '1.0', {'packages':['corechart']});

      // Set a callback to run when the Google Visualization API is loaded.
      google.setOnLoadCallback(drawChart); 
      
      // Callback that creates and populates a data table,
      // instantiates the pie chart, passes in the data and
      // draws it.
      function drawChart() {

          // Create the data table.
          var data = new google.visualization.DataTable();
          data.addColumn('string', 'Topping');
          data.addColumn('number', 'Slices');
          data.addRows([
            ['Mushrooms', 3],
            ['Onions', 1],
            ['Olives', 1],
            ['Zucchini', 1],
            ['Pepperoni', 2]
          ]);

          // Set chart options
          var options = {'title':'How Much Pizza I Ate Last Night'};

          // Instantiate and draw our chart, passing in some options.
          var pieChart = new google.visualization.PieChart(document.getElementById('pie_chart_div'));
          pieChart.draw(data, options);

          var barChart = new google.visualization.BarChart(document.getElementById('bar_chart_div'));
          barChart.draw(data, options);
      }

      $(document).ready(function(){
        if($.browser.mozilla) {
          //refresh page on browser resize
          // http://www.sitepoint.com/jquery-refresh-page-browser-resize/
          $(window).bind('resize', function(e)
          {
            if (window.RT) clearTimeout(window.RT);
            window.RT = setTimeout(function()
            {
              this.location.reload(false); /* false to get page from cache */
            }, 200);
          });      
        } else {
          $(window).resize(function(){
            drawChart();
          });  
        }   
      });
      
    </script>
    <script type="text/javascript" src="js/templatemo-script.js"></script>      <!-- Templatemo Script -->

  </body>
</html>