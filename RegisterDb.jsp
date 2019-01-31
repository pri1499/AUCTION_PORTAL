<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	import="javax.sql.rowset.*,oracle.jdbc.rowset.*,java.sql.*,oracle.sql.*"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="bootstrap1/css/bootstrap.css" rel="stylesheet" />
<link href="bootstrap1/css/bootstrap-theme.css" rel="stylesheet" />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Registered!!</title>
<style>
#logo {
	float: left;
	height: 50px;
}

h1, h2 {
	text-align: center;
}

.main {
	text-align: center;
}
</style>
</head>
<body>
	<script src="bootstrap/js/bootstrap.min.js"></script>
	<img id="logo" src="images/vizag.jpg" style="width: 100px; height: 100px;"
		alt="vizag steel" />
	<h1>VIZAG STEEL PLANT</h1>
	<h2>AUCTION PORTAL</h2>
	<nav class="navbar navbar-expand-sm bg-secondary navbar-dark">
	<ul class="navbar-nav">
		<li class="nav-item "><a class="nav-link" href="home.jsp">HOME</a></li>
		<li class="nav-item"><a class="nav-link" href="about_us.jsp">ABOUT US</a></li>
		<li class="nav-item"><a class="nav-link" href="contact_us.jsp">CONTACT US</a></li>
		<li class="nav-item"><a class="nav-link" href="reports.jsp">REPORTS</a></li>
	</ul>
	</nav>
	
	<br>
	<br>
	<br>
	<hr>
	<div class=main>

		<%
			String name = request.getParameter("name");
			String email = request.getParameter("email");
			String uname = request.getParameter("uname");
			String pwd = request.getParameter("pwd");
			String phone = request.getParameter("phone");
			String address = request.getParameter("address");
			String ptype = request.getParameter("ptype");

			Connection con = null;

			try {

				Class.forName("oracle.jdbc.driver.OracleDriver");
				con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "system", "tsp14");
				String query = "insert into persons(slno,name,email,uname,pwd,ptype,phone,address) values (persons_seq.nextval,?,?,?,?,?,?,?)";
				PreparedStatement ps = con.prepareStatement(query);
				ps.setString(1, name);
				ps.setString(2, email);
				ps.setString(3, uname);
				ps.setString(4, pwd);
				ps.setString(5, ptype);
				ps.setString(6, phone);
				ps.setString(7, address);

				int i = ps.executeUpdate();

				if (i != 0) {
					out.println("HI  " + uname);
					out.println(" . You have registered successfully! ");
		%>
		<br>
		<br> <a href="home.jsp"> LOGIN FOR FURTHER DETAILS!</a>
		<hr>
		<%
			} else {
					out.println("SORRY! PLEASE TRY AGAIN");
				}
			} catch (Exception ex) {

				System.out.println("Error -->" + ex.getMessage());
				ex.printStackTrace();
			} finally {

				try {

					con.close();

				} catch (Exception ex) {

				}

			}
		%>

	</div>
</body>
</html>