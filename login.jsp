<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	import="javax.sql.rowset.*,oracle.jdbc.rowset.*,java.sql.*,oracle.sql.*"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>login</title>
</head>
<body>
	<%
		Connection con = null;
		String uname = request.getParameter("uname");
		String pwd = request.getParameter("pwd");
		Class.forName("oracle.jdbc.driver.OracleDriver");
		con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "system", "tsp14");
		PreparedStatement ps = con.prepareStatement("Select slno,name,ptype from persons where uname = ? and pwd = ? ");
		ps.setString(1, uname);
		ps.setString(2, pwd);
		ResultSet rs = ps.executeQuery();
		if (rs.next()) {
			String name = rs.getString("name");
			String slno = rs.getString("slno");
			String ptype = rs.getString("ptype");
			session.setAttribute("name", name);
			session.setAttribute("ptype", ptype);
			session.setAttribute("slno", slno);
			if (ptype.equals("SUPPLIER")) {
				response.sendRedirect("item_list.jsp");
			} else {
				if (ptype.equals("USER")) {
					response.sendRedirect("user_list.jsp");
				}
			}
		} else {
	%>
	<center>
		<p style="color: red">Error In Login</p>
	</center>
	<%
		getServletContext().getRequestDispatcher("/home.jsp").include(request, response);
		}
	%>



</body>
</html>