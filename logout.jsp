<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="bootstrap1/css/bootstrap.css" rel="stylesheet" />
<link href="bootstrap1/css/bootstrap-theme.css" rel="stylesheet" />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>LOG OUT</title>
<style>
#logo {
float:left;
height:50px;
}
h1, h2 {
	text-align: center;
	color: blue;
}
h3,h4{
text-align: center;
}
</style>
</head>
<body>
<% HttpSession s = request.getSession(false);
s.invalidate(); %>

<script src="bootstrap1/js/bootstrap.min.js"></script>
	<img id="logo" src="images/vizag.jpg"
		style="width: 120px; height: 100px;" alt="vizag steel" />
	<h1>VIZAG STEEL PLANT</h1>
	<h2>AUCTION PORTAL</h2>
	<div class="progress" style="height:10px">
    <div class="progress-bar bg-warning" style="width:100%;height:10px"></div>
  </div><br><br><br>
	<h3 >YOU HAVE LOGGED OUT SUCCESSFULLY!!</h3>
	<a href="home.jsp"><h3> DO YOU WANT TO LOGIN AGAIN??</h3></a>
	
</body>
</html>