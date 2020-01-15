import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.sql.*;
import javax.swing.*;


public class Addjob extends HttpServlet {
  
  //Process the HTTP Get request
  public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
  HttpSession session = request.getSession(false);
if (session != null)
{
	response.setContentType("text/html");
    
	// get PrintWriter object
	PrintWriter out = response.getWriter();

    String jontitle=request.getParameter("jname");
    String department=request.getParameter("dep");
    String project=request.getParameter("project");
    String province=request.getParameter("pro");
    String date=request.getParameter("date");

    out.println("<html>");
    out.println("<head><title>Response</title></head>");
    out.println("<body bgcolor=\"#ffffff\">");


    try{

    Class.forName("com.mysql.jdbc.Driver");

    String url = "jdbc:mysql://127.0.0.1/test";

    Connection con=DriverManager.getConnection(url, "root", "root");

    Statement st=con.createStatement();

     
     String query = "INSERT INTO job1(jontitle,department,project,province,date)VALUES('"+ jontitle + "','"+ department + "','"+ project + "','"+ province + "','"+ date + "') ";

     System.out.println(query);

      int rs = st.executeUpdate( query );

     if(rs==1){	out.println("<h1>Insertion successful</h1>");
 RequestDispatcher rd = request.getRequestDispatcher("admin.jsp");
	 
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
}
