import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/admin")

public class admin extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	public void doPost(HttpServletRequest request , HttpServletResponse response) 
			throws ServletException , IOException {
		response.setContentType("html");
		PrintWriter p= response.getWriter();		
		String name ,password;
		name = request.getParameter("name");
		password = request.getParameter("password");
		
		if( name.equals("Vanshika:)") && password.equals("12345")) {
			 response.sendRedirect("adminhome.jsp");  
		}
		else{
			response.setContentType("text/html");
			  p.print("<br><h2><center>Wrong Username or Password !!</center></h2>");
			  RequestDispatcher rd=request.getRequestDispatcher("Admin.jsp");  
			  rd.include(request, response);
		}

	}
}
