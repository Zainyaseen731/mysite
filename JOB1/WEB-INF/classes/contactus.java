import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.sql.*;
import EmailSender.Main;



public class contactus extends HttpServlet{

  //Process the HTTP Get request
  public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    
        String name=request.getParameter("ct");
        String m_to =request.getParameter("email");
        String message=request.getParameter("message");
        String  d_email = "bitf17a521@pucit.edu.pk";
        String body="JOb Portal\nName: "+name+"\n"+"Email :"+m_to+"Message :"+"\n\t"+message;
        String d_password = "zainali1";
        String d_host = "smtp.gmail.com";
        String d_port  = "465";
        
        String m_subject = "job portal";
        String m_text = body;
          try{

    Class.forName("com.mysql.jdbc.Driver");

    String url = "jdbc:mysql://127.0.0.1/test";

    Connection con=DriverManager.getConnection(url, "root", "root");

    Statement st=con.createStatement();
  
     String query= "INSERT INTO mail(email,msg)VALUES('"+m_to+ "','"+ body + "');";
     System.out.println(query);
     int rs = st.executeUpdate(query);

     if(rs==1){ 
         Main blah = new Main(d_email,d_password,d_port,d_host,m_to,m_subject,m_text);
        RequestDispatcher rd = request.getRequestDispatcher("emailsent.jsp");
        rd.forward(request,response);

      }

           st.close();
           con.close();

    }catch(Exception e){
      RequestDispatcher rd = request.getRequestDispatcher("error.jsp");
        rd.forward(request,response);
    }
   
}
}

