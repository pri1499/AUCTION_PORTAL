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
<script>
	function validate() {
		var name = document.form.name.value;
		var email = document.form.email.value;
		var uame = document.form.uname.value;

		if (name == null || name == "") {
			alert("Full Name can't be blank");
			return false;
		} else if (email == null || email == "") {
			alert("Email can't be blank");
			return false;
		} else if (uname == null || uname == "") {
			alert("Username can't be blank");
			return false;
		}
		}

	
</script>
<style>
input[type=text], input[type=password], select {
	width: 50%;
	padding: 12px 20px;
	margin: 8px 0;
	display: inline-block;
	border: 1px solid #ccc;
	border-radius: 4px;
	border-sizing: border-box;
}

input[type=submit] {
	width: 50%;
	background-color: #4CAF50;
	color: white;
	padding: 14px 20px;
	margin: 8px 0px;
	border: none;
	border-radius: 4px;
	cursor: pointer;
}

input[type=submit]:hover {
	background-color: #45a049;
}

div {
	margin: auto;
	width: 50%;
	border-radius: 5px;
	background-color: #f2f2f2;
	padding: 20px;
}

label {
	padding: 12px 12px 12px 0;
	display: inline-block;
}


#logo {
	float: left;
	height: 50px;
}
h1, h2 {
	text-align: center;
}
</style>
</head>
<body><%
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
		<li class="nav-item "><a class="nav-link" href="po.jsp"> PURCHASE ORDER</a></li>
		<li class="nav-item"><a class="nav-link" href="profile.jsp">PROFILE</a></li>
		<li class="nav-item"><a class="nav-link" href="reports.jsp">REPORTS</a></li>
		<li class="nav-item"><a class="nav-link" href="logout.jsp">LOG OUT</a></li>
	</ul>
	</nav>
	<h2>EDIT YOUR DETAILS!!</h2><br><br>
	<%
	Connection con = null;
	Class.forName("oracle.jdbc.driver.OracleDriver");
	con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "system", "tsp14");
	PreparedStatement ps = con.prepareStatement("Select name,uname,phone,address,email from persons where name=?");
	ps.setString(1, st);
	ResultSet rs = ps.executeQuery();
	while (rs.next()) {
		String name=rs.getString("name");
		String uname=rs.getString("uname");
		String phone=rs.getString("phone");
		String email=rs.getString("email");
		String address=rs.getString("address");
	
	
	
	%>
	<div>
	<form name="form" method="post" action="updateProf.jsp"
			onsubmit="return validate()">
			<label for="name">FULLNAME</label> <input type="text" name="name"
				value="<%=name%>"><br> <label for="name">USERNAME</label>
			<input type="text" name="uname" value="<%=uname %>"><br>
			<label for="contact">CONTACT NO.</label> <input type="number"
				name="phone" value="<%=phone%>"><br> <label for="address">ADDRESS</label>
			<input type="text" name="address" value="<%=address%>"><br>
			<label for="email">EMAIL</label> <input type="text"
				name="email" value="<%=email%>"><br> <input
				type="submit" value="SAVE">
		</form>
	</div>
	
	<%
	}
		 }
	%>
</body>
</html>
