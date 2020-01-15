<html>
<head>
<title>Information</title></head>
<%@ page language = "java" session="false" import = "java.sql.Statement,java.sql.ResultSet,java.sql.Connection,java.sql.DriverManager" %>
<body>
<% 
HttpSession session = request.getSession(false);
if (session != null)
{
String userName=(String)session.getAttribute("value");
if (userName.equals("1") )
{
	%>
<%
String name2 = request.getParameter("ct");
try{
    Class.forName("com.mysql.jdbc.Driver");
    String url = "jdbc:mysql://127.0.0.1/test";
    Connection con=DriverManager.getConnection(url, "root", "root");

Statement stmt = con.createStatement();
String query="DELETE FROM job WHERE jontitle = '" + name2 + "'";  
stmt.executeUpdate(query);

%>
<%
stmt.close();
con.close();
}
catch(Exception e){System.out.println("Exception");}
%>

</table>
<%
}
}
%>
</body>
</html>