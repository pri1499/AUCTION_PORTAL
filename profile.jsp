<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
import="javax.sql.rowset.*,oracle.jdbc.rowset.*,java.sql.*,oracle.sql.*"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="bootstrap1/css/bootstrap.css" rel="stylesheet" />
<link href="bootstrap1/css/bootstrap-theme.css" rel="stylesheet" />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
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
<%
		HttpSession s = request.getSession(false);
         String st=(String) s.getAttribute("name");
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
		<li class="nav-item"><a class="nav-link" href="ita_list.jsp">ITA</a></li>
		<li class="nav-item"><a class="nav-link" href="item_list.jsp">ITEMS</a></li>
		<li class="nav-item"><a class="nav-link" href="po.jsp">PURCHASE ORDER</a></li>
		<li class="nav-item"><a class="nav-link" href="reports.jsp">REPORTS</a></li>
		<li class="nav-item" style="float: right;"><a class="nav-link"
			href="logout.jsp">LOGOUT</a></li>
	</ul>
	</nav>
	<br>
	<br>
	<%
		try {
				OracleCachedRowSet rs = new OracleCachedRowSet();
				rs.setUrl("jdbc:oracle:thin:@localhost:1521:XE");
				rs.setUsername("system");
				rs.setPassword("tsp14");
				rs.setCommand("select * from persons where name=?");
				rs.setString(1, st);
				rs.execute();
				%>
				<table border="1" width="80%" style="border-collapse: collapse;">
				<% 
				while (rs.next()) {
					out.println(String.format("<tr><th>NAME</th><td>%s</td></tr><tr><th>USER-NAME</th><td>%s</td></tr><tr><th>EMAIL</th><td>%s</td></tr><tr><th>PHONE</th><td>%s</td></tr><tr><th>TYPE</th><td>%s</td></tr><tr><th>ADDRESS</th><td>%s</td></tr>",
							rs.getString("name"), rs.getString("uname"), rs.getString("email"),
							rs.getString("phone"),rs.getString("ptype"),rs.getString("address")));
				}


	} catch (Exception ex) {
			ex.printStackTrace();

		}
	
		 			
	%>
	</table> <br><br>
	  <a href="editProf.jsp"
				style="text-decoration: none;text-align:center">
				<button class="btn btn-primary">EDIT PROFILE</button>
			</a> 
	
	<%
	}
	%>
</body>
</html>