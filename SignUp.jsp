<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="bootstrap1/css/bootstrap.css" rel="stylesheet" />
<link href="bootstrap1/css/bootstrap-theme.css" rel="stylesheet" />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script>
	function validate() {
		var name = document.form.name.value;
		var pass = document.form.pwd.value;
		var repass = document.form.repwd.value;
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
		} else if (pass.length < 6) {
			alert("Password must be at least 6 characters long.");
			return false;
		} else if (pass != repass) {
			alert("Confirm Password should match with the Password");
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
<title>signUp</title>
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
	<h3>REGISTER !!!</h3>

	<br>
	<div>
		<form name="form" method="post" action="RegisterDb.jsp"
			onsubmit="return validate()">
			<label for="name">FULLNAME</label> <input type="text" name="name"
				placeholder="your name..."><br> <label for="name">USERNAME</label>
			<input type="text" name="uname" placeholder="your name..."><br>
			<label for="pwd">PASSWORD</label> <input type="password" name="pwd"
				placeholder="type your password..."><br> <label
				for="retypePwd">RE-TYPE PASSWORD</label> <input type="password"
				name="repwd" placeholder="Re-Type your password..."><br>
			<label for="contact">CONTACT NO.</label> <input type="number"
				name="phone"><br> <label for="address">ADDRESS</label>
			<input type="text" name="address" placeholder=" your address..."><br>
			<label for="ptype">TYPE</label> <select name="ptype"><br>

				<option value="USER">USER</option>
				<option value="SUPPLIER">SUPPLIER</option>
				<option value="ADMIN">ADMIN</option>
			</select><br> <label for="email">EMAIL</label> <input type="text"
				name="email" placeholder=" your email-id..."><br> <input
				type="submit" value="SUBMIT">
		</form>
	</div>
</body>
</html>