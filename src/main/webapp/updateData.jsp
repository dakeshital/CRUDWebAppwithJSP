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
	int id = Integer.parseInt(request.getParameter("id"));

	String name = request.getParameter("name");
	String uname = request.getParameter("username");
	String email = request.getParameter("email");
	String phone = request.getParameter("phone");
	String pass = request.getParameter("password");
	String cpass = request.getParameter("cpass");
	String gender = request.getParameter("gender");

	Class.forName("org.postgresql.Driver");
	Connection con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/testdb", "postgres", "Postgre@123");

	if (pass.equals(cpass)) {
		PreparedStatement psmt = con.prepareStatement("update users set fullName='" + name + "', userName='"+ uname + "', uEmail='" + email + "', uPhone='" + phone + "',uPass='" + pass + "', uCpass='" + cpass + "', uGender='" + gender + "'where uid='"+id+"' ");
				
		psmt.executeUpdate();
		out.println("<script>");
		out.println("alert('Record updated ')");
		out.println("window.location.href='displayData.jsp'");
		out.println("</script>");
	} else {
		out.println("<script>");
		out.println("alert('password does not match')");
		out.println("window.location.href='EditData.jsp'");
		out.println("</script>");
	}
	%>


</body>
</html>