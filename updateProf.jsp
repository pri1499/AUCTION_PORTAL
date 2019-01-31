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
</head>
<style>
#logo {
	float: left;
	height: 50px;
}
h1, h2 {
	text-align: center;
}
</style>
<body>
<%
		HttpSession s = request.getSession(false);
         String str=(String) s.getAttribute("name");
         String slno=(String) s.getAttribute("slno");
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

	<script src="bootstrap/js/bootstrap.min.js"></script>
	<img id="logo" src="images/vizag.jpg" style="width: 100px; height: 100px;"
		alt="vizag steel" />
	<h1>VIZAG STEEL PLANT</h1>
	<h2>AUCTION PORTAL</h2>
	<nav class="navbar navbar-expand-sm bg-secondary navbar-dark">
	<ul class="navbar-nav">
		
		<li class="nav-item"><a class="nav-link" href="about_us.jsp">ABOUT US</a></li>
		<li class="nav-item"><a class="nav-link" href="contact_us.jsp">CONTACT US</a></li>
		<li class="nav-item "><a class="nav-link" href="ita_list.jsp">ITA</a></li>
		<li class="nav-item "><a class="nav-link" href="po.jsp">PURCHASE ORDER</a></li>
		<li class="nav-item"><a class="nav-link" href="profile.jsp">PROFILE</a></li>
		<li class="nav-item"><a class="nav-link" href="reports.jsp">REPORTS</a></li>
		<li class="nav-item"><a class="nav-link" href="logout.jsp">LOG OUT</a></li>
		
	</ul>
	</nav>
	<%
			String name = request.getParameter("name");
			String email = request.getParameter("email");
			String uname = request.getParameter("uname");
			String phone = request.getParameter("phone");
			String address = request.getParameter("address");
			
			Connection con = null;

			try {

				Class.forName("oracle.jdbc.driver.OracleDriver");
				con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "system", "tsp14");
				Statement st=null;
				st=con.createStatement();
				int i=st.executeUpdate("update persons set name='"+name+"',address='"+address+"',phone="+phone+",email='"+email+"',uname='"+uname+"' where slno='"+slno+"'");

				

				if (i != 0) {
					out.println("Updated successfully! ");
		
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
		 }
		%>
	
</body>
</html>