import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.sql.*;
import java.util.*;



public class Update extends HttpServlet {

  //Process the HTTP Get request
  public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
HttpSession session = request.getSession(false);
if (session != null)
{
String userName=(String)session.getAttribute("value");
if (userName.equals("1") )
{
    
    PrintWriter out = response.getWriter();
    String name2 = request.getParameter("ct");
    out.println("<html>");
    out.println("<head><title>Response</title></head>");
    out.println("<body bgcolor=\"#ffffff\">");


    try{
   
    Class.forName("com.mysql.jdbc.Driver");
    String url = "jdbc:mysql://127.0.0.1/test";
    Connection con=DriverManager.getConnection(url, "root", "root");
String name = "";
String department = "";
String project = "";
String province = "";
String date = "";
int id=0;
Statement stmt = con.createStatement();
String query="select * from job1 where jontitle = '"+name2+"'";  
ResultSet rs = stmt.executeQuery(query);
while(rs.next()) {
 id = rs.getInt("jobid");
 name = rs.getString("jontitle");
 department = rs.getString("department");
 project = rs.getString("project");
 province = rs.getString("province");
 date = rs.getString("date");
 String j=Integer.toString(id);
            session.setAttribute("i",j);
            session.setAttribute("n",name);
            session.setAttribute("de",department);
            session.setAttribute("p", project);
            session.setAttribute("pro", province);
            session.setAttribute("d", date);
            RequestDispatcher rd = request.getRequestDispatcher("update1.jsp");
	    rd.forward(request,response); 
}
out.println("</body></html>");
           stmt.close();
           con.close();

    }catch(Exception e){

      out.println(e);
    }

  }
}
  }
  
}
