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
	String name = request.getParameter("name");
	String uname = request.getParameter("username");
	String email = request.getParameter("email");
	String phone = request.getParameter("phone");
	String pass = request.getParameter("password");
	String cpass = request.getParameter("cpass");
	String gender = request.getParameter("gender");

	Class.forName("org.postgresql.Driver");
	Connection con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/testdb", "postgres", "Postgre@123");
	
	if(pass.equals(cpass)){
		PreparedStatement psmt = con.prepareStatement(
				"insert into users(fullName, userName, uEmail, uPhone, uPass, uCpass, uGender) values('" + name + "','" + uname
				+ "','" + email + "','" + phone + "','" + pass + "','" + cpass + "','" + gender + "')");
		psmt.executeUpdate();
		out.println("<script>");
		out.println("alert('Registration successfull')");
		out.println("window.location.href='displayData.jsp'");
		out.println("</script>");
	}else{
		out.println("<script>");
		out.println("alert('password does not match')");
		out.println("window.location.href='index.html'");
		out.println("</script>");
	}
	
	%>

</body>
</html>