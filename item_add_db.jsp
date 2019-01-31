<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	import="javax.sql.rowset.*,oracle.jdbc.rowset.*,java.sql.*,oracle.sql.*"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="bootstrap1/css/bootstrap.css" rel="stylesheet" />
<link href="bootstrap1/css/bootstrap-theme.css" rel="stylesheet" />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add to DB</title>

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
	
		String item_desc = request.getParameter("item_desc");
			String tech_spec = request.getParameter("tech_spec");
			String qty_reqd = request.getParameter("qty_reqd");

			Connection con = null;

			try {

				Class.forName("oracle.jdbc.driver.OracleDriver");
				con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "system", "tsp14");
				String query = "insert into item values (item_seq.nextval,?,?,?)";
				PreparedStatement ps = con.prepareStatement(query);
				ps.setString(1, item_desc);
				ps.setString(2, tech_spec);
				ps.setString(3, qty_reqd);
				int i = ps.executeUpdate();

				if (i != 0) {
	%>
	<center>
		<h1 style="color: green">ADDED SUCCESSFULLY!!</h1>
	</center>
	<%
		getServletContext().getRequestDispatcher("/user_list.jsp").include(request, response);
				}

				else {
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
	%><br>
	<br>
</body>
</html>