<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.io.*" %>
<%@page import="java.sql.PreparedStatement" %>
<%@page import="java.text.SimpleDateFormat" %>
<%@page import="java.util.Date" %>
<%@page import="java.sql.DriverManager,java.sql.*" %>
<%@page import="java.sql.Connection" %>
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

int ita_no = Integer.parseInt(request.getParameter("ita_no"))	;
int item_no = Integer.parseInt(request.getParameter("item_no"));
String uname = request.getParameter("uname");
int qty_reqd = Integer.parseInt(request.getParameter("qty_reqd"));

SimpleDateFormat format1 = new SimpleDateFormat("yyyy-MM-dd");
format1.setLenient(false);
Date delydate = format1.parse(request.getParameter("dely_date"));
java.sql.Date sqlDate1 = new java.sql.Date(delydate.getTime());

int est_rate = Integer.parseInt(request.getParameter("est_rate"));
int qty_quoted = Integer.parseInt(request.getParameter("qty_quoted"));
int rate_quoted= Integer.parseInt(request.getParameter("rate_quoted"));

SimpleDateFormat format2 = new SimpleDateFormat("yyyy-MM-dd");
format2.setLenient(false);
Date rastartdate = format2.parse(request.getParameter("ra_start_date"));
java.sql.Date sqlDate2 = new java.sql.Date(rastartdate.getTime());

SimpleDateFormat format3 = new SimpleDateFormat("yyyy-MM-dd");
format3.setLenient(false);
Date rastopdate = format3.parse(request.getParameter("ra_stop_date"));
java.sql.Date sqlDate3 = new java.sql.Date(rastopdate.getTime());


Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","tsp14");
PreparedStatement ps = con.prepareStatement("insert into ra values(ra_seq.nextval,?,?,?,?,?,?,?,?,?,?,sysdate)");

ps.setInt(1,ita_no);
ps.setInt(2,item_no);
ps.setString(3,uname);
ps.setInt(4,qty_reqd);
ps.setDate(5,sqlDate1);
ps.setInt(6,est_rate);
ps.setInt(7,qty_quoted);
ps.setInt(8,rate_quoted);
ps.setDate(9,sqlDate2);
ps.setDate(10,sqlDate3);
int i=ps.executeUpdate();


if(i!=0)
{
	%>
	<center>
		<h1 style="color: red">DONE SUCCESSFULLY</h1>
	</center>
	<%
		getServletContext().getRequestDispatcher("/item_list.jsp").include(request, response);
		}

else
	out.println("registration FAIL");


con.close();
ps.close();
}

	%>