import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.sql.*;
import javax.swing.*;


public class Insert extends HttpServlet {
  
  //Process the HTTP Get request
  public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
  
	response.setContentType("text/html");
    
	// get PrintWriter object
	PrintWriter out = response.getWriter();

    String fname=request.getParameter("fname");
    String lname=request.getParameter("lname");
    String uname=request.getParameter("uname");
    String email=request.getParameter("email");
    String psw=request.getParameter("psw");
    String cpsw=request.getParameter("cpsw");

    out.println("<html>");
    out.println("<head><title>Response</title></head>");
    out.println("<body bgcolor=\"#ffffff\">");


    try{

    Class.forName("com.mysql.jdbc.Driver");

    String url = "jdbc:mysql://127.0.0.1/test";

    Connection con=DriverManager.getConnection(url, "root", "root");

    Statement st=con.createStatement();

     
     String query = "INSERT INTO data(fnama,lname,uname,email,psw,cpsw)VALUES('"+ fname + "','"+ lname + "','"+ uname + "','"+ email + "','"+ psw + "','" + cpsw+ "') ";

     System.out.println(query);

      int rs = st.executeUpdate( query );

     if(rs==1){	out.println("<h1>Insertion successful</h1>");
 RequestDispatcher rd = request.getRequestDispatcher("Signin.html");
	 
	 rd.forward(request,response);		}
	else{	out.println("<h1>Record could not be inserted.</h1>"); 		}

     out.println("</body></html>");

           st.close();
           con.close();

    }catch(Exception e){

      out.println(e);
    }

  
  }
}
