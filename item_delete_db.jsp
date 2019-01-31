<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
import="javax.sql.rowset.*,oracle.jdbc.rowset.*,java.sql.*,oracle.sql.*"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
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
	
		String item_no = request.getParameter("item_no");
			

			Connection con = null;

			try {

				Class.forName("oracle.jdbc.driver.OracleDriver");
				con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "system", "tsp14");
				String query = "delete from item where item_no=?";
				PreparedStatement ps = con.prepareStatement(query);
				ps.setString(1, item_no);
				
				int i = ps.executeUpdate();

				if (i != 0) {
	%>
	<center>
		<h1 style="color: green">DELETED SUCCESSFULLY!!</h1>
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