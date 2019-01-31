<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="bootstrap1/css/bootstrap.css" rel="stylesheet" />
<link href="bootstrap1/css/bootstrap-theme.css" rel="stylesheet" />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<style>
#logo {
	float: left;
	height: 50px;
}

h1, h2 {
	text-align: center;
	color: blue;
}

#login {
	background-color: powder blue;
	border: 2px solid black;
	width: 400px;
	height: 400px;
	margin: 20px;
	padding: 10px;
}

.demo {
	position: relative;
	top: -420px;
	left: 460px;
}
</style>

<meta charset="ISO-8859-1">
<title>Auction Portal</title>
</head>
<body>
	<script src="bootstrap1/js/bootstrap.min.js"></script>
	<img id="logo" src="images/vizag.jpg"
		style="width: 120px; height: 100px;" alt="vizag steel" />
	<h1>VIZAG STEEL PLANT</h1>
	<h2>AUCTION PORTAL</h2>
	<nav class="navbar navbar-expand-sm bg-secondary navbar-dark">
	<ul class="navbar-nav">
		<li class="nav-item "><a class="nav-link" href="home.jsp">HOME</a></li>
		<li class="nav-item"><a class="nav-link" href="about_us.jsp">ABOUT
				US</a></li>
		<li class="nav-item"><a class="nav-link" href="contact_us.jsp">CONTACT US</a></li>
		<li class="nav-item"><a class="nav-link" href="reports.jsp">REPORTS</a></li>
	</ul>
	</nav>


	<div id="login" class="jumbotron">
		<form action="login.jsp" method="post">
			<div class="form-group">
				<label for="uname">Username:</label> <input type="uname"
					class="form-control" id="uname" placeholder="Enter username"
					name="uname">
			</div>
			<div class="form-group">
				<label for="pwd">Password:</label> <input type="password"
					class="form-control" id="pwd" placeholder="Enter password"
					name="pwd">
			</div>
			<div class="form-group form-check">
				<label class="form-check-label"> <input
					class="form-check-input" type="checkbox" name="remember">
					Remember me
				</label>
			</div>
			<button type="submit" class="btn btn-primary">LOGIN</button>
		</form>
		<br> <br> <a href="SignUp.jsp"
			style="text-decoration: none;">
			<button class="btn btn-primary">SIGN UP</button>
		</a>

	</div>
	<div class="demo">
		<pre
			style="color: white; background-image: url('images/vizag3.png'); background-repeat: no-repeat; background-size: contain">
Rashtriya Ispat Nigam Limited (RINL) - a Navratna Public Sector Enterprise with 100% ownership of 
GoI, is the corporate entity of Visakhapatnam Steel Plant. VSP is India first shore based
integrated steel plant, located at Visakhapatnam and has a rated capacity of 7.3 Mt of liquid steel.

A pioneer in the steel industry in adoption of system standards, VSP is accredited for ISO 9001,
ISO 14001, OHSAS 18001, CMMI-Level 3for IT system & ISO 27001 for Information Security management
System and is the first PSE to be certified for ISO 50001 for EnergyManagement system.

<span style="color: red;">Technological facilities & capacities:</span>
The process of steel making at VSP is through the BF-BOF route. Technologies adopted during inception
of plant were the first of its kind in the Indian steel industry and this has been a source of
competitive advantage in operational efficiency.

<span style="color: red;">Products& Market:</span>
RINL has established itself as a market leader in bars and rods segment of long steel products and 
caters to diverse applications in manufacturing and construction sectors.The principal products
of VSP include steel products comprising of re-bars, wire rods, rounds, structurals, blooms &
 billets and pig iron. Also, the company markets the resulting by-products like coal chemicals 
 (Ammonium Sulphate, Benzol products etc.) and slag. 
		</pre>
	</div>



</body>
</html>