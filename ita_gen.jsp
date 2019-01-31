<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="bootstrap1/css/bootstrap.css" rel="stylesheet" />
<link href="bootstrap1/css/bootstrap-theme.css" rel="stylesheet" />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>ITA Update</title>
<link href="">
<style>
#logo {
	float: left;
	height: 50px;
}

h1, h2 {
	text-align: center;
	color: blue;
}

input[type=text] select {
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
		<li class="nav-item "><a class="nav-link" href="ita_list.jsp">ITA</a></li>
		<li class="nav-item"><a class="nav-link" href="suppliers.jsp">SUPPLIERS</a></li>
		<li class="nav-item"><a class="nav-link" href="PoforVendor.jsp">PURCHASE ORDER</a></li>	
		<li class="nav-item"><a class="nav-link" href="reports.jsp">REPORTS</a></li>
		<li class="nav-item" style="float: right;"><a class="nav-link"
			href="logout.jsp">LOGOUT</a></li>
	</ul>
	</nav>
	<br>
	<br>
	<h3 style="text-align:center;">ITA GENERATION FORM</h3>

	<form action="reg.jsp">

		<div>
			<table>
				<tr>
					<td><label>ITA No.</label></td>
					<td><input type="number" required name="ita_no" value=""></td>
				</tr>
				<tr>
					<td><label>ITA Date</label></td>
					<td><input type="date" required name="ita_date" value=""></td>
				</tr>
				<tr>
					<td><label>ITEM No.</label></td>
					<td><input type="number" required name="item_no" value=""></td>
				</tr>
				<tr>
					<td><label>USER NAME</label></td>
					<td><input type="text" required name="uname" value=""></td>
				</tr>
				<tr>
					<td><label>Estimated rate</label></td>
					<td><input type="text" class="area" required name="estm_rate"
						value=""></td>
				</tr>
				<tr>
					<td><label>Deliver date</label></td>
					<td><input type="date" required name="dely_date" value=""></td>
				</tr>

				<tr>
					<td><label>RA Start Date</label></td>
					<td><input type="date" required name="start_date" value=""></td>
				</tr>
				<tr>
					<td><label>RA Stop Date</label></td>
					<td><input type="date" required name="stop_date" value=""></td>
				</tr>
				
			</table>
		
		<br> <input type="submit" value="submit"
			style="background-color: darkgrey" />
    </div>
	</form>
	<br>
	<br>
	<%
		}
	%>
</body>
</html>