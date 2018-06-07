<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">  
    <title>欢迎进入选课系统</title>
    <meta name="description" content="">
    <meta name="author" content="templatemo">
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,400italic,700' rel='stylesheet' type='text/css'>
    <link href="css/font-awesome.min.css" rel="stylesheet">
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/templatemo-style.css" rel="stylesheet">

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
    		String dept = null;
    		String sex = null;
    		int age;
    		String in_year = null;
    		String birth = null;
    		String sno = null;
    		String cno = null;
    		if(rs.next()){
    			nickname = rs.getString("nickname");
    			dept = rs.getString("dept");
    			sno = rs.getString("sno");
    			cno = rs.getString("cno");
    			sex = rs.getString("sex");
    			age = Integer.parseInt(rs.getString("age"));
    			in_year = rs.getString("in_year");
    			birth = rs.getString("birth");
    		}
    		ct.close();
    	  %>
          <h1>欢迎<%= nickname %></h1>
        </header>
<!--         <div class="profile-photo-container"> -->
<!--           <img src="images/profile-photo.jpg" alt="Profile Photo" class="img-responsive">   -->
<!--           <div class="profile-photo-overlay"></div> -->
<!--         </div>       -->
        <div class="mobile-menu-icon">
            <i class="fa fa-bars"></i>
        </div>
        <nav class="templatemo-left-nav">          
          <ul>
            <li><a href="#" class="active"><i class="fa fa-home fa-fw"></i>个人信息</a></li>
            <li><a href="choose.jsp"><i class="fa fa-bar-chart fa-fw"></i>选课</a></li>
            <li><a href="lesson.jsp"><i class="fa fa-map-marker fa-fw"></i>修读课程</a></li>
<!--             <li><a href="#"><i class="fa fa-users fa-fw"></i>选课记录</a></li> -->
            <li><a href="reviseInfo.jsp"><i class="fa fa-users fa-fw"></i>修改信息</a></li>
            <li><a href="login.jsp" onclick="return confirm('确认注销？');"><i class="fa fa-eject fa-fw"></i>注销</a></li>
          </ul>  
        </nav>
      </div>
      <!-- Main content --> 
      <div class="templatemo-content col-1 light-gray-bg">
      <div class="templatemo-content-widget white-bg col-2">
              <i class="fa fa-times"></i>
              <div class="media margin-bottom-30">
                <div class="media-left padding-right-25">
                  <a href="">
                    <img class="media-object img-circle templatemo-img-bordered" src="images/person.jpg" alt="Sunset">
                  </a>
                </div>
                <div class="media-body">
                  <h2 class="media-heading text-uppercase blue-text"><%= nickname %>(<%= username %>)</h2>
<!--                   <p>Project Manager</p> -->
                </div>        
              </div>
              <div class="table-responsive">
                <table class="table">
                  <tbody>
                    <tr>
                      <td><div class="circle green-bg"></div></td>
                      <td>性别</td>
                      <td><%= sex %></td>                    
                    </tr> 
                    <tr>
                      <td><div class="circle pink-bg"></div></td>
                      <td>所在院系</td>
                      <td><%= dept %></td>                    
                    </tr>  
                    <tr>
                      <td><div class="circle orange-bg"></div></td>
                      <td>学号</td>
                      <td><%= sno %></td>                    
                    </tr> 
                    <tr>
                      <td><div class="circle green-bg"></div></td>
                      <td>班号</td>
                      <td><%= cno %></td>                    
                    </tr> 
                    <tr>
                      <td><div class="circle blue-bg"></div></td>
                      <td>入学年份</td>
                      <td><%= in_year %></td>                    
                    </tr>  
                    <tr>
                      <td><div class="circle yellow-bg"></div></td>
                      <td>出生年月</td>
                      <td><%= birth %></td>                    
                    </tr>                                      
                  </tbody>
                </table>
              </div>             
            </div>
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