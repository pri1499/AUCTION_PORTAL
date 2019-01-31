<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.PreparedStatement" %>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.Connection" %>
<%@page import="java.util.Date" %>
<%@page import="java.text.SimpleDateFormat" %>

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

int ita_no = Integer.parseInt(request.getParameter("ita_no"));

SimpleDateFormat format3 = new SimpleDateFormat("yyyy-MM-dd");
format3.setLenient(false);
Date itadate = format3.parse(request.getParameter("ita_date"));
java.sql.Date sqlDate3 = new java.sql.Date(itadate.getTime());

int item_no = Integer.parseInt(request.getParameter("item_no"));
int est_rate = Integer.parseInt(request.getParameter("estm_rate"));

SimpleDateFormat format4 = new SimpleDateFormat("yyyy-MM-dd");
format4.setLenient(false);
Date delydate = format4.parse(request.getParameter("dely_date"));
java.sql.Date sqlDate4 = new java.sql.Date(delydate.getTime());

SimpleDateFormat format1 = new SimpleDateFormat("yyyy-MM-dd");
format1.setLenient(false);
Date startdate = format1.parse(request.getParameter("start_date"));
java.sql.Date sqlDate1 = new java.sql.Date(startdate.getTime());
 
SimpleDateFormat format2 = new SimpleDateFormat("yyyy-MM-dd");
format2.setLenient(false);
Date stopdate = format2.parse(request.getParameter("stop_date"));
java.sql.Date sqlDate2 = new java.sql.Date(stopdate.getTime());
String remarks = request.getParameter("remarks");

Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","tsp14");
PreparedStatement ps = con.prepareStatement("insert into ita values(?,?,?,?,?,?,?,?)");
ps.setInt(1,ita_no);
ps.setDate(2,sqlDate3);
ps.setInt(3,item_no);
ps.setInt(4,est_rate);
ps.setDate(5,sqlDate4);
ps.setDate(6,sqlDate1);
ps.setDate(7,sqlDate2);
ps.setString(8,remarks);
int i =ps.executeUpdate();

con.close();
ps.close();

if(i!=0)
{
		%>
		<center>
		<p style="color: green">ITA HAS BEEN GENERATED</p>
	</center>
	<%
		getServletContext().getRequestDispatcher("/ita_list.jsp").include(request, response);
		}

		} %>	