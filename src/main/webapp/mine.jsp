<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="java.sql.Connection , java.sql.DriverManager , java.sql.PreparedStatement , 
	java.sql.SQLException , jakarta.servlet.RequestDispatcher , java.sql.ResultSet" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Student Face</title>
</head>
<body>
<br><br>
<h1><center>My Books</center></h1>
 <%! 
 	String name , author , sname;
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

			sname = (String) session.getAttribute("name");
			response.setContentType("text/html");
			Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/database"
					, "root", "mysql");
			
			PreparedStatement p1= connection.prepareStatement("select * from book_rent where stud_name=?");
			p1.setString(1,sname);
			
			ResultSet re= p1.executeQuery();
			
			out.println("<html><body><h2><br><center><table border='4'><tr><td> Book Name </td><td> Author Name</td></tr>");
			while(re.next()){
		
				name= re.getString("book_name");
				author=re.getString("author_name");
				out.println("<tr><td>"+ name+"</td><td>"+author+"</td></tr>");
					
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