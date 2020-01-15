import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.sql.*;
import java.util.*;



public class Search extends HttpServlet {

  //Process the HTTP Get request
  public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    
    PrintWriter out = response.getWriter();

    String uname=request.getParameter("uname");
    String psw=request.getParameter("psw");
    String user=request.getParameter("user");
    out.println("<html>");
    out.println("<head><title>Response</title></head>");
    out.println("<body bgcolor=\"#ffffff\">");


    try{
    Class.forName("com.mysql.jdbc.Driver");

    String url = "jdbc:mysql://127.0.0.1/test";

    Connection con=DriverManager.getConnection(url,"root","root");
    PreparedStatement pst=con.prepareStatement("Select * from data where uname=? AND psw=?");

	
	Scanner inp = new Scanner(System.in);
        pst.setString(1, uname);
	pst.setString(2, psw);
	
	ResultSet rs = pst.executeQuery();
   
     if(rs.next()){
          if(user.equals("admin")){
	    HttpSession session = request.getSession(true);
            session.setAttribute("value","1");
             RequestDispatcher rd = request.getRequestDispatcher("controller.jsp");
	 rd.forward(request,response);	
            }
         else{
              HttpSession session = request.getSession(true);
            session.setAttribute("value","0");
             RequestDispatcher rd = request.getRequestDispatcher("controller.jsp");
	 rd.forward(request,response);
             }
	  }
     
     else{
    	    RequestDispatcher rd = request.getRequestDispatcher("signup.html");
	 
	 rd.forward(request,response);	
          }


out.println("</body></html>");
           pst.close();
           con.close();

    }catch(Exception e){

      out.println(e);
    }

  }

}
