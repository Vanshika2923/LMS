<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="java.sql.Connection , java.sql.DriverManager , java.sql.PreparedStatement , 
	java.sql.SQLException , jakarta.servlet.RequestDispatcher , java.sql.ResultSet" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Student Home</title>
<style>

.head {
    display: flex;
  	justify-content: center;
  	align-items: center;
  	color: white;
    height: 200px;
    background-color : rgb(102, 102, 102);
    font-size : 50px;
    }
    
.button{
	display: block;
    margin: 0 auto;
    width: 300px;
    height: 100px;
    border-radius: 30px;
    color: white;
    font-size: 40px;
    cursor: pointer;
     display: flex;
  	justify-content: center;
  	align-items: center;
	margin: 40px;
	margin-left: 110px;
    background: #d4af7a;
    text-transform: uppercase;
	}
	
a{
	text-decoration: none;
	}
	
#container{
	display: flex;
}	
</style>
</head>
<body>

<br><div class="head"> <h1>Student Portal</h1></div>

<br><h1><center>AVAILABLE BOOKS</center></h1>

 <%! 
 	String book , author;
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
			PreparedStatement p1= connection.prepareStatement("select * from book_av");
			ResultSet re= p1.executeQuery();
			
			out.println("<html><body><h2><center><table border='4'><tr><td> Book Name </td><td> Author Name </td></tr>");
			while(re.next()){
		
				book= re.getString("book_name");
				author=re.getString("author_name");
				out.println("<tr><td>"+ book+"</td><td>"+ author+"</td></tr>");
					
				}
			out.println("</table></center></h2></body></html>");
		}
	catch (SQLException ec) {
		// TODO Auto-generated catch block
		ec.printStackTrace();
		}
 %>
 
 <div id="container">
 			<div class="button"><a href ="mine.jsp">Mine</a></div>
        
            <div class="button"><a href="rent.jsp">Rent</a></div>
       
            <div class="button"><a href="return.jsp">Return</a></div>
            
            <div class="button"><a href="logout.html">Logout</a></div>
        </div>
</body>
</html>