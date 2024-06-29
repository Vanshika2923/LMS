<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="java.sql.Connection , java.sql.DriverManager , java.sql.PreparedStatement , 
	java.sql.SQLException , jakarta.servlet.RequestDispatcher , java.sql.ResultSet" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Face</title>
</head>
<body>
<br><br><br>
<h1><center>STUDENT DATA</center></h1>
 <%! 
 	String id , name , email , password;
 %>
 
 <%
	try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		}
 	catch (ClassNotFoundException ec) {
		// TODO Auto-generated catch block
		ec.printStackTrace();
		}
 
	try {

			response.setContentType("text/html");
			Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/database"
					, "root", "mysql");
			PreparedStatement p1= connection.prepareStatement("select * from student");
			ResultSet re= p1.executeQuery();
			
			out.println("<html><body><h2><br><br><br><center><table border='4'><tr><td> Id </td><td> Student Name</td><td> Email </td><td> Password </td></tr>");
			while(re.next()){
		
				id= re.getString("id");
				name= re.getString("name");
				email=re.getString("email");
				password=re.getString("password");
				out.println("<tr><td>"+id+"</td><td>"+ name+"</td><td>"+ email+"</td><td>"+password+"</td></tr>");
					
				}
			out.println("</table></center></h2></body></html>");
		}
	catch (SQLException ec) {
		// TODO Auto-generated catch block
		ec.printStackTrace();
		}
 %>
</body>
</html>