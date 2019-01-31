<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page
	import="javax.sql.rowset.*,oracle.jdbc.rowset.*,java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="bootstrap1/css/bootstrap.css" rel="stylesheet" />
<link href="bootstrap1/css/bootstrap-theme.css" rel="stylesheet" />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>ITA List</title>
<style>
#logo {
	float: left;
	height: 50px;
}

h1, h2 {
	text-align: center;
	color: blue;
}

table {
	border-collapse: collapse;
	border-spacing: 0;
	width: 100%;
	border: 1px solid #ddd;
}


.ra_form  {
	display: block;
}


th, td {
	text-align: left;
	padding: 8px;
}
/* table, th, td {
       text-align: center;
       
         border: 1px solid black;
        }*/
tr:nth-child(even) {
	background-color: #f2f2f2
}
</style>
<script type="text/javascript">

function show() { 
    
        document.getElementById('ra_form').style.display='block'; 
    
    
} 
</script>
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
		<li class="nav-item"><a class="nav-link" href="po.jsp">PURCHASE ORDER</a></li>
		<li class="nav-item "><a class="nav-link" href="item_list.jsp">ITEMS</a></li>
		<li class="nav-item"><a class="nav-link" href="reports.jsp">REPORTS</a></li>
		<li class="nav-item" style="float: right;"><a class="nav-link"
			href="logout.jsp">LOGOUT</a></li>
	</ul>
	</nav>
	<br>
	<br>
	<br>
	<br>
	<h3>ITA LIST</h3>
	<%
		OracleCachedRowSet rs = new OracleCachedRowSet();
			rs.setUrl("jdbc:oracle:thin:@localhost:1521:XE");
			rs.setUsername("system");
			rs.setPassword("tsp14");
			rs.setCommand(
					"select ITA_NO , ITA_DATE ,ITEM_NO ,EST_RATE ,DELY_DATE ,RA_START_DATE ,RA_STOP_DATE ,REMARKS  from ita order by item_no");
			rs.execute();
	%>

	<div style="overflow-x: auto;">
		<table style="width: 90%">
			<thead>
				<tr>

					<th>ITA No</th>
					<th>ITA Date</th>
					<th>ITEM No</th>
					<th>Estimate Rate</th>
					<th>Deliver Date</th>
					<th>RA Start Date</th>
					<th>RA Stop Date</th>
					<th>Remarks</th>
				</tr>


				<%
					while (rs.next()) {

							out.println(String.format(
									"<tr><td>%s</td><td>%s</td><td>%s</td><td>%s</td><td>%s</td><td>%s</td><td>%s</td><td>%s</td></tr>",
									rs.getInt("ita_no"), rs.getDate("ita_date"), rs.getInt("item_no"),
									rs.getInt("EST_RATE"), rs.getDate("DELY_DATE"), rs.getDate("RA_START_DATE"),
									rs.getDate("RA_STOP_DATE"), rs.getString("remarks")));
						}
				%>
			</thead>
		</table>
	</div>
	<br>
	<button onclick="show();">APPLY FOR REVERSE AUCTION(SUPPLIERS ONLY)</button>
	<div class="ra_form">
			<form method="post" action="submit_ra.jsp">
				<table style="width: 90%">

					<tr>
						<th>ITA NO</th>
						<td><input type="number" name="ita_no" required></td>
					</tr>
					<tr>
						<th>ITEM NO</th>
						<td><input type="number" name="item_no" value="" required></td>
					</tr>
					<tr>
						<th>USERNAME</th>
						<td><input type="text" name="uname" value="" required></td>
					</tr>
					<tr>
						<th>QUANTITY REQUIRED</th>
						<td><input type="number" name="qty_reqd" required value=""></td>
					</tr>
					<tr>
						<th>DELIVERYDATE</th>
						<td><input class="small" type="date" required
							PLACEHOLDER="yyyy-MM-dd" name="dely_date"></td>
					</tr>
					<tr>
						<th>ESTIMATED RATE</th>
						<td><input type="number" name="est_rate" required value=""></td>
					</tr>
					<tr>
						<th>QUOTED QUANTITY</th>
						<td><input type="number" name="qty_quoted" required value=""></td>
					</tr>
					<tr>
						<th>QUOTED RATE</th>
						<td><input type="number" name="rate_quoted" required value=""></td>
					</tr>
					<tr>
						<th>RA START DATE</th>
						<td><input class="small" type="date" PLACEHOLDER="yyyy-MM-dd"
							required name="ra_start_date"></td>
					</tr>
					<tr>
						<th>RA STOP DATE</th>
						<td><input class="small" type="date" PLACEHOLDER="yyyy-MM-dd"
							required name="ra_stop_date"></td>
					</tr>

				</table>
				<b><input type="submit" id="button" value="Submit details"></b>
			</form>
		</div>
	

<%
		}
	%>
</body>
</html>