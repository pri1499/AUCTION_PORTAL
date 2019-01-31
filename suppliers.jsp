<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
import="javax.sql.rowset.*,oracle.jdbc.rowset.*,java.sql.*,oracle.sql.*"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="bootstrap1/css/bootstrap.css" rel="stylesheet" />
<link href="bootstrap1/css/bootstrap-theme.css" rel="stylesheet" />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>SUPPLIERS</title>
<style>
#logo {
	float: left;
	height: 50px;
}

h1, h2 {
	text-align: center;
	color: blue;
}
</style>
</head>
<body>
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
		<li class="nav-item"><a class="nav-link" href="ita_gen.jsp">ITA_FORM_GEN</a></li>
		<li class="nav-item "><a class="nav-link" href="user_list.jsp">ITEMS</a></li>
		<li class="nav-item"><a class="nav-link" href="PoforVendor.jsp">PURCHASE ORDER</a></li>
		<li class="nav-item"><a class="nav-link" href="reports.jsp">REPORTS</a></li>
		<li class="nav-item" style="float: right;"><a class="nav-link"
			href="logout.jsp">LOGOUT</a></li>
	</ul>
	</nav>
	<br>
	<br>
	
	
	
	
	
	
	
	
<%} %>
</body>
</html>