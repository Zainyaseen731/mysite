import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.sql.*;
import javax.swing.*;


public class Updates extends HttpServlet {
  
  //Process the HTTP Get request
  public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
  HttpSession session = request.getSession(false);
if (session != null)
{
	response.setContentType("text/html");
    
	// get PrintWriter object
	PrintWriter out = response.getWriter();
    String id=request.getParameter("id1");
    String jontitle=request.getParameter("name1");
    String department=request.getParameter("department1");
    String project=request.getParameter("project1");
    String province=request.getParameter("province1");
    String date=request.getParameter("date1");
    int hay=Integer.parseInt(id);
    out.println("<html>");
    out.println("<head><title>Response</title></head>");
    out.println("<body bgcolor=\"#ffffff\">");


    try{

    Class.forName("com.mysql.jdbc.Driver");

    String url = "jdbc:mysql://127.0.0.1/test";

    Connection con=DriverManager.getConnection(url, "root", "root");

    Statement st=con.createStatement();

     
     String query = "INSERT INTO job1(jontitle,department,project,province,date)VALUES('"+ jontitle + "','"+ department + "','"+ project + "','"+ province + "','"+ date + "') ";
     String q="UPDATE job1 SET jontitle='"+ jontitle + "', department='"+ department + "', project='"+ project + "', province='"+ province + "', date='"+ date + "' WHERE jobid="+hay;
     System.out.println(q);

      int rs = st.executeUpdate( q );

     if(rs==1){	out.println("<h1>Insertion successful</h1>");
 RequestDispatcher rd = request.getRequestDispatcher("update.jsp");
	 
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
