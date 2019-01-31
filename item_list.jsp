<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	import="javax.sql.rowset.*,oracle.jdbc.rowset.*,java.sql.*,oracle.sql.*"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="bootstrap1/css/bootstrap.css" rel="stylesheet" />
<link href="bootstrap1/css/bootstrap-theme.css" rel="stylesheet" />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Item List</title>

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
		<li class="nav-item"><a class="nav-link" href="profile.jsp">PROFILE</a></li>
		<li class="nav-item "><a class="nav-link" href="ita_list.jsp">ITA</a></li>
		<li class="nav-item"><a class="nav-link" href="po.jsp">PURCHASE ORDER</a></li>
		<li class="nav-item"><a class="nav-link" href="reports.jsp">REPORTS</a></li>
		<li class="nav-item" style="float: right;"><a class="nav-link"
			href="logout.jsp">LOGOUT</a></li>
	</ul>
	</nav>
	<br>
	<br>
	<h3>Item List</h3>



	<%
		try {
				OracleCachedRowSet rs = new OracleCachedRowSet();
				rs.setUrl("jdbc:oracle:thin:@localhost:1521:XE");
				rs.setUsername("system");
				rs.setPassword("tsp14");
				rs.setCommand("select item_no,item_desc,tech_spec,qty_reqd from item");
				rs.execute();
	%>
	<table border="1" width="100%" style="border-collapse: collapse;">
		<tr>
			<th>ITEM_NO</th>
			<th>ITEM_DESCRIPTION</th>
			<th>TECHNICAL SPECIFICATION</th>
			<th>QTY REQD</th>
		</tr>

		<%
			while (rs.next()) {
						out.println(String.format("<tr><td>%s</td><td>%s</td><td>%s</td><td>%s</td></tr>",
								rs.getString("item_no"), rs.getString("item_desc"), rs.getString("tech_spec"),
								rs.getString("qty_reqd")));
					}
		%>
	</table>
	<%
		} catch (Exception ex) {
				ex.printStackTrace();

			}
		}
	%><br>
	<br>
	</body>
</html>
