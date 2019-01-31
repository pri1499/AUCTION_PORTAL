<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.PreparedStatement" %>
<%@page import="java.sql.*" %>
<%@page import="java.util.Date" %>
<%@page import="java.text.*" %>
<%@page import="oracle.sql.*" %>
<%@page import="java.sql.ResultSet"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="bootstrap1/css/bootstrap.css" rel="stylesheet" />
<link href="bootstrap1/css/bootstrap-theme.css" rel="stylesheet" />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>PURCHASE ORDER FORM FOR VENDORS</title>
 <<meta chars2et="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
   
<style>
#logo {
	float: left;
	height: 50px;
}

h1, h2 {
	text-align: center;
	color: blue;
}

.display,form
{
margin:40px;
}
table,
tr{
border:2px solid white;
 padding:10px;
border-radius:20px;
 margin:20px;
 
}
th,td{
padding:8px;
text-align:left;}

#button,#button:hover{
font-size:18px;
color:green;
margin:25px;
width:180px;
padding:10px;
}
.title{
font-size:30px;
margin-left:20px;
font-family:cursive;
}
</style>
</head>
<body><%
		HttpSession s = request.getSession(false);
		if (s == null || s.getAttribute("name") == null) {
	%>
	<center>
		<h1 style="color: red">PLEASE LOGIN!!</h1>
	</center>
	<%
		getServletContext().getRequestDispatcher("/home.jsp").include(request, response);
		}

		else {
	%>
	<script src="bootstrap1/js/bootstrap.min.js"></script>
	<img id="logo" src="images/vizag.jpg"
		style="width: 120px; height: 100px;" alt="vizag steel" />
	<h1>VIZAG STEEL PLANT</h1>
	<h2>AUCTION PORTAL</h2>
	<nav class="navbar navbar-expand-sm bg-secondary navbar-dark">
	<ul class="navbar-nav">

		<li class="nav-item"><a class="nav-link" href="about_us.jsp">ABOUT US</a></li>
		<li class="nav-item"><a class="nav-link" href="contact_us.jsp">CONTACT US</a></li>
		<li class="nav-item"><a class="nav-link" href="suppliers.jsp">SUPPLIERS</a></li>
		<li class="nav-item"><a class="nav-link" href="ita_gen.jsp">ITA_FORM_GEN</a></li>
		<li class="nav-item "><a class="nav-link" href="user_list.jsp">ITEMS</a></li>
		<li class="nav-item"><a class="nav-link" href="reports.jsp">REPORTS</a></li>
		<li class="nav-item" style="float: right;"><a class="nav-link"
			href="logout.jsp">LOGOUT</a></li>
	</ul>
	</nav>
	<br>
	<br>
	<br>
<div class="display">
<div class="title">PURCHASE ORDER FORM FOR VENDORS</div>
<br>
<form method="post" action="PoforVendor.jsp">
<table class=""style="width:80%"> 
<tr>
<td>
Enter a valid ITA NO:
</td>
<td><input size="30"type="number" name="ita_no" value="${param.ita_no}" ></td>
 </tr></table><br>
<input class="btn btn-success" type="submit" value="GET SUPPLIER DETAILS">
</form>

<%
String n=request.getParameter("ita_no");

if(n!=null)
{
try {
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","tsp14");

%><table class="table " style="width:90%">
<tr class="info">
 <th>SL NO</th>
<th>ITA NO</th>
<th>ITEM NO</th>
 <th>USERNAME</th>
 <th>QUANTITY REQUIRED</th>
 <th>DELIVERYDATE </th>
 <th> ESTIMATED RATE</th>
 <th>QUOTED QUANTITY</th>
 <th> QUOTED RATE</th>
 <th>RA START DATE</th>
 <th>RA STOP DATE</th>
 </tr>
<%
String sql="select * from ra where ita_no="+n;
PreparedStatement pst=(PreparedStatement) con.prepareStatement(sql);
ResultSet rs=(ResultSet) pst.executeQuery(sql);
while(rs.next())
	{
	
%>

 
 <tr class="info">
 <td><%=rs.getInt("ra_sl_no") %> </td>
 <td><%=rs.getInt("ita_no") %> </td>
 <td><%=rs.getInt("item_no") %> </td>
 <td><%=rs.getString("uname") %> </td>
 <td><%=rs.getInt("qty_reqd") %> </td>
 <td><%=rs.getDate("dely_date") %> </td>
 <td><%=rs.getInt("est_rate") %> </td>
 <td><%=rs.getInt("qty_quoted") %> </td>
 <td><%=rs.getInt("rate_quoted") %> </td>
 <td><%=rs.getDate("ra_start_date") %> </td>
 <td><%=rs.getDate("ra_stop_date") %> </td>
 
 </tr>
 
<%
	}%>
	
	<!-- ONLY FOR VENDOR -->
	
	
</table>
 <br>
 <form method="post" action="po.jsp" >
   <div class="alert alert-success"><tr><b>
   <td>Enter the Selected Supplier for this Auction : </b></td>
   <td><input type="text" name="uname"></td> </tr>
   <input type="submit" class="btn btn-success" value="Submit"></div>
   </form>
<%

	
con.close();
rs.close();
}
catch(Exception e)
{
	}
}
		}

%>
 </div>

</body>
</html>