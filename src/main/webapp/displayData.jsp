<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Display Data</title>
</head>
<body>
	<table class="table" border="2px">
		<thead>
			<tr>
				<th scope="col">UserId</th>
				<th scope="col">Full Name</th>
				<th scope="col">User Name</th>
				<th scope="col">Email</th>
				<th scope="col">Phone No</th>
				<th scope="col">Password</th>
				<th scope="col">Gender</th>
				<th scope="col">Actions</th>
				
			</tr>
		</thead>
		<tbody>

			<%
			Class.forName("org.postgresql.Driver");
			Connection con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/testdb", "postgres", "Postgre@123");
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery("select * from users");
			while (rs.next()) {
			%>

			<tr>
				<th scope="row"><%out.println(rs.getInt(1));%></th>
				<td><%out.println(rs.getString(2));%></td>
				<td><%out.println(rs.getString(3));%></td>
				<td><%out.println(rs.getString(4));%></td>
				<td><%out.println(rs.getString(5));%></td>
				<td><%out.println(rs.getString(6));%></td>
				<td><%out.println(rs.getString(2));%></td>
				<td>
				<a href="EditData.jsp?id=<%=rs.getInt(1) %>" >Edit</a>
				<a href="deleteData.jsp?id=<%=rs.getInt(1) %>" >Delete</a>
				</td>
				
			</tr>
			<%
			}
			%>

		</tbody>
	</table>

</body>
</html>