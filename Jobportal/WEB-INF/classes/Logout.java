import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.sql.*;


public class Logout extends HttpServlet {

  //Process the HTTP Get request
  public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		if(session!=null){

        // Invalidate the session and removes any attribute related to it
        session.invalidate();
     RequestDispatcher rd = request.getRequestDispatcher("Signin.html");
       rd.forward(request,response);
		}

    
}
}

