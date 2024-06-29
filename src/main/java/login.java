import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
@WebServlet("/login")

public class login extends HttpServlet{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public void doPost(HttpServletRequest request , HttpServletResponse response) 
			throws ServletException , IOException {
		response.setContentType("html");
		PrintWriter out= response.getWriter();
	
		String name ,password,n,p;


		name = request.getParameter("name");
		password = request.getParameter("password");
	
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			try {
				Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/database","root", "mysql");
				PreparedStatement p1= connection.prepareStatement("select * from student");
				ResultSet re= p1.executeQuery();
				while(re.next()){
			
					n= re.getString("name");
					p=re.getString("password");
			
					if( n.equals(name) && p.equals(password)) {
						 response.setContentType("text/html");
						 response.sendRedirect("studhome.jsp"); 
						  
						  HttpSession session = request.getSession();
							session.setAttribute("name", name);
					}
				}
					response.setContentType("text/html");
				  out.print("<br><h2><center>Wrong Username or Password !!</center></h2>");
				  RequestDispatcher rd=request.getRequestDispatcher("stud.jsp");  
				  rd.include(request, response);
			} 
			catch (SQLException ec) {
			// TODO Auto-generated catch block
			ec.printStackTrace();
			}
			
		} catch (ClassNotFoundException ec) {
			// TODO Auto-generated catch block
			ec.printStackTrace();
		}
	}
	

}