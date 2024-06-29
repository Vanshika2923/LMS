<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Home</title>
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
	margin-left: 130px;
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
<br><br>
<div class="head"> <h1>Admin Home</h1></div>
 		<br>
 		<br>
        
        <div id="container">
 			<div class="button"><a href ="availableBooks.jsp">All Books</a></div>
        
            <div class="button"><a href="insert.jsp">Insert Book</a></div>
       
            <div class="button"><a href="delete.jsp">Delete Book</a></div>
        </div>
        
        
        <br>
        <br>
        
        <div id="container">
            <div class="button"><a href="rentedBooks.jsp">Rented</a></div>
        
            <div class="button"><a href="studData.jsp">Students</a></div>
        
            <div class="button"><a href="logout.html">Logout</a></div>
        </div>
</body>
</html>