import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/signup")

public class signup extends HttpServlet{

	/**
	 * 
	 */
	static String name , email , password;
	
	private static final long serialVersionUID = 1L;
	
	public void doPost(HttpServletRequest request , HttpServletResponse response) 
			throws ServletException , IOException {
		
		response.setContentType("text/html");
		PrintWriter p = response.getWriter();
	
		name = request.getParameter("name");
		email = request.getParameter("email");
		password = request.getParameter("password");
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	try {
		Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/database" 
				, "root" , "mysql");
		PreparedStatement ps = connection.prepareStatement("insert into student (name,email,password)values (?,?,?)");
		
		ps.setString(1,name);
		ps.setString(2,email);
		ps.setString(3,password);
		
		int i = ps.executeUpdate();
		
		HttpSession session = request.getSession();
		session.setAttribute("name", name);
		
		if(i>0) {
			response.setContentType("text/html");
			response.sendRedirect("studhome.jsp");
		}
		
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
		}
	}
}