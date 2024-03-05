<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
	//id get from url
	int id = Integer.parseInt(request.getParameter("id"));
	Class.forName("org.postgresql.Driver");
	Connection con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/testdb", "postgres", "Postgre@123");

	PreparedStatement psmt = con.prepareStatement("delete from users where uid='" + id + "'");

	psmt.executeUpdate();
	out.println("<script>");
	out.println("alert('Record successfully Deleted')");
	out.println("window.location.href='displayData.jsp'");
	out.println("</script>");
	%>


</body>
</html>